//
//  Projectile.swift
//  WKDRTC
//
//  Created by Wayne Dahlberg on 3/10/24.
//

import Foundation

class Projectile {
  var position: Point
  var velocity: Vector
  
  init(position: Point, velocity: Vector) {
    self.position = position
    self.velocity = velocity
  }
}
