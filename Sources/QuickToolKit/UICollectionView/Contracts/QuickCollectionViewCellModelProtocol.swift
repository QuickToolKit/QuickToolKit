//
// Copyright © 2023 QuickTableKit. All rights reserved.
//

import Foundation

public protocol QuickCollectionViewCellModelProtocol: AnyObject {
    
    var type: QuickCollectionViewCellProtocol.Type { get }
    
    var id: Int? { get set }
    
    var entity: (any QuickIdentifiable)? { get set }
}
