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
    VStack {
      DesignSystemNavigation(
        barItem: .init(
          title: "Selected Movie Title",
          backAction: { 
            print("back")
            viewStore.send(.routeToBack)
          },
          moreActionList: [
            .init(image: DesignSystemIcon.plus.image, action: { })
          ]),
        title: "Selected Movie Title") {
          Text("Selected Movie Detail Page")
        }
    }
    .navigationTitle("")
    .toolbar(.hidden, for: .navigationBar)
  }
}
