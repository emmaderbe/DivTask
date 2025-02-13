import UIKit

import UIKit
import CoreImage

extension UIImage {
    func applyGrayscale() -> UIImage? {
        guard let ciImage = CIImage(image: self) else { return nil }
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(0.0, forKey: kCIInputSaturationKey)
        guard let outputImage = filter?.outputImage,
              let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent)
        else { return nil }

        return UIImage(cgImage: cgImage)
    }
}
