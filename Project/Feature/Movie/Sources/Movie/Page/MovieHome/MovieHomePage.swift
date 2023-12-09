import SwiftUI
import ComposableArchitecture
import DesignSystem
import Domain

struct MovieHomePage {
  private let store: StoreOf<MovieHomeStore>
  @ObservedObject private var viewStore: ViewStoreOf<MovieHomeStore>
  
  init(store: StoreOf<MovieHomeStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension MovieHomePage { }

extension MovieHomePage: View {
  var body: some View {
    Text("Movie Home Page")
  }
}
