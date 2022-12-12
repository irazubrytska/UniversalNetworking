//
//  Request.swift
//  UniversalNetworking
//

import Foundation

/// Represents network request.
///
/// Types that conform to the `Request` protocol can provide their own representation
/// of network request.
public protocol Request {
    /// Request HTTP method of type `RequestMethod`.
    var method: RequestMethod { get }
    /// Request endpoint that conforms to `Endpoint` protocol.
    var endpoint: Endpoint { get }
    /// Request headers.
    var headers: [String : String] { get }
    /// Request query items.
    var queryItems: [URLQueryItem] { get }
    /// Request body.
    var httpBody: [String : Any] { get }
}
