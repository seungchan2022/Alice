import DesignSystem
import SwiftUI
import ComposableArchitecture
import Architecture

struct MyListPage {
  private let store: StoreOf<MyListStore>
  @ObservedObject private var viewStore: ViewStoreOf<MyListStore>
  
  init(store: StoreOf<MyListStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
}

extension MyListPage {
  private var tabNavigationComponentViewState: TabNavigationComponent.ViewState {
    .init(activeMatchPath: Link.Movie.Path.myList.rawValue)
  }
}

extension MyListPage: View {
  var body: some View {
    VStack(spacing: .zero) {
      DesignSystemNavigation(
        barItem: .init(
          title: "My List",
          moreActionList: [
            .init(
              image: DesignSystemIcon.sort.image,
              action: { })
          ]),
        title: "My List") {
          Text("My List Page")
        }
      
      TabNavigationComponent(
        viewState: tabNavigationComponentViewState,
        tapAction: { viewStore.send(.routeToTabBarItem($0) )})
    }
    .navigationTitle("")
    .toolbar(.hidden, for: .navigationBar)
    .ignoresSafeArea(.all, edges: .bottom)
  }
}

