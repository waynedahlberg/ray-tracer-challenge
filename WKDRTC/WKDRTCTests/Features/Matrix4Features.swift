//
//  Matrix4Features.swift
//  WKDRTCTests
//
//  Created by Wayne Dahlberg on 3/10/24.
//

import Foundation
import simd
import os

import XCTest
@testable import WKDRTC

class Matrix4Features: XCTestCase {
  // Contstructing  and inspecting a 4x4 matrix
  // Given following 4x4 matrix M:
  //  1       2       3       4
  //  5.5     6.5     7.5     8.5
  //  9       10      11      12
  //  13.5    14.5    15.5    16.5
  //  Then M[0,0] = 1 And M[0,3] = 4
  //  And M[1,0] = 5.5 And M[1,2] = 7.5
  //  And M[2,2] = 11 And M[3,0] = 13.5 And M[3,2] = 15.5
  func testConstructingAndInspectingA4x4Matrix() {
    let M4 = Matrix4(
      row0: simd_double4(1,2,3,4),
      row1: simd_double4(5.5, 6.5, 7.5, 8.5),
      row2: simd_double4(9, 10, 11, 12),
      row3: simd_double4(13.5, 14.5, 15.5, 16.5)
    )
    
    XCTAssertEqual(M4[0,0], 1)
    XCTAssertEqual(M4[0,3], 4)
    XCTAssertEqual(M4[1,0], 5.5)
    XCTAssertEqual(M4[1,2], 7.5)
    XCTAssertEqual(M4[2,2], 11)
    XCTAssertEqual(M4[3,0], 13.5)
    XCTAssertEqual(M4[3,2], 15.5)
  }
  
  // Matrixt equality with identical matrices
  // Given the following matrix A:
  // | 1 | 2 | 3 | 4 | | 5 | 6 | 7 | 8 | | 9 | 8 | 7 | 6 | | 5 | 4 | 3 | 2 |
  // And the following matrix B:
  // | 1 | 2 | 3 | 4 | | 5 | 6 | 7 | 8 | | 9 | 8 | 7 | 6 | | 5 | 4 | 3 | 2 |
  // Then A = B
  func testMatrix4EqualityWithIdenticalMatrices() {
    let A = Matrix4(
      row0: simd_double4(1,2,3,4),
      row1: simd_double4(5,6,7,8),
      row2: simd_double4(9,8,7,6),
      row3: simd_double4(5,4,3,2))
    let B = Matrix4(
      row0: simd_double4(1,2,3,4),
      row1: simd_double4(5,6,7,8),
      row2: simd_double4(9,8,7,6),
      row3: simd_double4(5,4,3,2))
    
    XCTAssertTrue(A == B)
  }
  
  // Matrix equality with different matrices
  // Given the following Matrix A
  // | 1 | 2 | 3 | 4 || 5 | 6 | 7 | 8 || 9 | 8 | 7 | 6 || 5 | 4 | 3 | 2 |
  // And the following matrix B:
  // | 2 | 3 | 4 | 5 || 6 | 7 | 8 | 9 || 8 | 7 | 6 | 5 || 4 | 3 | 2 | 1 |
  // Then A != B
  func testMatrix4EqualityWithDifferentMatrices() {
    let A = Matrix4(
      row0: simd_double4(1,2,3,4),
      row1: simd_double4(5,6,7,8),
      row2: simd_double4(9,8,7,6),
      row3: simd_double4(5,4,3,2))
    let B = Matrix4(
      row0: simd_double4(2,3,4,5),
      row1: simd_double4(6,7,8,9),
      row2: simd_double4(8,7,6,5),
      row3: simd_double4(4,3,2,1))
    
    XCTAssertTrue(A != B)
  }
  
  
  
  
  
}
