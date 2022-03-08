//
//  FloatingActionButton.swift
//  MyFloatingActionButton
//
//  Created by Pras Adi on 07/03/22.
//

import SwiftUI

struct FloatingActionButton<fabView: View>: ViewModifier {
  let backgroundColor: Color
  var shadowColor: Color = .gray
  var elevation: CGFloat = 1
  var cornerRadius: CGFloat = 24
  let view: fabView
  let action: () -> Void
  var position: FabPosition = .trailing
  
  private let margin: CGFloat = 20
  @State private var viewRect: CGRect = CGRect()
  
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
        .background(backgroundColor.cornerRadius(cornerRadius))
        .padding(16)
        .shadow(color: shadowColor, radius: 3, x: 0, y: elevation)
        .background(
          GeometryGetter(rect: $viewRect)
        )
        .position(x: getXPosition(geo),
                  y: geo.size.height - viewRect.height / 3 - margin)
      }
    }
  }
  
  func getXPosition(_ geo: GeometryProxy) -> CGFloat {
    switch position {
    case .leading:
      return 0 + viewRect.width / 3 + margin
    case .center:
      return geo.size.width / 2
    case .trailing:
      return geo.size.width - viewRect.width / 3 - margin
    }
  }
}

enum FabPosition {
  case leading
  case center
  case trailing
}
