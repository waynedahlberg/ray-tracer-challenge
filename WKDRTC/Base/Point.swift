//
//  Point.swift
//  WKDRTC
//
//  Created by Wayne Dahlberg on 3/9/24.
//

import Foundation
import simd

class Point: Tuple {
    var vector3: simd_double3
    
    init(x: Double, y: Double, z: Double) {
        self.vector3 = simd_double3(x, y, z)
        super.init(x: x, y: y, z: z, w: 1.0)
    }
    
    init(vector: simd_double3) {
        self.vector3 = vector
        super.init(vector: simd_make_double4(vector, 1.0))
    }
    
    static func - (lhs: Point, rhs: Point) -> Vector {
        return Vector(vector: lhs.vector3 - rhs.vector3)
    }
    
    static func - (lhs: Point, rhs: Vector) -> Point {
        return Point(vector: lhs.vector3 - rhs.vector3)
    }

}
