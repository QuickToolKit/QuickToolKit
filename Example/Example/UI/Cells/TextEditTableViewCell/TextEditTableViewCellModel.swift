//
// Copyright © 2023 QuickToolKit. All rights reserved.
//

import Foundation
import QuickToolKit

public final class TextEditTableViewCellModel: QuickTableViewCellModelProtocol {
    
    public var id: Int?
    
    public var entity: StringIdentifiable?
    
    public var titleText: String?
    
    public init(id: Int? = nil,
                entity: StringIdentifiable? = nil,
                titleText: String? = nil) {
        self.id = id
        self.entity = entity
        self.titleText = titleText
    }
    
    public var type: QuickTableViewCellProtocol.Type {
        TextEditTableViewCell.self
    }
}
