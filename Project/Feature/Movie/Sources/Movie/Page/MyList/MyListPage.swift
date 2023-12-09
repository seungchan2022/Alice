import DesignSystem
import SwiftUI
import ComposableArchitecture

struct MyListPage {
  private let store: StoreOf<MyListStore>
  @ObservedObject private var viewStore: ViewStoreOf<MyListStore>
  
  init(store: StoreOf<MyListStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
}

extension MyListPage { }

extension MyListPage: View {
  var body: some View {
    Text("MyList Page")
  }
}

