//
//  GeometryGetter.swift
//  MyFloatingActionButton
//
//  Created by Pras Adi on 07/03/22.
//

import SwiftUI

struct GeometryGetter: View {
  @Binding var rect: CGRect
  
  var body: some View {
    GeometryReader { (g) -> Path in
      DispatchQueue.main.async {
        self.rect = g.frame(in: .global)
      }
      return Path()
    }
  }
}
