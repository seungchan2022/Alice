import SwiftUI

public struct TabNavigationComponent {
  let viewState: ViewState
  let tapAction: (String) -> Void
}

extension TabNavigationComponent: View {
  public var body: some View {
    HStack(spacing: .zero) {
      ForEach(viewState.itemList) { item in
        Button(action: { tapAction(item.matchPath) }) {
          VStack {
            item.icon.image
              .resizable()
              .frame(width: 36, height: 36)
            Text(item.title)
              .font(.system(size: 16))
          }
        }
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
  struct ViewState: Equatable {
    let activeMatchPath: String
    fileprivate let itemList: [ItemComponent]
    
    init(activeMatchPath: String) {
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
  let matchPath: String
  let activeMatchPath: String
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
