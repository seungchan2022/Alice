import Foundation
import Architecture
import ComposableArchitecture
import Domain
import LinkNavigator

struct FanClubEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
}

extension FanClubEnvLive: FanClubEnvType { }

