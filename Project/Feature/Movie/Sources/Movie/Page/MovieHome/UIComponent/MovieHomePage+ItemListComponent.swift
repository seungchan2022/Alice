import Foundation
import SwiftUI
import DesignSystem

extension MovieHomePage {
  struct ItemListComponent {
    let viewState: ViewState
    let tapAction: () -> Void
  }
}

extension MovieHomePage.ItemListComponent { }

extension MovieHomePage.ItemListComponent: View {
  var body: some View {
    VStack {
      HStack(spacing: 8) {
        DesignSystemImage.image.image
          .resizable()
          .frame(width: 80, height: 120)
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .overlay {
            RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1)
          }
          .shadow(radius: 10)
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 8) {
          Text(viewState.title)
            .font(.system(size: 16))
            .foregroundStyle(DesignSystemColor.label(.ocher).color)
          
          HStack {
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
                  .foregroundStyle(DesignSystemColor.system(.black).color)
              }
            
            Text(viewState.releaseDate.formattedDate)
              .font(.system(size: 14))
              .foregroundStyle(DesignSystemColor.system(.black).color)
          }
          
          Text(viewState.overView)
            .font(.system(size: 16))
            .foregroundStyle(DesignSystemColor.label(.gray).color)
            .lineLimit(3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
        
        DesignSystemIcon.arrow.image
          .resizable()
          .frame(width: 10, height: 12)
          .foregroundStyle(DesignSystemColor.label(.gray).color)
      }
      .frame(height: 140)
      .frame(maxWidth: .infinity, alignment: .leading)
      
      Divider()
        .padding(.leading, 88)
    }
    .onTapGesture {
      tapAction()
    }
  }
}

extension MovieHomePage.ItemListComponent {
  struct ViewState: Equatable, Identifiable {
    let id: Int
    let title: String
    let voteAverage: Double
    let releaseDate: String
    let overView: String
  }
}

extension String {
  fileprivate var formattedDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    guard let date = dateFormatter.date(from: self) else { return "" }
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "MMM d, yyyy"
    return outputFormatter.string(from: date)
  }
}

