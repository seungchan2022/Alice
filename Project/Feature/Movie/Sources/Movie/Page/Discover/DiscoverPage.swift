import DesignSystem
import SwiftUI
import ComposableArchitecture

struct DiscoverPage {
  private let store: StoreOf<DiscoverStore>
  @ObservedObject private var viewStore: ViewStoreOf<DiscoverStore>
  
  init(store: StoreOf<DiscoverStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
}

extension DiscoverPage { }

extension DiscoverPage: View {
  var body: some View {
    Text("Discover Page")
  }
}
