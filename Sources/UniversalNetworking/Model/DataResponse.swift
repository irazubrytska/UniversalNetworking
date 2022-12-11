//
//  Response.swift
//  NetworkFramework
//

import Foundation

/// Enum that represents response returning either `Data?` or `Error` type.
///
/// This response is to be used when expected fetched data is of type `Data`.
public enum DataResponse {

    /// The returned optional data from presentation service.
    case data(Data?)

    /// The returned error from presentation service.
    case error(Error)
}
