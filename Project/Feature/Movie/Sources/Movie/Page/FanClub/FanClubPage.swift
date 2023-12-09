import DesignSystem
import SwiftUI
import ComposableArchitecture

struct FanClubPage {
  private let store: StoreOf<FanClubStore>
  @ObservedObject private var viewStore: ViewStoreOf<FanClubStore>
  
  init(store: StoreOf<FanClubStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
}

extension FanClubPage { }

extension FanClubPage: View {
  var body: some View {
    Text("FanClubPage Page")
  }
}

