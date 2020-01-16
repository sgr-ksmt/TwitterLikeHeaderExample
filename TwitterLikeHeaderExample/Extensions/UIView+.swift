//  Created by su- on 2020/01/16.
//

import UIKit

extension UIView {
    func circularize() {
        clipsToBounds = true
        layer.cornerRadius = bounds.width / 2
    }
}

