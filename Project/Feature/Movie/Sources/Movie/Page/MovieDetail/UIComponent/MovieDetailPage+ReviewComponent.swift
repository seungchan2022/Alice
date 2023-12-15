import Foundation
import SwiftUI
import DesignSystem

extension MovieDetailPage {
  struct ReviewComponent {
    let viewState: ViewState
    let tapAction: () -> Void
  }
}

extension MovieDetailPage.ReviewComponent { }

extension MovieDetailPage.ReviewComponent: View {
  var body: some View {
    HStack {
      Text("\(viewState.itemListCount) reviews")
        .foregroundStyle(DesignSystemColor.label(.greenSlate).color)
      
      Spacer()
      
      DesignSystemIcon.arrow.image
        .resizable()
        .frame(width: 6, height: 8)
    }
    .onTapGesture {
      tapAction()
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 4)
    
  }
}

extension MovieDetailPage.ReviewComponent {
  struct ViewState: Equatable, Identifiable {
    let id: Int
    let itemListCount: Int
  }
}
