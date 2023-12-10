import Foundation
import ComposableArchitecture
import Domain
import Architecture

struct MovieDetailStore {
  let pageID = UUID().uuidString
  let env: MovieDetailEnvType
  
  init(env: MovieDetailEnvType) {
    self.env = env
  }
}

extension MovieDetailStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
        
      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })
        
      case .routeToBack:
        env.routeToBack()
        return .none
        
      case .throwError(let error):
        print(error)
        return .none
      }
    }
  }
}

extension MovieDetailStore {
  struct State: Equatable { }
}

extension MovieDetailStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case routeToBack
    
    case throwError(CompositeError)
  }
}

extension MovieDetailStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
