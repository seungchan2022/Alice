import Foundation
import Architecture
import ComposableArchitecture
import Domain
import LinkNavigator

struct MyListEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
}

extension MyListEnvLive: MyListEnvType { }

