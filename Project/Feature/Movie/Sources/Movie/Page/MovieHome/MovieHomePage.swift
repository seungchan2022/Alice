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
  
  private var searchComponentViewState: SearchComponent.ViewState {
    .init()
  }
  
  private var ItemListComponentViewState: [ItemListComponent.ViewState] {
    [
      .init(
        id: 1,
        title: "트롤 밴드 투게더",
        voteAverage: 7.2,
        releaseDate: "2023-11-17",
        overView:     "전 세계 모든 트롤을 열광케 했던 최고의 아이돌 그룹 ‘브로존’. 역대급 무대 실수와 형제 간의 불화로 결국 해체한 뒤, 모두에게 잊혀 간다. 그러던 어느 날, ‘브로존’의 황금막내 ‘브랜치’는 메인보컬 ‘플로이드’가 슈퍼스타 ‘벨벳’과 ‘비니어’에게 잡혀 재능을 빼앗기고 있다는 소식을 듣는다. 그를 구하기 위해서는 흩어져 있는 ‘브로존’을 재결합하고 완벽한 화음을 되찾아야 하는데… 12월, 가장 짜릿한 컴백 무대의 시작!"),
      .init(
        id: 2,
        title: "레오",
        voteAverage: 7.577,
        releaseDate: "2023-11-17",
        overView: "초등학교 마지막 해를 보내는 아이들. 이 모습을 교실에서 키우는 반려동물의 눈을 통해 바라본다. 성장 스토리를 담은 뮤지컬 코미디로 애덤 샌들러가 반려동물인 도마뱀의 목소리 연기를 선보인다."),
      
        .init(
          id: 3,
          title: "헝거게임: 노래하는 새와 뱀의 발라드",
          voteAverage: 7.289,
          releaseDate: "2023-11-17",
          overView: "반란의 불씨를 잠재우기 위해 시작된 잔인한 서바이벌 헝거게임. 헝거게임 10회를 맞아 ‘멘토제’가 도입되고 ‘스노우’는 12구역의 소녀 ‘루시 그레이’의 멘토가 된다. 그는 몰락한 가문의 영광을 되찾기 위해 ‘루시 그레이’를 헝거게임에서 우승 시키려 수단과 방법을 가리지 않는데…"),
      .init(
        id: 4,
        title: "더 마블스",
        voteAverage: 6.555,
        releaseDate: "2023-11-10",
        overView: "강력한 힘으로 은하계를 수호하는 최강 히어로 캡틴 마블 캐럴 댄버스. 캡틴 마블의 오랜 친구의 딸이자, 빛의 파장을 조작하는 히어로 모니카 램보. 최애 히어로 캡틴 마블의 열렬한 팬인 미즈 마블 카말라 칸. 캡틴 마블에 대한 복수를 꿈꾸는 냉혹한 크리족 리더 다르-벤의 영향으로 세 명의 히어로는 능력을 사용할 때마다 서로의 위치가 뒤바뀌게 된다. 뜻하지 않게 우주와 지구를 넘나들게 되는 예측 불가하고 통제 불가한 상황 속, 다르-벤은 지구를 포함해 캡틴 마블이 고향이라고 부르는 수많은 행성을 모두 파멸시키려 하고, 이를 저지하기 위해 모인 팀 마블스는 하나로 힘을 모으는데…"),
      .init(
        id: 5,
        title: "고지라-1.0",
        voteAverage: 8.414,
        releaseDate: "2023-12-01",
        overView: ""),
    ]
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
            SearchComponent(
              viewState: searchComponentViewState,
              search: $search)
            
            Divider()
              .padding(.vertical, 8)
            
            ScrollView {
              LazyVStack {
                ForEach(ItemListComponentViewState) { item in
                  ItemListComponent(
                    viewState: item,
                    tapAction: { viewStore.send(.routeToMovieDetail) })
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
