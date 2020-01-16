//  Created by su- on 2020/01/16.
//

import UIKit

extension UINavigationController {
    func makeTransparent() {
        isNavigationBarHidden = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = .clear
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
}
