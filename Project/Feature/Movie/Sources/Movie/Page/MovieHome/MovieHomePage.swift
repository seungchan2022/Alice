import SwiftUI
import ComposableArchitecture
import DesignSystem
import Domain
import Architecture

struct MovieHomePage {
  private let store: StoreOf<MovieHomeStore>
  @ObservedObject private var viewStore: ViewStoreOf<MovieHomeStore>
  
  init(store: StoreOf<MovieHomeStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
  @State private var search = ""
}

extension MovieHomePage {
  private var tabNavigationComponentViewState: TabNavigationComponent.ViewState {
    .init(activeMatchPath: Link.Movie.Path.movieHome.rawValue)
  }
  
  private var title: String {
    "트롤 밴드 투게더"
  }
  
  private var voteAverage: Double {
    7.2
  }
  
  private var releaseDate: String {
    "2023-11-17"
  }
  
  private var overView: String {
    "전 세계 모든 트롤을 열광케 했던 최고의 아이돌 그룹 ‘브로존’. 역대급 무대 실수와 형제 간의 불화로 결국 해체한 뒤, 모두에게 잊혀 간다. 그러던 어느 날, ‘브로존’의 황금막내 ‘브랜치’는 메인보컬 ‘플로이드’가 슈퍼스타 ‘벨벳’과 ‘비니어’에게 잡혀 재능을 빼앗기고 있다는 소식을 듣는다. 그를 구하기 위해서는 흩어져 있는 ‘브로존’을 재결합하고 완벽한 화음을 되찾아야 하는데… 12월, 가장 짜릿한 컴백 무대의 시작!"
  }
}

extension MovieHomePage: View {
  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {
      DesignSystemNavigation(
        barItem: .init(
          title: "Now Playing",
          moreActionList: [
            .init(
              image: DesignSystemIcon.rectangle.image,
              action: { }),
            .init(
              image: DesignSystemIcon.setting.image,
              action: { }),
          ]),
        title: "") {
          VStack {
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
            }   // 텍스트 필드 (서치)
            
            Divider()
              .padding(.vertical, 8)
            
            // 무비 리스트 표현
            ScrollView {
              LazyVStack {
                ForEach(0..<10, id: \.self) { item in
                  HStack(spacing: 16) {
                                        DesignSystemImage.image.image
//                    Rectangle()
//                      .fill(DesignSystemColor.label(.gray).color.opacity(0.3))
                                          .resizable()
                      .frame(width: 80, height: 120)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                                          .overlay {
                                            RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1)
                                          }
                                          .shadow(radius: 10)
                    
                    VStack(alignment: .leading, spacing: 8) {
                      Text(title)
                        .font(.system(size: 16))
                        .foregroundStyle(DesignSystemColor.label(.ocher).color)
                      
                      HStack {
                        Circle()
                          .trim(from: .zero, to: CGFloat(voteAverage / 10))
                          .stroke(
                            DesignSystemColor.tint(.yellow).color,
                            style: StrokeStyle(
                              lineWidth: 1.5,
                              lineCap: .round,
                              lineJoin: .round,
                              dash: [1, 2]))
//                          .shadow(color: .red, radius: 10, x: 6, y: 6)
                          
                          .rotationEffect(.degrees(-90))
                          .frame(width: 36, height: 36)
                          
                          .overlay {
                            Text("\(Int(voteAverage * 10))%")
                              .font(.system(size: 10))
                              .foregroundStyle(DesignSystemColor.system(.black).color)
                          }
                        
                        
                        Text(releaseDate.formattedDate)
                          .font(.system(size: 14))
                          .foregroundStyle(DesignSystemColor.system(.black).color)
                      }
                      
                      Text(overView)
                        .font(.system(size: 16))
                        .foregroundStyle(DesignSystemColor.label(.gray).color)
                        .lineLimit(3)
                    }
                    
                    DesignSystemIcon.arrow.image
                      .resizable()
                      .frame(width: 10, height: 12)
                      .foregroundStyle(DesignSystemColor.label(.gray).color)
                  }
                  .frame(height: 140)
                  .frame(maxWidth: .infinity)
                  
                  Divider()
                    .padding(.leading, 88)
                }
                .onTapGesture {
                  viewStore.send(.routeToMovieDetail)
                }
              }
            }
          }
        }
      
      TabNavigationComponent(
        viewState: tabNavigationComponentViewState,
        tapAction: { viewStore.send(.routeToTabBarItem($0))})
    }
    .navigationTitle("")
    .toolbar(.hidden, for: .navigationBar)
    .ignoresSafeArea(.all, edges: .bottom)
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
