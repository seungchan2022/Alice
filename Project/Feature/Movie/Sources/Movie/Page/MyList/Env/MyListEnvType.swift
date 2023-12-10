import Foundation
import ComposableArchitecture
import Domain

protocol MyListEnvType {
  var useCaseGroup: MovieEnvironmentUseable { get }
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
  
  var routeToTabItem: (String) -> Void { get }
}

extension MyListEnvType { }

