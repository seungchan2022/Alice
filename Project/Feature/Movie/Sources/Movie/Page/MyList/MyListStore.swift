import Foundation
import Architecture
import ComposableArchitecture
import Domain

struct MyListStore {
  let pageID = UUID().uuidString
  let env: MyListEnvType
  
  init(env: MyListEnvType) {
    self.env = env
  }
}

extension MyListStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
        
      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })
        
      case .throwError(let error):
        print(error)
        return .none
      }
    }
  }
}

extension MyListStore {
  struct State: Equatable { }
}

extension MyListStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case throwError(CompositeError)
  }
}

extension MyListStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
