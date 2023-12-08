import Foundation
import SwiftUI

public enum DesignSystemColor: Equatable, CaseIterable {
  case label(LabelChip)
  case system(SystemChip)
  case tint(TintChip)
  
  public static var allCases: [Self] {
    LabelChip.allCases.map(Self.label)
    + SystemChip.allCases.map(Self.system)
    + TintChip.allCases.map(Self.tint)
  }
    
  public var color: Color {
    switch self {
    case .label(let chip): chip.color
    case .system(let chip): chip.color
    case .tint(let chip): chip.color
    }
  }
}


extension DesignSystemColor {
  public enum LabelChip: Equatable, CaseIterable {
    case gray
    case ocher
    case sky
    
    var color: Color {
      switch self {
      case .gray:
        Asset.ColorChip.Label.labelGray.swiftUIColor
      case .ocher:
        Asset.ColorChip.Label.labelOcher.swiftUIColor
      case .sky:
        Asset.ColorChip.Label.labelSky.swiftUIColor
      }
    }
    
  }
  
  public enum SystemChip: Equatable, CaseIterable {
    case black
    case white
    
    var color: Color {
      switch self {
      case .black:
        Asset.ColorChip.Sysytem.systemBlack.swiftUIColor
      case .white:
        Asset.ColorChip.Sysytem.systemWhite.swiftUIColor
      }
    }
  }
  
  public enum TintChip: Equatable, CaseIterable {
    case green
    case orange
    case red
    case yellow
    
    var color: Color {
      switch self {
      case .green:
        Asset.ColorChip.Tint.tintGreen.swiftUIColor
      case .orange:
        Asset.ColorChip.Tint.tintOrange.swiftUIColor
      case .red:
        Asset.ColorChip.Tint.tintRed.swiftUIColor
      case .yellow:
        Asset.ColorChip.Tint.tintYellow.swiftUIColor
      }
    }
  }
}
