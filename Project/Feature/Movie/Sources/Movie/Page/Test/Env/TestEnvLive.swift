import Architecture
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

struct TestEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
}

extension TestEnvLive: TestEnvType { }
