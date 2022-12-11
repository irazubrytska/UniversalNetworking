//
//  Path.swift
//  NetworkFramework
//

/// Represents API endpoint path.
///
/// Types that conform to the `Path` protocol can provide their own representation
/// to be used when implementing endpoint path for any API.
///
/// Conforming to the `Path` Protocol
/// ==================================================
/// An example using a *code block*
///
///     enum ApiPath: Path {
///       case pathV1
///       case pathV2
///
///       var path: String {
///            switch self {
///              case .pathV1:
///                  return "/v1/your/path"
///              case .pathV2:
///                  return "/v2/your/path"
///              }
///          }
///     }
public protocol Path {

    /// A string representation of an API endpoint path.
    var path: String { get }
}
