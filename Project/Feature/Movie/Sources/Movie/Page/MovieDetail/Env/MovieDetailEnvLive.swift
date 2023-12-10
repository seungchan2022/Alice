import Foundation
import Architecture
import Domain
import ComposableArchitecture

struct MovieDetailEnvLive {
  let useCaseGroup: MovieEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
}

extension MovieDetailEnvLive: MovieDetailEnvType { }
