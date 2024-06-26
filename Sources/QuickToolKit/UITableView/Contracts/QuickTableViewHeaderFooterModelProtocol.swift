//
// Copyright © 2023 QuickTableKit. All rights reserved.
//

import UIKit

public protocol QuickTableViewHeaderFooterModelProtocol: AnyObject {
    
    var type: QuickTableViewHeaderFooterViewProtocol.Type { get }
}
