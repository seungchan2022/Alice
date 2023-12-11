import SwiftUI

public enum DesignSystemImage {
  
  case image
  
  public var image: Image {
    var image: Image {
      switch self {
      case .image:
        Asset.image.swiftUIImage
      }
    }
    
    return image
  }
}
