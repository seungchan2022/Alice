import SwiftUI

public struct TabNavigationComponent {
  let viewState: ViewState
  let tapAction: (String) -> Void
  
  public init(viewState: ViewState, tapAction: @escaping (String) -> Void) {
    self.viewState = viewState
    self.tapAction = tapAction
  }
}

extension TabNavigationComponent: View {
  public var body: some View {
    HStack(spacing: .zero) {
      ForEach(viewState.itemList) { item in
        Button(action: { tapAction(item.matchPath) }) {
          VStack {
            item.icon.image
              .resizable()
              .frame(width: 28, height: 28)
            Text(item.title)
              .font(.system(size: 12))
          }
        }
//        .frame(width: 50, height: 50)
        .foregroundStyle(Color.buttonColor(isActive: item.isActive))
        
        if viewState.itemList.last != item {
          Spacer()
        }
      }
    }
    .padding(.horizontal, 20)
  }
}

extension TabNavigationComponent {
  public struct ViewState: Equatable {
    let activeMatchPath: String
    fileprivate let itemList: [ItemComponent]
    
    public init(activeMatchPath: String) {
      self.activeMatchPath = activeMatchPath
      self.itemList = [
        .init(
          title: "Movie",
          matchPath: "movieHome",
          activeMatchPath: activeMatchPath,
          icon: .movie),
        .init(
          title: "Discover",
          matchPath: "discover",
          activeMatchPath: activeMatchPath,
          icon: .discover),
        .init(
          title: "Fan Club",
          matchPath: "fanClub",
          activeMatchPath: activeMatchPath,
          icon: .fanClub),
        .init(
          title: "My List",
          matchPath: "myList",
          activeMatchPath: activeMatchPath,
          icon: .myList),
      ]
    }
  }
}

fileprivate struct ItemComponent: Equatable, Identifiable {
  let title: String
  let matchPath: String // 각 tab의 matchPath
  let activeMatchPath: String // tab이 활성화된 탭인지 식별하기 위해
  let icon: DesignSystemIcon
  
  var isActive: Bool {
    matchPath == activeMatchPath
  }
  
  var id: String { matchPath }
}

extension Color {
  fileprivate static func buttonColor(isActive: Bool) -> Color {
    return isActive 
    ? DesignSystemColor.label(.ocher).color
    : DesignSystemColor.label(.gray).color
  }
}

#Preview(body: {
  TabNavigationComponent(
    viewState: .init(activeMatchPath: "movieHome"),
    tapAction: { _ in })
})
