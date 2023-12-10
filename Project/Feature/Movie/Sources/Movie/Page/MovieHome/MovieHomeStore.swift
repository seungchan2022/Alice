import ComposableArchitecture
import Domain
import Architecture
import Foundation

struct MovieHomeStore {
  let pageID = UUID().uuidString
  let env: MovieHomeEnvType
  
  init(env: MovieHomeEnvType) {
    self.env = env
  }
}

extension MovieHomeStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
        
      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })
        
      case .routeToMovieDetail:
        env.routeToMovieDetail()
        return .none
        
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

extension MovieHomeStore {
  struct State: Equatable { }
}

extension MovieHomeStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case routeToMovieDetail
    
    case routeToTabBarItem(String)
    
    case throwError(CompositeError)
  }
}

extension MovieHomeStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
