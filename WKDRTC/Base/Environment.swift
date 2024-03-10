//
//  Environment.swift
//  WKDRTC
//
//  Created by Wayne Dahlberg on 3/10/24.
//

import Foundation

class Environment {
  var gravity: Vector
  var wind: Vector
  
  init(gravity: Vector, wind: Vector) {
    self.gravity = gravity
    self.wind = wind
  }
  
  func tick(proj: Projectile) -> Projectile {
    let pos_tuple = proj.position + proj.velocity
    let vel_tuple = proj.velocity + self.gravity + self.wind
    let new_pos = Point(x: pos_tuple.x, y: pos_tuple.y, z: pos_tuple.z)
    let new_vel = Vector(x: vel_tuple.x, y: vel_tuple.y, z: vel_tuple.z)
    return Projectile(
      position: new_pos,
      velocity: new_vel
    )
  }
}
