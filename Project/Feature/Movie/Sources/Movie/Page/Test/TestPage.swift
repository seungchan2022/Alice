import ComposableArchitecture
import DesignSystem
import Domain
import SwiftUI

struct TestPage {
  private let store: StoreOf<TestStore>
  @ObservedObject private var viewStore: ViewStoreOf<TestStore>
  
  init(store: StoreOf<TestStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension TestPage { }

extension TestPage: View {
  var body: some View {
    Text("Test Page")
  }
}
