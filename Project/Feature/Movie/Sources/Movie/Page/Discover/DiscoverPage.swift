import DesignSystem
import SwiftUI
import ComposableArchitecture
import Architecture

struct DiscoverPage {
  private let store: StoreOf<DiscoverStore>
  @ObservedObject private var viewStore: ViewStoreOf<DiscoverStore>
  
  init(store: StoreOf<DiscoverStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
}

extension DiscoverPage {
  private var tabNavigationComponentViewState: TabNavigationComponent.ViewState {
    .init(activeMatchPath: Link.Movie.Path.discover.rawValue)
  }
}

extension DiscoverPage: View {
  var body: some View {
    
    VStack(spacing: .zero) {
      DesignSystemNavigation(
        title: "Discover") {
          Text("Discover Page")
        }
      
//      designsys
      
      TabNavigationComponent(
        viewState: tabNavigationComponentViewState,
        tapAction: { viewStore.send(.routeToTabBarItem($0) )})
    }
    .navigationTitle("")
    .toolbar(.hidden, for: .navigationBar)
    .ignoresSafeArea(.all, edges: .bottom)
  }
}
