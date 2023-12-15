import Foundation
import SwiftUI
import DesignSystem

extension MovieDetailPage {
  struct CastListComponent {
    let viewState: ViewState
  }
}

extension MovieDetailPage.CastListComponent { }

extension MovieDetailPage.CastListComponent: View {
  var body: some View {
    VStack {
      HStack {
        Text("Cast")

        Text("See all")
          .foregroundStyle(DesignSystemColor.label(.greenSlate).color)

        Spacer()

        DesignSystemIcon.arrow.image
          .resizable()
          .frame(width: 6, height: 8)
      }

      ScrollView(.horizontal) {
        LazyHStack(spacing: 12) {
          ForEach(viewState.castList) { item in
            VStack {
              item.profileImage
                .resizable()
                .frame(width: 60, height: 100)
                .overlay(
                  RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                )

              Text(item.name)

              Text(item.character)
                .foregroundStyle(DesignSystemColor.label(.gray).color)
            }
            .lineLimit(0)
            .frame(width: 100)
          }
        }
      }
      .scrollIndicators(.hidden)
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 8)
  }
}

extension MovieDetailPage.CastListComponent {
  struct ViewState: Equatable {
    let castList: [CastItem]
  }
}

extension MovieDetailPage.CastListComponent.ViewState {
  struct CastItem: Equatable, Identifiable {
    let id: Int
    let profileImage: Image
    let name: String
    let character: String
  }
}
