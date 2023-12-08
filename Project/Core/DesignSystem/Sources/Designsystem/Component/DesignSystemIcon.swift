import SwiftUI

public enum DesignSystemIcon {

  case rectangle
  case setting
  case search
  case heart
  case eye
  case pin
  case movie
  case discover
  case fanClub
  case myList
  case arrow
  case add
  case back
  
  public var image: Image {
    var image: Image {
      switch self {
      case .rectangle:
        Image(systemName: "rectangle.3.group.fill")
      case .setting:
        Image(systemName: "gearshape")
      case .search:
        Image(systemName: "magnifyingglass")
      case .heart:
        Image(systemName: "heart")
      case .eye:
        Image(systemName: "eye")
      case .pin:
        Image(systemName: "pin")
      case .movie:
        Image(systemName: "film.fill")
      case .discover:
        Image(systemName: "square.stack.fill")
      case .fanClub:
        Image(systemName: "star.circle.fill")
      case .myList:
        Image(systemName: "heart.circle.fill")
      case .arrow:
        Image(systemName: "chevron.right")
      case .add:
        Image(systemName: "text.badge.plus")
      case .back:
        Image(systemName: "chevron.left")
      }
    }
    return image.renderingMode(.template)
  }  
}


