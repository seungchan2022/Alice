import SwiftUI

struct ColorPreview {
  let viewState: ViewState
}

extension ColorPreview: View {
  var body: some View {
    ScrollView {
      VStack {
        ForEach(viewState.item, id: \.self) { item in
          HStack {
            Rectangle()
              .fill(item)
              .frame(width: 30, height: 30)
            Text(item.description)
          }
        }
      }
    }
  }
}


extension ColorPreview {
  struct ViewState: Equatable {
    let item: [Color]
  }
}

#Preview(body: {
  ColorPreview(viewState: .init(item: DesignSystemColor.allCases.map(\.color)))
})
