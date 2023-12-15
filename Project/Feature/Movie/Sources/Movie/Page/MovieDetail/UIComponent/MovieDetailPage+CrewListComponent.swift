import Foundation
import SwiftUI
import DesignSystem

extension MovieDetailPage {
  struct CrewListComponent {
    let viewState: ViewState
  }
}

extension MovieDetailPage.CrewListComponent { }

extension MovieDetailPage.CrewListComponent: View {
  var body: some View {
    VStack {
      HStack {
        Text("Crew")

        Text("See all")
          .foregroundStyle(DesignSystemColor.label(.greenSlate).color)

        Spacer()

        DesignSystemIcon.arrow.image
          .resizable()
          .frame(width: 6, height: 8)
      }

      ScrollView(.horizontal) {
        LazyHStack(spacing: 12) {
          ForEach(viewState.CrewList) { item in
            VStack {
              item.profileImage
                .resizable()
                .frame(width: 60, height: 100)
                .overlay(
                  RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                )

              Text(item.name)

              Text(item.department)
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

extension MovieDetailPage.CrewListComponent {
  struct ViewState: Equatable {
    let CrewList: [CrewItem]
  }
}

extension MovieDetailPage.CrewListComponent.ViewState {
  struct CrewItem: Equatable, Identifiable {
    let id: Int
    let profileImage: Image
    let name: String
    let department: String
  }
}

