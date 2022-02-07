//
//  MarkdownBarItem.swift
//  MarkdownDemo
//
//  Created by zxf on 2022/2/7.
//

import SwiftUI

struct MarkdownBarItem: View {
  @Binding var selectedBuilders: [AnyBuilder]
  let builder: AnyBuilder
  
  var body: some View {
    let isSelected = selectedBuilders.contains(builder)
    
    return Button {
      if selectedBuilders.contains(builder) {
        selectedBuilders.removeAll(where: { $0 == builder })
      }
      else {
        selectedBuilders.append(builder)
      }
    } label: {
      Text(.init(builder.style))
        .padding()
        .foregroundColor(isSelected ? .black : .gray)
        .font(.system(size: 18))
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .stroke(isSelected ? .blue : .gray, lineWidth: 2)
        )
    }
  }
}

struct MarkdownBarItem_Previews: PreviewProvider {
  static var previews: some View {
    MarkdownBarItem(
      selectedBuilders: .constant([regularBuilder().asAnyBuilder()]),
      builder: regularBuilder().asAnyBuilder()
    )
  }
}
