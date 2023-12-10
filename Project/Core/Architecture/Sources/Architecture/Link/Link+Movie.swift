import Foundation

extension Link {
  public enum Movie { }
}

extension Link.Movie {
  public enum Path: String, Equatable {
    case test
    case movieHome
    case movieDetail
    case discover
    case fanClub
    case myList
  }
}
