//
//  ViewController.swift
//  MySildingCards
//
//  Created by Ismayil Ismayilov on 17.08.22.
//

import UIKit
import Segmentio
import SnapKit

class ViewController: UIViewController {
    
    var segmenController = Segmentio()
    
    private lazy var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentSetup()
        
        configureConstraints()
    }
    
    func configureConstraints() {
        self.view.addSubview(segmenController)
        view.addSubview(myLabel)
        
        segmenController.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.height.equalTo(40)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        
        myLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func segmentSetup() {
        // Switching between segments
        segmenController.valueDidChange = { segmentio, segmentionIndex in
            self.segmentDidChanged(segmentIndex: segmentionIndex)
        }
        
        // States Setup for each segment
        let states = SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 14),
                titleTextColor: UIColor.gray
            ),
            selectedState: SegmentioState(
                backgroundColor: .systemOrange,
                titleFont: UIFont.systemFont(ofSize: 14, weight: .bold),
                titleTextColor: UIColor.systemOrange
            ),
            highlightedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 14),
                titleTextColor: UIColor.clear
            )
        )
        
        
        var content = [SegmentioItem]()
        
        let item1 = SegmentioItem(title: "First Page", image: UIImage.init(named: "apple"))
        let item2 = SegmentioItem(title: "Second Page", image: UIImage.init(named: "apple"))
        let item3 = SegmentioItem(title: "Third Page", image: UIImage.init(named: "apple"))
        
        content.append(item1)
        content.append(item2)
        content.append(item3)
        
        let horizontalSeparatorOptions = SegmentioHorizontalSeparatorOptions( type: SegmentioHorizontalSeparatorType.bottom, height: 0, color: .clear)
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom,
                                                         ratio: 1,
                                                         height: 2,
                                                         color: UIColor.gray)
        
        
        let options = SegmentioOptions(backgroundColor: .clear,
                                       segmentPosition: SegmentioPosition.dynamic,
                                       scrollEnabled: false,
                                       indicatorOptions: indicatorOptions,
                                       horizontalSeparatorOptions: horizontalSeparatorOptions,
                                       verticalSeparatorOptions: nil,
                                       imageContentMode: .bottom,
                                       labelTextAlignment: .center,
                                       labelTextNumberOfLines: 1,
                                       segmentStates: states,
                                       animationDuration: 0)
        
        segmenController.setup(content: content, style: SegmentioStyle.onlyLabel, options: options)
        segmenController.selectedSegmentioIndex = 0
    }
    
    func segmentDidChanged(segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            myLabel.text = "Hello"
        case 1:
            myLabel.text = "Hi"
        case 2:
            myLabel.text = "Hey"
        default:
            break
        }
    }
}

