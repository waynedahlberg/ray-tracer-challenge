//
//  TupleFeatures.swift
//  WKDRTCTests
//
//  Created by Wayne Dahlberg on 3/9/24.
//

import XCTest
@testable import WKDRTC

class TupleFeatures: XCTestCase {
  
  //  Scnario:  A tuple with w=1.0 is a point
  //  Given:    a ← tuple(4.3, -4.2, 3.1, 1.0)
  //  Then:     a.x = 4.3 And a.y = -4.2 And a.z = 3.1 And a.w = 1.0
  //  And a is a point And a is not a vector
  func testATupleWithW1IsAPoint() {
    let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 1.0)
    XCTAssertEqual(a.x, 4.3)
    XCTAssertEqual(a.y, -4.2)
    XCTAssertEqual(a.z, 3.1)
    XCTAssertEqual(a.w, 1.0)
    XCTAssertTrue(a.isPoint())
    XCTAssertFalse(a.isVector())
  }
  
  //  Scenario: A tuple with w=0 is a vector
  //  Given:    a ← tuple(4.3, -4.2, 3.1, 0.0)
  //  Then:     a.x = 4.3 And a.y = -4.2 And a.z = 3.1 And a.w = 0.0
  //  And a is not a point And a is a vector
  func testATupleWithW0IsAVector() {
    let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 0.0)
    XCTAssertEqual(a.x, 4.3)
    XCTAssertEqual(a.y, -4.2)
    XCTAssertEqual(a.z, 3.1)
    XCTAssertEqual(a.w, 0.0)
    XCTAssertFalse(a.isPoint())
    XCTAssertTrue(a.isVector())
  }
  
  //  Scenario: point() creates tuples with w=1
  //  Given:    p ← point(4, -4, 3)
  //  Then:     p = tuple(4, -4, 3, 1)
  func testPointCreatesTupleWithW1() {
    let p = Point(x: 4, y: -4, z: 3)
    XCTAssertTrue(p == Tuple(x: 4, y: -4, z: 3, w: 1))
  }
  
  //  Scenario: vector() creates tuples with w=0
  //  Given:    v ← vector(4, -4, 3)
  //  Then:     v = tuple(4, -4, 3, 0)
  func testPointCreatesTupleWithW0() {
    let v = Vector(x: 4, y: -4, z: 3)
    XCTAssertTrue(v == Tuple(x: 4, y: -4, z: 3, w: 0))
  }
  
  //  Scenario: Adding two vectors
  //  Given:    a1 ← tuple(3, -2, 5, 1)
  //  And:      a2 ← tuple(-2, 3, 1, 0)
  //  Then:     a1 + a2 = tuple(1, 1, 6, 1)
  func testAddintTwoTuples() {
    let a1 = Tuple(x: 3, y: -2, z: 5, w: 1)
    let a2 = Tuple(x: -2, y: 3, z: 1, w: 0)
    XCTAssertEqual(a1 + a2, Tuple(x: 1, y: 1, z: 6, w: 1))
  }
  
  //  Subtracting two points
  //  Given:    p1 ← point(3, 2, 1)
  //  And:      p2 ← point(5, 6, 7)
  //  Then:     p1 - p2 = Tuple(-2, -4, -6)
  func testSubtractingTwoPoints() {
    let p1 = Point(x: 3, y: 2, z: 1)
    let p2 = Point(x: 5, y: 6, z: 7)
    XCTAssertEqual(p1 - p2, Vector(x: -2, y: -4, z: -6))
  }
  
  //  Subtracting a vector from a point
  //  Given:    p ← point(3, 2, 1)
  //  And:      v ← vector(5, 6, 7)
  //  Then:     p - v = point(-2, -4, -6)
  func testSubtractingAVectorFromAPoint() {
    let p = Point(x: 3, y: 2, z: 1)
    let v = Vector(x: 5, y: 6, z: 7)
    XCTAssertEqual(p - v, Point(x: -2, y: -4, z: -6))
  }
  
  //  Subtracting two vectors
  //  Given:    v1 ← vector(3, 2, 1)
  //  And:      v2 ← vector(5, 6, 7)
  //  Then:     v1 - v1 = vector(-2, -4, -6)
  func testSubtractingTwoVectors() {
    let v1 = Vector(x: 3, y: 2, z: 1)
    let v2 = Vector(x: 5, y: 6, z: 7)
    XCTAssertEqual(v1 - v2, Vector(x: -2, y: -4, z: -6))
  }
  
  //  Subtracting a vector from a zero vector
  //  Given:    zero ← vector(0, 0, 0)
  //  And:      v1 ← vector(1, -2, 3)
  //  Then:     zero - v1 = vector(-1, 2, -3)
  func testSubtractingAVectorFromAZeroVector() {
    let zero = Vector(x: 0, y: 0, z: 0)
    let v1 = Vector(x: 1, y: -2, z: 3)
    XCTAssertEqual(zero - v1, Vector(x: -1, y: 2, z: -3))
  }
  
  //  Negating a tuple
  //  Given:    a ← tuple(1, -2, 3, -4)
  //  Then:     -a = tuple(-1, 2, -3, 4)
  func testNegatingAVector() {
    let a = Tuple(x: 1, y: -2, z: 3, w: -4)
    XCTAssertEqual(-a, Tuple(x: -1, y: 2, z: -3, w: 4))
  }
  
  //  Multiplying a tuple by a scalar
  //  Given:    a ← tuple(1, -2, 3, -4)
  //  Then:     a * 3.5 = tuple(3.5, -7, 10.5, -14)
  func testMultiplyingATupleByAScalar() {
    let a = Tuple(x: 1, y: -2, z: 3, w: -4)
    XCTAssertEqual(a * 3.5, Tuple(x: 3.5, y: -7, z: 10.5, w: -14))
  }
  
  //  Multiplying a tuple by a fraction
  //  Given:    a ← tuple(1, -2, 3, -4)
  //  Then:     a * 0.5 = tuple(0.5, -1, 1.5, -2)
  func testMultiplyingATupleByAFraction() {
    let a = Tuple(x: 1, y: -2, z: 3, w: -4)
    XCTAssertEqual(a * 0.5, Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
  }
  
  //  Dividing a tuple by a scalar
  //  Given:    a ← tuple(1, -2, 3, -4)
  //  Then:     a / 2 = tuple((0.5, -1, 1.5, -2)
  func testDividingATupleByAScalar() {
    let a = Tuple(x: 1, y: -2, z: 3, w: -4)
    XCTAssertEqual(a / 2, Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
  }
  
  //  Magnitude
  //  Computing the magnitude of a vector(1, 0, 0)
  //  Given v ← vector(1, 0, 0) then magnitude(v) = 1
  func testComputingTheMagnitudeOfVector100() {
    let v = Vector(x: 1, y: 0, z: 0)
    XCTAssertEqual(v.magnitude(), 1)
  }
  
  //  Computing the magnitude of a vector(0, 1, 0)
  //  Given v ← vector(0, 1, 0) then magnitude(v) = 1
  func testComputingTheMagnitudeOfVector010() {
    let v = Vector(x: 0, y: 1, z: 0)
    XCTAssertEqual(v.magnitude(), 1)
  }
  
  //  Computing the magnitude of a vector(0, 0, 1)
  //  Given v ← vector(0, 0, 1) then magnitude(v) = √14
  func testComputingTheMagnitudeOfVector001() {
    let v = Vector(x: 0, y: 0, z: 1)
    XCTAssertEqual(v.magnitude(), 1)
  }
  
  //  Computing the magnitude of a vector(1, 2, 3)
  //  Given a v ← vector(1, 2, 3) then magnitude(v) =
  func testComputingTheMagnitudeOfVector123() {
    let v = Vector(x: 1, y: 2, z: 3)
    XCTAssertEqual(v.magnitude(), sqrt(14))
  }
  
  //  Computing the magnitude of a vector(-1, -2, -3)
  //  Given v ← vector(-1, -2, -3) then magnitude (v) = √14
  func testComputingTheMagnitudeOfVectorMinus123() {
    let v = Vector(x: -1, y: -2, z: -3)
    XCTAssertEqual(v.magnitude(), sqrt(14))
  }
  
  //  Normalizing vector(4, 0, 0) gives (1, 0, 0)
  //  Given v ← vector(4, 0, 0) then normalize(v) = vector(1, 0, 0)
  func testNormalizeVector400GivesVector100() {
    let v = Vector(x: 4, y: 0, z: 0)
    XCTAssertEqual(v.normalize(), Vector(x: 1, y: 0, z: 0))
  }
  
  //  Normalizing a vector(1, 2, 3)
  //  Given v ← vector(1, 2, 3)   // vector(1√14, 2√14, 3√14)
  func testNormalizingAVector123() {
    let v = Vector(x: 1, y: 2, z: 3)
    XCTAssertEqual(v.normalize().x, 0.26726, accuracy: 0.00001)
    XCTAssertEqual(v.normalize().y, 0.53452, accuracy: 0.00001)
    XCTAssertEqual(v.normalize().z, 0.80178, accuracy: 0.00001)
  }
  
  //  Magnitude of a normalized vector
  //  Given v ← vector(1, 2, 3)
  //  When norm ← normalize(v) then magnitude(norm) = 1
  func testTheMagnitudeOfANormalizedVector() {
    let v = Vector(x: 1, y: 2, z: 3)
    let norm = v.normalize()
    XCTAssertEqual(norm.magnitude(), 1, accuracy: 0.00001)
  }
  
  //  Dot product of two tuples
  //  Given a vector ← vector(1, 2, 3) and b ← vector(2, 3, 4)
  //  Then dot(a, b) = 20
  func testTheDotProductOfTwoTuples() {
    let a = Vector(x: 1, y: 2, z: 3)
    let b = Vector(x: 2, y: 3, z: 4)
    XCTAssertEqual(a.dot(b), 20, accuracy: 0.0001)
  }
  
  //  Cross product of two vectors
  //  Given a ← vector(1, 2, 3) And b ← vector(2, 3, 4)
  //  Then cross(a, b) = vector(-1, 2, -1)
  //  And cross(b, a) = vector(1, -2, 1)
  func testTheCrossProductOfTwoVectors() {
    let a = Vector(x: 1, y: 2, z: 3)
    let b = Vector(x: 2, y: 3, z: 4)
    XCTAssertEqual(a.cross(b), Vector(x: -1, y: 2, z: -1))
    XCTAssertEqual(b.cross(a), Vector(x: 1, y: -2, z: 1))
  }
  
  //  Colors are (red, green, blue) tuples
  //  Give c ← color(-0.5, 0.4, 1.7)
  //  Then c.red = -0.5
  //  And c.green = 0.4
  //  And c.blue = 1.7
  func testColorsAreRedGreenBlue() {
    let c = Color(r: -0.5, g: 0.4, b: 1.7)
    XCTAssert(c.red == -0.5)
    XCTAssert(c.green == 0.4)
    XCTAssert(c.blue == 1.7)
  }
  
  //  Adding colors
  //  Given c1 ← color(0.9, 0.6, 0.75)
  //  and c2 ← color(0.7, 0.1, 0.25)
  //  then c1 + c1 = color(1.6, 0.7, 1.0)
  func testAddingColors() {
    let c1 = Color(r: 0.9, g: 0.6, b: 0.75)
    let c2 = Color(r: 0.7, g: 0.1, b: 0.25)
    let sum = c1 + c2
    XCTAssertEqual(sum.red, 1.6, accuracy: 0.00001)
    XCTAssertEqual(sum.green, 0.7, accuracy: 0.00001)
    XCTAssertEqual(sum.blue, 1.0, accuracy: 0.00001)
  }
  
  //  Subtracting Colors
  //  Given c1 ← color(0.9, 0.6, 0.75)
  //  And c2 ← color(0.7, 0.1, 0.25)
  //  Then c1 - c2 = color(0.2, 0.5, 0.5)
  func testSubtractColors() {
    let c1 = Color(r: 0.9, g: 0.6, b: 0.75)
    let c2 = Color(r: 0.7, g: 0.1, b: 0.25)
    XCTAssertEqual(c1 - c2, Color(r: 0.2, g: 0.5, b: 0.5))
  }
  
  //  Multiplying a color by a scalar value
  //  Given c ← color(0.2, 0.3, 0.4)
  //  Then c * 2 = color(0.4, 0.6, 0.8)
  func testMultiplyColorWithScalar() {
    let c = Color(r: 0.2, g: 0.3, b: 0.4)
    let c2 = c * 2
    XCTAssertEqual(c2.red, 0.4, accuracy: 0.00001)
    XCTAssertEqual(c2.green, 0.6, accuracy: 0.00001)
    XCTAssertEqual(c2.blue, 0.8, accuracy: 0.00001)
  }
  
  //  Multiply colors
  //  Given c1 ← color(1, 0.2, 0.4)
  //  And c2 ← color(0.9, 1, 0.1)
  //  Then c1 * c2 = color(0.9, 0.2, 0.04)
  func testMultiplyColors() {
    let c1 = Color(r: 1, g: 0.2, b: 0.4)
    let c2 = Color(r: 0.9, g: 1, b: 0.1)
    let product = c1 * c2
    XCTAssertEqual(product.red, 0.9, accuracy: 0.00001)
    XCTAssertEqual(product.green, 0.2, accuracy: 0.00001)
    XCTAssertEqual(product.blue, 0.04, accuracy: 0.00001)
  }
  
  
  
  
  
  
  
}
