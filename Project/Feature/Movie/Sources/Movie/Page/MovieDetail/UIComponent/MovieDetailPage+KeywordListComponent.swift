import Foundation
import SwiftUI
import DesignSystem

extension MovieDetailPage {
  struct KeywordListComponent {
    let viewState: ViewState
  }
}

extension MovieDetailPage.KeywordListComponent {
  var keywordList: [ViewState.KeywordItemList.KeywordItem] {
    viewState.keywordBucket.flatMap { $0.keywordItemList }
  }
}

extension MovieDetailPage.KeywordListComponent: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Keywords")
      
      ScrollView(.horizontal) {
        LazyHStack {
          ForEach(keywordList) { item in
            
            Button(action: { }) {
              HStack {
                Text("\(item.name)")
                
                DesignSystemIcon.arrow.image
                  .resizable()
                  .frame(width: 6, height: 8)
              }
              .foregroundStyle(DesignSystemColor.system(.black).color)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.small)
          }
        }
        
      }
      .scrollIndicators(.hidden)
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity)
  }
}

extension MovieDetailPage.KeywordListComponent {
  struct ViewState: Equatable {
    let keywordBucket: [KeywordItemList]
  }
}

extension MovieDetailPage.KeywordListComponent.ViewState {
  struct KeywordItemList: Equatable {
    let keywordItemList: [KeywordItem]
  }
}

extension MovieDetailPage.KeywordListComponent.ViewState.KeywordItemList {
  struct KeywordItem: Equatable, Identifiable {
    let id: Int
    let name: String
  }
}

/*
 "keywords": {
     "keywords": [
       {
         "id": 715,
         "name": "chocolate"
       },
       {
         "id": 4344,
         "name": "musical"
       },
       {
         "id": 9675,
         "name": "prequel"
       }
     ]
   },
 */
