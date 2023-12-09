import Foundation

public enum CompositeError: Error {

  public var message: String {
    return ""
  }
}

extension CompositeError: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.message == rhs.message
  }
}
