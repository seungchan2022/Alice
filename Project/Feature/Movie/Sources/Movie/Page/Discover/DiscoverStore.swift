import Foundation
import Architecture
import ComposableArchitecture
import Domain

struct DiscoverStore {
  let pageID = UUID().uuidString
  let env: DiscoverEnvType
  
  init(env: DiscoverEnvType) {
    self.env = env
  }
}

extension DiscoverStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
        
      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })
        
      case .routeToTabBarItem(let matchPath):
        env.routeToTabItem(matchPath)
        return .none
        
      case .throwError(let error):
        print(error)
        return .none
      }
    }
  }
}

extension DiscoverStore {
  struct State: Equatable { }
}

extension DiscoverStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case routeToTabBarItem(String)
    
    case throwError(CompositeError)
  }
}

extension DiscoverStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
