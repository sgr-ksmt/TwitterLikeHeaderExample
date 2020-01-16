//  Created by su- on 2020/01/16.
//

import Foundation

extension Comparable {
    func clamp(to limits: ClosedRange<Self>) -> Self {
        return min(max(limits.lowerBound, self), limits.upperBound)
    }
}
