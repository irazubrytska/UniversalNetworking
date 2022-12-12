//
//  Endpoint.swift
//  UniversalNetworking
//

/// Represents API endpoint.
///
/// Types that conform to the `Endpoint` protocol can provide their own representation
/// to be used when implementing endpoint for any API.
///
/// Conforming to the `Endpoint` Protocol
/// ==================================================
/// An example using a *code block*
///
///     struct ApiEndpoint: Endpoint {
///       var scheme: String = "https"
///       var host: String = "www.yourapi.com"
///       var path: Path
///     }
public protocol Endpoint {

    /// The API scheme.
    ///
    /// Usually this property is http or https for secure networking.
    var scheme: String { get }

    /// The API host.
    ///
    /// This property is a string containing the host(i.e. hostname).
    var host: String { get }

    /// The API path.
    ///
    /// This property should be an implementation of the `Path` protocol
    /// and represents path for a specific endpoint.
    var path: Path { get }
}
