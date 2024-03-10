//
//  Canvas.swift
//  WKDRTCTests
//
//  Created by Wayne Dahlberg on 3/10/24.
//

import Foundation

class Canvas {
    
    var width : Int
    var height : Int
    
    var pixels : [Color]
    
    var header : String
    
    init(w: Int, h: Int) {
        self.width = w
        self.height = h
        self.pixels = Array(repeating: Color(r: 0, g: 0, b: 0), count: w * h)
        self.header = String()
        self.header.append("P3\n")
        self.header.append("\(self.width) \(self.height)\n")
        self.header.append("255\n")
    }
    
    func pixel_at(x: Int, y: Int) -> Color {
        return self.pixels[(self.width * y) + x]
    }
    
    func write_pixel(x: Int, y: Int, color: Color) -> Void {
        guard (x < self.width) && (x >= 0) else {
            return
        }
        guard (y < self.height) && (y >= 0) else {
            return
        }
        
        if color.red.isNaN {
            color.red = 1.0
        }
        
        if color.green.isNaN {
            color.green = 1.0
        }
        
        if color.blue.isNaN {
            color.blue = 1.0
        }

        self.pixels[(self.width * y) + x] = color
    }
    
    func canvas_to_ppm() -> String {
        var ppm = self.header + PPMPixels()
        ppm.append("\n")
        return ppm
    }
    
    // Private functions
    
    fileprivate func PPMPixels() -> String {
        var pixel_string = String()
        
        var line : Int = 0
        while line < self.height {
            pixel_string = pixel_string + printPixelLine(line)
            line = line + 1
        }
        
        return pixel_string
    }
    
    fileprivate func printPixel(_ c: Color) -> String {
        var pixel_string = String()
        
        let cal = c * 256
        if cal.red > 255 {
            cal.red = 255
        }
        if cal.green > 255 {
            cal.green = 255
        }
        if cal.blue > 255 {
            cal.blue = 255
        }
        if cal.red < 0 {
            cal.red = 0
        }
        if cal.green < 0 {
            cal.green = 0
        }
        if cal.blue < 0 {
            cal.blue = 0
        }
        pixel_string = "\(Int(cal.red)) \(Int(cal.green)) \(Int(cal.blue))"
        return pixel_string
    }
    
    fileprivate func printPixelLine(_ line: Int) -> String {
        var c : Color
        var row : Int = 0
        var line_string = String()
        
        while row < self.width {
            c = self.pixel_at(x: row, y: line)
            line_string = line_string + printPixel(c)
            row = row + 1
            
            if row < self.width {
                line_string.append(" ")
            } else {
                line_string.append("\n")
            }
        }
        
        var output_string = String()
        var output_char = ""
        
        // Check the length of the line_string and ensure that there is no more than 70 chars between Newlines
        var char_count = 0
        
        for char in line_string {
            char_count = char_count + 1
            
            if char == " " {
                if char_count > 65 {
                    output_char = "\n"
                    output_string.append(output_char)
                    char_count = 0
                } else {
                    output_string.append(char)
                }
            } else {
                output_string.append(char)
            }
        }
        return output_string
    }
    
}
