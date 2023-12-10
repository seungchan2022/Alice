import DesignSystem
import SwiftUI
import ComposableArchitecture
import Architecture

struct FanClubPage {
  private let store: StoreOf<FanClubStore>
  @ObservedObject private var viewStore: ViewStoreOf<FanClubStore>
  
  init(store: StoreOf<FanClubStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
}

extension FanClubPage { 
  private var tabNaviagtionComponentViewState: TabNavigationComponent.ViewState {
    .init(activeMatchPath: Link.Movie.Path.fanClub.rawValue)
  }
}

extension FanClubPage: View {
  var body: some View {
    VStack {
      DesignSystemNavigation(
        barItem: .init(title: "Fan Club"),
        title: "Fan Club") {
          Text("Fan Club Page")
        }
      
      TabNavigationComponent(
        viewState: tabNaviagtionComponentViewState,
        tapAction: { viewStore.send(.routeToTabBarItem($0) )})
    }
    .navigationTitle("")
    .toolbar(.hidden, for: .navigationBar)
  }
}

