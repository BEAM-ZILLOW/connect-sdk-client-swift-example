//
//  TooltipTableViewCell.swift
//  IngenicoConnectExample
//
//  Created for Ingenico ePayments on 15/12/2016.
//  Copyright © 2016 Global Collect Services. All rights reserved.
//

import Foundation
import UIKit

class TooltipTableViewCell: TableViewCell {
    private var tooltipLabel = UILabel()
    private var tooltipImageContainer = UIImageView()

    override class var reuseIdentifier: String {return "info-cell"}

    var label: String? {
        get {
            return tooltipLabel.text
        }
        set {
            tooltipLabel.text = newValue
        }
    }

    var tooltipImage: UIImage? {
        get {
            return tooltipImageContainer.image
        }
        set {
            tooltipImageContainer.image = newValue
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tooltipImageContainer.contentMode = .scaleAspectFit
        tooltipLabel.font = UIFont.systemFont(ofSize: 10.0)
        tooltipLabel.numberOfLines = 0
        clipsToBounds = true

        contentView.addSubview(tooltipImageContainer)
        contentView.addSubview(tooltipLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.accessoryAndMarginCompatibleWidth()
        let leftMargin = accessoryCompatibleLeftMargin()
        tooltipLabel.frame = CGRect(x: Int(leftMargin), y: 0, width: Int(width - 30), height: 40)

        if let image = tooltipImage {
            let ratio = image.size.width / image.size.height
            tooltipImageContainer.frame = CGRect(x: leftMargin, y: 40, width: 100 * ratio, height: 100)
        } else {
            tooltipImageContainer.frame = CGRect(x: leftMargin, y: 40, width: 0, height: 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        label = nil
        tooltipImage = nil
    }
}
