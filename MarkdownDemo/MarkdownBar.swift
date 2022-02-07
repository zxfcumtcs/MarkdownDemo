//
//  MarkdownBar.swift
//  MarkdownDemo
//
//  Created by zxf on 2022/2/7.
//

import SwiftUI

struct MarkdownBar: View {
  @Binding var selectedBuilders: [AnyBuilder]
  let allBuilders: [AnyBuilder]
  
  var body: some View {
    HStack(spacing: 10) {
      ForEach(allBuilders) { currentBuilder in
        MarkdownBarItem(selectedBuilders: $selectedBuilders, builder: currentBuilder)
      }
    }
    .frame(maxHeight: 70)
    .padding(.top, 12)
  }
}

struct MarkdownBar_Previews: PreviewProvider {
  static var previews: some View {
    MarkdownBar(
      selectedBuilders: .constant([regularBuilder().asAnyBuilder()]),
      allBuilders: [
        boldBuilder().asAnyBuilder(),
        italicsBuilder().asAnyBuilder(),
        strikethroughBuilder().asAnyBuilder(),
        linkBuilder().asAnyBuilder()
      ]
    )
  }
}
