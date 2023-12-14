import SwiftUI

public struct DesignSystemNavigationBar {
  let title: String?
  let backAction: (() -> Void)?
  let moreActionList: [MoreAction]
  
  public init(
    title: String? = .none,
    backAction: (() -> Void)? = .none,
    moreActionList: [MoreAction] = [])
  {
    self.title = title
    self.backAction = backAction
    self.moreActionList = moreActionList
  }
}

extension DesignSystemNavigationBar {
  var tintColor: Color {
    DesignSystemColor.label(.ocher).color
  }
}

extension DesignSystemNavigationBar: View {
  public var body: some View {
    Rectangle()
      .fill(.clear)
      .overlay(alignment: .leading) {
        if let backAction {
          Button(action: { backAction() }) {
            DesignSystemIcon.back.image
              .resizable()
              .frame(width: 12, height: 18)
              .foregroundStyle(tintColor)
          }
//          .frame(width: 50, height: 50)
        } else {
          EmptyView()
        }
      }
      .overlay(alignment: .center) {
        Text(title ?? "")
          .font(.system(size: 20, weight: .medium))
          .foregroundStyle(tintColor)
      }
      .overlay(alignment: .trailing) {
        HStack(spacing: 20) {
          ForEach(moreActionList) { item in
            Button(action: { item.action() }) {
              item.image
                .resizable()
                .foregroundStyle(tintColor)
                .frame(width: 24, height: 22)
            }
          }
        }
      }
      .frame(maxWidth: .infinity)
      .frame(height: 40)
      
  }
}

extension DesignSystemNavigationBar {
  
  public struct MoreAction: Equatable, Identifiable {
    public let id = UUID().uuidString
    let image: Image
    let action: () -> Void
    
    public init(image: Image, action: @escaping () -> Void) {
      self.image = image
      self.action = action
    }
    
//    public var id: String {
//      
//    }
//    
    public static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.image == rhs.image
    }
  }
}

#Preview(body: {
  DesignSystemNavigationBar(
    title: "title",
//    backAction: { print("back") },
    moreActionList: [
      .init(
        image: DesignSystemIcon.rectangle.image,
        action: { }),
      .init(
        image: DesignSystemIcon.setting.image,
        action: { })
    ])
})
