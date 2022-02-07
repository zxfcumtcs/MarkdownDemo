//
//  AnyBuilder.swift
//  MarkdownDemo
//
//  Created by zxf on 2022/2/7.
//

import Foundation

public struct AnyBuilder: MarkdownBuilder {
  
  public let style: String
  public var id: String { "AnyBuilder-\(style)" }
  
  private let wrappedApply: (String) -> String
    
  public init<B: MarkdownBuilder>(_ builder: B) {
    style = builder.style
    wrappedApply = builder.build(from:)
  }
  
  public func build(from text: String) -> String {
    wrappedApply(text)
  }
  
  public static func == (lhs: AnyBuilder, rhs: AnyBuilder) -> Bool {
    lhs.id == rhs.id
  }
}

public extension MarkdownBuilder {
  func asAnyBuilder() -> AnyBuilder {
    AnyBuilder(self)
  }
}
