import DesignSystem
import SwiftUI
import ComposableArchitecture
import Domain
import Architecture

struct MovieDetailPage {
  private let store: StoreOf<MovieDetailStore>
  @ObservedObject private var viewStore: ViewStoreOf<MovieDetailStore>
  
  init(store: StoreOf<MovieDetailStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension MovieDetailPage {
}

extension MovieDetailPage: View {
  var body: some View {
    Text("Movie Detail Page")
  }
}
