//
// Copyright © 2023 QuickTableKit. All rights reserved.
//

import UIKit

open class QuickTableViewController: UITableViewController {
    
    public lazy var collection = QuickTableViewCollection()
    public lazy var tableViewDataSource = QuickTableViewDataSource(collection: collection)
    
    open var contentBackgroundColor: UIColor {
        UIColor.secondarySystemBackground
    }
    
    open var isRefreshIndicationEnable: Bool = false {
        didSet {
            if isRefreshIndicationEnable && refreshControl == nil {
                refreshControl = makeRefreshControl()
            } else if refreshControl != nil && !isRefreshIndicationEnable {
                refreshControl?.removeFromSuperview()
                refreshControl = nil
            }
        }
    }
    
    public var canCloseViewController: Bool = true {
        didSet {
            navigationItem.hidesBackButton = !canCloseViewController
        }
    }
    
    public convenience init() {
        self.init(style: .insetGrouped)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = contentBackgroundColor
        
        setupTableView()
        setupTableData()
    }
    
    open func setupTableView() {
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        tableView.keyboardDismissMode = .interactiveWithAccessory
        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
        tableView.backgroundColor = contentBackgroundColor
    }
    
    open func setupTableData() {
        
    }
    
    open func didTapRefresh() {
        
    }
    
    // swiftlint:disable line_length
    public func reloadTableRowIfPossible<SectionId: RawRepresentable, CellId: RawRepresentable>(sectionId: SectionId, cellId: CellId) where SectionId.RawValue == Int, CellId.RawValue == Int {
        guard let cellIndex = collection.index(cellWithSectionType: sectionId, andCellType: cellId),
              tableView.hasAnyCells() else {
            return
        }
        
        tableView.reloadRows(at: [cellIndex], with: .none)
    }
    
    public func reloadTableSectionIfPossible<SectionId: RawRepresentable>(sectionId: SectionId) where SectionId.RawValue == Int {
        guard let sectionIndex = collection.index(sectionWithType: sectionId),
              tableView.hasAnyCells() else {
            return
        }
        
        tableView.reloadSections([sectionIndex], with: .none)
    }
    
    public func insertTableSectionIfPossible<SectionId: RawRepresentable>(sectionId: SectionId) where SectionId.RawValue == Int {
        guard let sectionIndex = collection.index(sectionWithType: sectionId),
              tableView.hasAnyCells() else {
            return
        }
        
        tableView.insertSections([sectionIndex], with: .fade)
    }
    
    private func makeRefreshControl() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.addAction(for: .valueChanged) { [unowned self] in
            self.didTapRefresh()
        }
        return refreshControl
    }
}
