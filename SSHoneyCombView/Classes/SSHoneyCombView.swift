//
//  SSHoneyCombView.swift
//  Pods
//
//  Created by Sameh Salama on 2/24/17.
//
//

import Foundation
import UIKit

public protocol SSHoneyCombViewDelegate: class {
    func SSHoneyComb(_ SSHoneyComb: SSHoneyCombView, didSelect item: SSHoneyCombObject)
}

public class SSHoneyCombView: UIView {
    
    public weak var delegate: SSHoneyCombViewDelegate?
    
    public var honeyCombObjects: [SSHoneyCombObject] = []
    public var numberOfItemsInRow = 3
    let padding: CGFloat = 8
    var scrollView: UIScrollView!
    var contentView: UIView!
    let rowHeight: CGFloat = 100
    var itemBackgroundImage: UIImage? //= UIImage(named: "hexagon", in: Bundle(identifier: "HoneyCombView"), compatibleWith: nil)
    
    
    override public func willMove(toSuperview newSuperview: UIView?) {
        //self.backgroundColor = .clear
        let frameworkBundle = Bundle(for: SSHoneyCombView.self)
        let imagePath = frameworkBundle.path(forResource: "hexagon", ofType: "png")
        if imagePath != nil {
            itemBackgroundImage = UIImage(contentsOfFile: imagePath!)
        }
        self.layOutItems()
    }
    
    override public func layoutSubviews() {
        self.reloadData()
    }
    
    public func reloadData() {
        for subView in self.subviews {
            subView.removeFromSuperview()
        }
        if self.numberOfItemsInRow < 2 {
            self.numberOfItemsInRow = 3
        }
        self.layOutItems()
    }
    
    
    func layOutItems() {
        
        self.scrollView = UIScrollView(frame: self.bounds)
        scrollView.backgroundColor = .clear
        self.addSubview(self.scrollView)
        
        self.contentView = UIView(frame: CGRect(x: 0, y: (3 * self.padding), width: self.scrollView.bounds.width, height: self.rowHeight))
        self.contentView.backgroundColor = .clear
        self.scrollView.addSubview(self.contentView)
        
        
        for x in 0...self.numberOfRows(numberOfItemsInRow: self.numberOfItemsInRow) {
            
            self.drawRow(rowViewTag: x)
        }
    }
    
    func sortedDataSource() -> [Int:[SSHoneyCombObject]] {
        
        var honeyCombMutableObjects = self.honeyCombObjects
        var sortedDataSource: [Int:[SSHoneyCombObject]] = [:]
        
        for x in 0..<honeyCombMutableObjects.count {
            
            if self.isEven(x) {
                for _ in 0..<self.numberOfItemsInRow {
                    if sortedDataSource[x] != nil {
                        if honeyCombMutableObjects.count > 0 {
                            sortedDataSource[x]?.append(honeyCombMutableObjects.removeFirst())
                        }
                    }
                    else {
                        if honeyCombMutableObjects.count > 0 {
                            sortedDataSource[x] = [honeyCombMutableObjects.removeFirst()]
                        }
                    }
                    
                }
                
            }
            else {
                for _ in 0..<self.numberOfItemsInRow - 1 {
                    if sortedDataSource[x] != nil {
                        if honeyCombMutableObjects.count > 0 {
                            sortedDataSource[x]?.append(honeyCombMutableObjects.removeFirst())
                        }
                    }
                    else {
                        if honeyCombMutableObjects.count > 0 {
                            sortedDataSource[x] = [honeyCombMutableObjects.removeFirst()]
                        }
                    }
                }
                
            }
        }
        return sortedDataSource
    }
    
    func numberOfRows(numberOfItemsInRow: Int) -> Int {
        
        var numberOfRows: Int = 0
        
        if self.honeyCombObjects.count > 0 {
            
            let average: Double = ((2 * Double(numberOfItemsInRow)) - 1) / 2
            let decimal: Double = 1 - ((Double(numberOfItemsInRow) - 1) / Double(numberOfItemsInRow))
            
            let number: Double = Double(self.honeyCombObjects.count) / average
            
            numberOfRows = Int(floor(number))
            
            let remainder: Double = number - Double(numberOfRows)
            
            if remainder >= decimal {
                numberOfRows += 1
            }
        }
        
        return numberOfRows
    }
    
    func drawRow(rowViewTag: Int) {
        
        let remainingItemsCount = self.sortedDataSource()[rowViewTag]?.count //(self.sortedDataSource()[rowViewTag]?.count)!
        if remainingItemsCount != nil {
            
            let itmesInRow = self.numberOfItemsInRow
            let width = self.frame.width
            
            let rowView = UIView()
            rowView.tag = rowViewTag
            rowView.frame.size = CGSize(width: width, height: width * (self.rowHeight/375))
            rowView.backgroundColor = .clear
            
            for x in 0...remainingItemsCount! - 1 {
                
                let item = UIButton()
                item.tintColor = .white
                item.titleLabel?.numberOfLines = 0
                item.titleLabel?.font = UIFont(name: "Verdana", size: 15)!
                if UIDevice.current.userInterfaceIdiom == . pad {
                    item.titleLabel?.font = UIFont(name: "Verdana", size: 30)!
                }
                item.titleLabel?.adjustsFontSizeToFitWidth = true
                item.titleLabel?.lineBreakMode = .byWordWrapping
                item.titleLabel?.textAlignment = .center
                item.titleLabel?.minimumScaleFactor = 0.5
                item.setTitle(self.sortedDataSource()[rowViewTag]?[x].name, for: .normal)
                item.tag = x
                let itemWidth = (width - ((CGFloat(itmesInRow) + 1) * self.padding)) / CGFloat(itmesInRow)
                item.frame.size = CGSize(width: itemWidth, height: itemWidth * (114 / 103))
                rowView.frame.size.height = itemWidth
                
                var centerX: CGFloat!
                
                if self.isEven(rowViewTag) {
                    centerX = ((CGFloat(x + 1)) * self.padding) + ((item.frame.width / 2) * ((2 * CGFloat(x)) + 1))
                }
                else {
                    let widePadding = (width - (CGFloat(itmesInRow - 1) * itemWidth) - (CGFloat(itmesInRow - 1) * self.padding)) / 2
                    centerX = widePadding + ((CGFloat(x)) * self.padding) + ((item.frame.width / 2) * ((2 * CGFloat(x)) + 1)) + (self.padding / 2)
                }
                
                let centerY = rowView.center.y
                item.center = CGPoint(x: centerX, y: centerY)
                item.setBackgroundImage(self.itemBackgroundImage, for: .normal)
                item.addTarget(self, action: #selector(self.didSelect(item:)), for: .touchUpInside)
                rowView.addSubview(item)
            }
            
            rowView.frame.origin = CGPoint(x: 0, y: CGFloat(rowViewTag) * rowView.frame.height)
            
            self.scrollView.contentSize.height += rowView.frame.height
            self.contentView.frame.size.height += rowView.frame.height
            
            if rowViewTag == self.numberOfRows(numberOfItemsInRow: self.numberOfItemsInRow) - 1 {
                self.scrollView.contentSize.height += 6 * self.padding
            }
            
            self.contentView.addSubview(rowView)
        }
        
    }
    
    func didSelect(item: UIButton) {
        delegate?.SSHoneyComb(self, didSelect: self.sortedDataSource()[(item.superview?.tag)!]![item.tag])
    }
    
    func isEven(_ number: Int) -> Bool {
        
        var result: Bool
        
        if number % 2 == 0 {
            result = true
        }
        else {
            result = false
        }
        return result
    }
    
}

