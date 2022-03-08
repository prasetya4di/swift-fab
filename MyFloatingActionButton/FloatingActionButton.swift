//
//  FloatingActionButton.swift
//  MyFloatingActionButton
//
//  Created by Pras Adi on 07/03/22.
//

import SwiftUI

struct FloatingActionButton<fabView: View>: ViewModifier {
  let backgroundColor: Color
  let view: fabView
  let action: () -> Void
  var position: FabPosition = .trailing
  
  private let margin: CGFloat = 24
  @State private var rect: CGRect = CGRect()
  
  func body(content: Content) -> some View {
    GeometryReader { geo in
      ZStack {
        Color.clear
        content
        Button {
          action()
        } label: {
          view
        }
        .buttonStyle(PlainButtonStyle())
        .background(backgroundColor.cornerRadius(24))
        .padding(16)
        .shadow(color: .gray, radius: 3, x: 0, y: 1)
        .background(
          GeometryGetter(rect: $rect)
        )
        .position(x: getXPosition(geo),
                  y: geo.size.height - margin)
      }
    }
  }
  
  func getXPosition(_ geo: GeometryProxy) -> CGFloat {
    switch position {
    case .leading:
      return 0 + rect.width / 2
    case .center:
      return geo.size.width / 2
    case .trailing:
      return geo.size.width - rect.width / 2
    }
  }
}

enum FabPosition {
  case leading
  case center
  case trailing
}
