import Foundation
import SwiftUI
import DesignSystem

extension MovieDetailPage {
  struct OverviewComponent {
    let viewState: ViewState
//    var tapAction: (Bool) -> Void
    @State private var isExpandedOverview: Bool = false
  }
}

extension MovieDetailPage.OverviewComponent { }

extension MovieDetailPage.OverviewComponent: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Overview")
        .font(.system(size: 16, weight: .bold))
      
      Text(viewState.overview)
        .foregroundStyle(DesignSystemColor.label(.gray).color)
        .lineLimit(isExpandedOverview ? .none : 4)
      
      Button(action: { isExpandedOverview.toggle() }) {
        
        Text(isExpandedOverview ? "Less"  : "Read More")
          .foregroundStyle(DesignSystemColor.label(.greenSlate).color)
      }
    }
    .padding(.top, 4)
    .padding(.bottom, 12)
    .padding(.horizontal, 16)
  }
}

extension MovieDetailPage.OverviewComponent {
  struct ViewState: Equatable {
    let overview: String
  }
}
