import Foundation
import SwiftUI
import DesignSystem

extension MovieDetailPage {
  struct ItemComponent {
    let viewState: ViewState
  }
}

extension MovieDetailPage.ItemComponent { }

extension MovieDetailPage.ItemComponent: View {
  var body: some View {
      VStack(alignment: .leading, spacing: 8) {
        
        HStack(spacing: 12) {
          viewState.poster
            .resizable()
            .frame(width: 80, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
              RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1)
            }
          
          VStack(alignment: .leading, spacing: 4) {
            HStack {
              Text("\(viewState.releaseDate.formattedDate) • ")
              
              Text("\(viewState.runTime) minutes • ")
              
              Text(viewState.status)
            }
            .font(.system(size: 16))
            
            Text("\(viewState.productionCountryItemList.first?.name ?? "")")
              .font(.system(size: 16))
            
            HStack(spacing: 12) {
              Circle()
                .trim(from: .zero, to: CGFloat(viewState.voteAverage / 10))
                .stroke(
                  DesignSystemColor.tint(.yellow).color,
                  style: StrokeStyle(
                    lineWidth: 1.5,
                    lineCap: .round,
                    lineJoin: .round,
                    dash: [1, 2]))
              
                .rotationEffect(.degrees(-90))
                .frame(width: 36, height: 36)
              
                .overlay {
                  Text("\(Int(viewState.voteAverage * 10))%")
                    .font(.system(size: 10))
                }
              Text("\(viewState.voteCount.formattedNumber) ratings")
                .font(.system(size: 14))
            }
            .padding(.top, 8)
          }
          .foregroundStyle(DesignSystemColor.system(.white).color)
        }
        
        ScrollView(.horizontal) {
          LazyHStack {
            ForEach(viewState.genreItemList) { item in
              Button(action: { }) {
                HStack {
                  
                  Text(item.name)
                  
                  DesignSystemIcon.arrow.image
                    .resizable()
                    .frame(width: 6, height: 8)
                }
                .foregroundStyle(DesignSystemColor.system(.black).color)
              }
              .tint(DesignSystemColor.system(.white).color)
              .buttonStyle(.borderedProminent)
              .buttonBorderShape(.capsule)
              .controlSize(.small)
            }
          }
          .padding(.vertical, 8)
        } // 장르
        .scrollIndicators(.hidden)
      } // 맨 위 부분
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
      .frame(maxWidth: .infinity)
      .background(.black.opacity(0.2))
  }
}

extension MovieDetailPage.ItemComponent {
  struct ViewState: Equatable, Identifiable {
    let id: Int
    let poster: Image
    let releaseDate: String
    let runTime: Int
    let status: String
    // production_countries배열의 첫번째 원소의 name
    let productionCountryItemList: [ProductionCountryItem]
//    let productionCountry: String
    let voteAverage: Double
    let voteCount: Int
    let genreItemList: [GenreItem]
//    let genreList: [String]
  }
}

extension MovieDetailPage.ItemComponent.ViewState {
  struct ProductionCountryItem: Equatable {
    let name: String
  }
  
  struct GenreItem: Equatable, Identifiable {
    let id: Int
    let name: String
  }
}

extension String {
  fileprivate var formattedDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    guard let date = dateFormatter.date(from: self) else { return "" }
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "yyyy"
    return outputFormatter.string(from: date)
  }
}

extension Int {
  fileprivate var formattedNumber: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value: self)) ?? ""
  }
}
