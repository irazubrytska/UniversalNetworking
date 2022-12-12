//
//  CodableResponse.swift
//  UniversalNetworking
//

import Foundation

/// Enum that represents response returning either `T: Decodable` or `Error` type.
///
/// This response is to be used when expected fetched data
/// conforms to `Decodable` protocol.
public enum CodableResponse<T: Decodable> {

    /// The returned model from presentation service.
    case model(T)

    /// The returned error from presentation service.
    case error(Error)
}
