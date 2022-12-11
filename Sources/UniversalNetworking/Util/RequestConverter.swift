//
//  RequestConverter.swift
//  NetworkFramework
//

import Foundation

/// Converter from user's custom `Request` to `URLRequest`.
///
/// The class has only one static method.
final class RequestConverter {

    /// Converts `Request` to `URLRequest`.
    ///     - Parameter request: a user's custom request for a specific network call.
    ///     - Returns: Optional `URLRequest?`
    static func makeUrlRequest(from request: Request) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = request.endpoint.scheme
        urlComponents.host = request.endpoint.host
        urlComponents.path = request.endpoint.path.path

        if request.method == .get ||
            request.method == .delete {
            urlComponents.queryItems = request.queryItems
        }

        guard let url = urlComponents.url else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers

        if request.method == .post ||
            request.method == .put ||
            request.method == .patch {
            urlRequest.httpBody = request.httpBody.description.data(using: .utf8)
        }

        return urlRequest
    }
}
