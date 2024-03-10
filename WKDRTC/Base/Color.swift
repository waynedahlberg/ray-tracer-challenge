//
//  Color.swift
//  WKDRTCTests
//
//  Created by Wayne Dahlberg on 3/10/24.
//

import Foundation

class Color: Equatable, CustomStringConvertible {
  
  var red: Double
  var green: Double
  var blue: Double
  
  var description: String {
    return "red=\(red), green=\(green), blue=\(blue)"
  }
  
  init(r: Double, g: Double, b: Double) {
    self.red = r
    self.green = g
    self.blue = b
  }
  
  // Color operations
  static func == (lhs: Color, rhs: Color) -> Bool {
    let epsilon: Double = 0.00001
    if abs(lhs.red - rhs.red) < epsilon &&
        abs(lhs.green - rhs.green) < epsilon &&
        abs(lhs.blue - rhs.blue) < epsilon {
      return true
    } else {
      return false
    }
  }
  
  // Add two colors
  static func + (lhs: Color, rhs: Color) -> Color {
    let red = lhs.red + rhs.red
    let green = lhs.green + rhs.green
    let blue = lhs.blue + rhs.blue
    return Color(r: red, g: green, b: blue)
  }
  
  // Subtract two colors
  static func - (lhs: Color, rhs: Color) -> Color {
    let red = lhs.red - rhs.red
    let green = lhs.green - rhs.green
    let blue = lhs.blue - rhs.blue
    return Color(r: red, g: green, b: blue)
  }
  
  // Multiply a color by a scalar
  static func * (lhs: Color, scalar: Double) -> Color {
    let red = lhs.red * scalar
    let green = lhs.green * scalar
    let blue = lhs.blue * scalar
    return Color(r: red, g: green, b: blue)
  }
  
  // Multiply a color by a color (Hadamard Product)
  static func * (lhs: Color, rhs: Color) -> Color {
    let red = lhs.red * rhs.red
    let green = lhs.green * rhs.green
    let blue = lhs.blue * rhs.blue
    return Color(r: red, g: green, b: blue)
  }
  
}
