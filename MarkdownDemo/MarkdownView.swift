//
//  MarkdownView.swift
//  MarkdownDemo
//
//  Created by zxf on 2022/2/7.
//

import SwiftUI

struct MarkdownView: View {
  private let allBuilders: [AnyBuilder]
  private static let originalText = "Hello, world!"
  
  @State private var selectedBuilders: [AnyBuilder]
  @State private var text: String = Self.originalText

  init() {
    allBuilders = [
      boldBuilder().asAnyBuilder(),
      italicsBuilder().asAnyBuilder(),
      linkBuilder().asAnyBuilder(),
      strikethroughBuilder().asAnyBuilder()
    ]
        
    selectedBuilders = []
  }
  
  var body: some View {
    VStack {
      MarkdownBar(
        selectedBuilders: $selectedBuilders,
        allBuilders: allBuilders
      )
      Text(.init(text))
        .foregroundColor(.black)
        .font(.system(size: 48))
      Spacer()
    }
    .background(.white)
    .onChange(of: selectedBuilders) { _ in transformText() }
  }
  
  func transformText() {
    text = selectedBuilders.reduce(Self.originalText, { partialResult, builder in
      builder.build(from:partialResult)
    })
  }
}

struct MarkdownView_Previews: PreviewProvider {
  static var previews: some View {
    MarkdownView()
  }
}

