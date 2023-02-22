//
//  Extensions.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 22/02/2023.
//

import Foundation
import UIKit
import SwiftUI

extension Array {
    func adding(_ element: Element, afterEvery n: Int) -> [Element] {
        guard n > 0 else { fatalError("After Every shouldn't be Zero") }
        let newcount = self.count + self.count / n
        return (0 ..< newcount).map { (i: Int) -> Element in
            (i + 1) % (n + 1) == 0 ? element : self[i - i / (n + 1)]
        }
    }
}

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

extension String {
    var toURL: URL? {
        return URL(string: self)
    }
}

extension UIImage {
    var toSUImage: Image {
        return Image(uiImage: self)
    }
}

extension UIColor {
    var toSUColor: Color {
        return Color(self)
    }
}

