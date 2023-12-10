import SwiftUI
import ComposableArchitecture
import DesignSystem
import Domain
import Architecture

struct MovieHomePage {
  private let store: StoreOf<MovieHomeStore>
  @ObservedObject private var viewStore: ViewStoreOf<MovieHomeStore>
  
  init(store: StoreOf<MovieHomeStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension MovieHomePage { 
  private var tabNavigationComponentViewState: TabNavigationComponent.ViewState {
    .init(activeMatchPath: Link.Movie.Path.movieHome.rawValue)
  }
}

extension MovieHomePage: View {
  var body: some View {
    VStack(alignment: .leading) {
      DesignSystemNavigation(
        barItem: .init(
          title: "Now Playing",
          moreActionList: [
            .init(
              image: DesignSystemIcon.rectangle.image,
              action: { }),
            .init(
              image: DesignSystemIcon.setting.image,
              action: { }),
          ]),
        title: "Now Playing") {
          VStack {
            Text("Movie Home Page")
            
            Button(action: { viewStore.send(.routeToMovieDetail) }) {
              Text("Go To Movie Detail")
            }
          }
        }
      
      TabNavigationComponent(
        viewState: tabNavigationComponentViewState,
        tapAction: { viewStore.send(.routeToTabBarItem($0))})
    }
    .navigationTitle("")
    .toolbar(.hidden, for: .navigationBar)
  }
}
