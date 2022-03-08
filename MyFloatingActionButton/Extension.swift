//
//  Extension.swift
//  MyFloatingActionButton
//
//  Created by Pras Adi on 07/03/22.
//

import SwiftUI

extension View {
  func floatingActionButton<fabView: View> (
    backgroundColor: Color,
    content: fabView,
    position: FabPosition = .trailing,
    shadowColor: Color = .gray,
    cornerRadius: CGFloat = 24,
    elevation: CGFloat = 1,
    action: @escaping () -> Void
  ) -> some View {
    self.modifier(
      FloatingActionButton(
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        elevation: elevation,
        cornerRadius: cornerRadius,
        view: content,
        action: action,
        position: position
      )
    )
  }
}
