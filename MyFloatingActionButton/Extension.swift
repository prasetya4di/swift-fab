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
    action: @escaping () -> Void
  ) -> some View {
    self.modifier(
      FloatingActionButton(
        backgroundColor: backgroundColor,
        view: content,
        action: action,
        position: position
      )
    )
  }
}
