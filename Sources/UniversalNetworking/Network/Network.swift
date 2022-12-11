//
//  Network.swift
//  NetworkFramework
//

import Foundation

/// Class for performing network requests.
///
/// This class is used as the main class for networking and provides
/// universal methods to make a network request.
public class Network {
    private let session = URLSession.shared

    public init() {}

    // MARK: Data

    /// Performs network request returning `DataResponse` in completion.
    /// - Parameters:
    ///    - request: a user's custom request for a specific network call
    ///    - completion: completion handler that returns response of type `DataResponse`
    public func perform(_ request: Request, completion: @escaping (DataResponse) -> ()) throws {
        guard let urlRequest = RequestConverter.makeUrlRequest(from: request) else {
            throw NetworkError.invalidUrl
        }

        session.dataTask(with: urlRequest) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.isError() {
                completion(.error(NetworkError.default(httpResponse.description)))
            }
            else if let error = error {
                completion(.error(error))
            } else {
                completion(.data(data))
            }
        }.resume()
    }

    /// Performs network request asynchronously returning `Data`.
    /// - Parameters:
    ///    - request: a user's custom request for a specific network call
    /// - Returns: `Data` from repsonse
    public func perform(_ request: Request) async throws -> Data {
        guard let urlRequest = RequestConverter.makeUrlRequest(from: request) else {
            throw NetworkError.invalidUrl
        }

        let (data, response) = try await session.data(for: urlRequest)
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.isError() {
            throw NetworkError.default(httpResponse.description)
        }
        return data
    }

    // MARK: Model

    /// Performs network request returning `CodableResponse` in completion.
    /// - Parameters:
    ///    - request: a user's custom request for a specific network call
    ///    - responseType: type to be fetched which conforms to `Decodable` protocol
    ///    - completion: completion handler that returns response of type `CodableResponse`
    public func perform<T: Decodable>(_ request: Request, responseType: T.Type, completion: @escaping (CodableResponse<T>) -> ()) throws {
        guard let urlRequest = RequestConverter.makeUrlRequest(from: request) else {
            throw NetworkError.invalidUrl
        }

        session.dataTask(with: urlRequest) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.isError() {
                completion(.error(NetworkError.default(httpResponse.description)))
            }
            else if let error = error {
                completion(.error(error))
            } else {
                guard let data = data else {
                    completion(.error(NetworkError.noData))
                    return
                }
                guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(.error(NetworkError.cannotDecode))
                    return
                }
                completion(.model(decoded))
            }
        }.resume()
    }

    /// Performs network request asynchronously returning `T: Decodable`.
    /// - Parameters:
    ///    - request: a user's custom request for a specific network call
    ///    - responseType: type to be fetched which conforms to `Decodable` protocol
    /// - Returns: `T: Decodable` from repsonse
    public func perform<T: Decodable>(_ request: Request, responseType: T.Type) async throws -> T {
        guard let urlRequest = RequestConverter.makeUrlRequest(from: request) else {
            throw NetworkError.invalidUrl
        }

        let (data, response) = try await session.data(for: urlRequest)

        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.isError() {
            throw NetworkError.default(httpResponse.description)
        }

        guard let decoded = try? JSONDecoder().decode(responseType, from: data) else {
            throw NetworkError.cannotDecode
        }

        return decoded
    }
}

private extension HTTPURLResponse {
    func isError() -> Bool {
        self.statusCode >= 400
    }
}
