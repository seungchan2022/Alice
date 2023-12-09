import Domain
import Foundation
import LinkNavigator
import Platform
import Movie

struct AppSideEffect: DependencyType, MovieEnvironmentUseable {
  
}

extension AppSideEffect {
  static func build() -> Self {
    .init()
  }
}
