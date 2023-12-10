import SwiftUI

public struct DesignSystemNavigation<Content: View> {
  let barItem: DesignSystemNavigationBar?
  let title: String?
  let content: Content
  
  public init(
    barItem: DesignSystemNavigationBar? = .none,
    title: String?,
    @ViewBuilder content: @escaping () -> Content)
  {
    self.barItem = barItem
    self.title = title
    self.content = content()
  }
}

extension DesignSystemNavigation {
  var tintColor: Color {
    DesignSystemColor.label(.ocher).color
  }
}

extension DesignSystemNavigation: View {
  public var body: some View {
    VStack(alignment: .leading) {
      if let barItem {
        barItem
          .padding(.horizontal, 24)
      }
      ScrollView {
        if let title {
          Text(title)
            .font(.largeTitle)
            .foregroundStyle(tintColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
            .padding(.vertical, 16)
        }
        
        content
          .padding(.horizontal, 16)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview(body: {
  DesignSystemNavigation(
    barItem: .init(
      title: "test",
//      backAction: { },
      moreActionList: [
        .init(
          image: DesignSystemIcon.rectangle.image,
          action: { }),
        .init(
          image: DesignSystemIcon.setting.image,
          action: { })
      ]),
    title: "test",
    content: {
      Text("test1")
      Text("test2")
    })
})
