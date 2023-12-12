import Foundation
import SwiftUI
import DesignSystem

extension MovieHomePage {
  struct SearchComponent {
    let viewState: ViewState
    
    @Binding var search: String
  }
}

extension MovieHomePage.SearchComponent { }

extension MovieHomePage.SearchComponent: View {
  var body: some View {
    HStack(spacing: 16) {
      DesignSystemIcon.search.image
        .resizable()
        .frame(width: 18, height: 18)
      
      TextField(
        "",
        text: $search,
        prompt: Text("Search any movies or person"))
      .textFieldStyle(.roundedBorder)
      .frame(height: 30)
      .frame(maxWidth: .infinity)
      .padding(.trailing, 24)
    }
  }
}

extension MovieHomePage.SearchComponent {
  struct ViewState: Equatable {
  }
}
