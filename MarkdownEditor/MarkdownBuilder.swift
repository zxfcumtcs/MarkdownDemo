//
//  MarkdownBuilder.swift
//  MarkdownDemo
//
//  Created by zxf on 2022/2/7.
//

import Foundation

public protocol MarkdownBuilder: Equatable, Identifiable {
  var style: String { get }
  func build(from text: String) -> String
}

extension MarkdownBuilder {
  public var id: String { style }
}

fileprivate struct RegularBuilder: MarkdownBuilder {
  public var style: String { "Regular" }
  
  public func build(from text: String) -> String { text }
}

fileprivate struct ItalicsBuilder: MarkdownBuilder {
  public var style: String { "*Italics*" }
  
  public func build(from text: String) -> String { "*\(text)*" }
}

fileprivate struct BoldBuilder: MarkdownBuilder {
  public var style: String { "**Bold**" }
  
  public func build(from text: String) -> String { "**\(text)**" }
}

fileprivate struct StrikethroughBuilder: MarkdownBuilder {
  public var style: String { "~Strikethrough~" }
  
  public func build(from text: String) -> String { "~\(text)~" }
}

fileprivate struct LinkBuilder: MarkdownBuilder {
  public var style: String { "[Link](link)" }
  
  public func build(from text: String) -> String { "[\(text)](https://github.com)"}
}

public func regularBuilder() -> some MarkdownBuilder {
  RegularBuilder()
}

public func italicsBuilder() -> some MarkdownBuilder {
  ItalicsBuilder()
}

public func boldBuilder() -> some MarkdownBuilder {
  BoldBuilder()
}

public func strikethroughBuilder() -> some MarkdownBuilder {
  StrikethroughBuilder()
}

public func linkBuilder() -> some MarkdownBuilder {
  LinkBuilder()
}
