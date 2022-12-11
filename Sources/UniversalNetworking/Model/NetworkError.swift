//
//  NetworkError.swift
//  NetworkFramework
//

/// Represents custom network error.
public enum NetworkError: Error, CustomStringConvertible {

    /// Invalid URL
    case invalidUrl
    /// No data fetched
    case noData
    /// Cannot decode type
    case cannotDecode
    ///
    case `default`(String)

    /// A textual representation of the given error.
    public var description: String {
        switch self {
        case .invalidUrl:
            return "The given URL is invalid"
        case .noData:
            return "No data fetched"
        case .cannotDecode:
            return "Cannot decode given type from fetched data"
        case .`default`(let description):
            return description
        }
    }
}
