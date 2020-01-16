//  Created by su- on 2020/01/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var profileImageContainerViewWidth: NSLayoutConstraint!
    @IBOutlet private weak var profileImageContainerView: UIView!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var headerBlurView: UIVisualEffectView!
    @IBOutlet private weak var headerUserNameLabel: UILabel!
    @IBOutlet private weak var userIDLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var numberOfTweetsLabel: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var navigationBarBackingView: UIView!

    private let user = TwitterUser(
        userID: "_sgr_ksmt",
        name: "su-@Flutter修行中",
        iconImage: #imageLiteral(resourceName: "Image"),
        headerImage: #imageLiteral(resourceName: "Header"),
        numberOfTweets: 31234
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.makeTransparent()

        userIDLabel.text = "@\(user.userID)"
        headerUserNameLabel.text = user.name
        userNameLabel.text = user.name
        profileImageView.image = user.iconImage
        headerImageView.image = user.headerImage
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberOfTweetsLabel.text = "\(numberFormatter.string(from: NSNumber(value: user.numberOfTweets)) ?? "0") Tweets"
        headerBlurView.alpha = 0.0

        scrollView.delegate = self
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let profileContainerWidth: CGFloat = {
            let min = type(of: self).Metrics.ProfileIconWidth.min
            let max = type(of: self).Metrics.ProfileIconWidth.max
            let width = type(of: self).Metrics.ProfileIconWidth.max - scrollView.contentOffset.y
            return width.clamp(to: min...max)
        }()

        profileImageContainerViewWidth.constant = profileContainerWidth
        profileImageContainerView.circularize()
        profileImageView.circularize()
        
        if profileContainerWidth > type(of: self).Metrics.ProfileIconWidth.min {
            scrollView.bringSubviewToFront(profileImageContainerView)
        } else {
            scrollView.bringSubviewToFront(headerView)
        }

        headerBlurView.alpha = ((scrollView.contentOffset.y - 40) / navigationBarBackingView.frame.height)
            .clamp(to: (0.0...1.0))
    }
}

extension ViewController {
    enum Metrics {
        enum ProfileIconWidth {
            static let min: CGFloat = 40.0
            static let max: CGFloat = 80.0
        }
    }
}
