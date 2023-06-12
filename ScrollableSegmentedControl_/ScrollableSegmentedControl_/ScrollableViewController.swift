//
//  ScrollableViewController.swift
//  ScrollableSegmentedControl_
//
//  Created by Mac on 12/06/2023.
//

import UIKit
import ScrollableSegmentedControl

class ScrollableViewController: UIViewController {

    let segmentColors: [String: UIColor] = [
        "Nigeria": .red,
        "Ghana": .blue,
        "Mali": .green,
        "Zambia": .yellow,
        "Egypt": .brown,
        "Kenya": .black,
        "Ethiopia": .systemPink,
        "Cameroun": .cyan,
        "Liberia": .darkGray,
        "Gambia": .gray
    ]

    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var segmentedControl: ScrollableSegmentedControl = {
        let segmentedControl = ScrollableSegmentedControl()
        segmentedControl.segmentStyle = .textOnly
        segmentedControl.backgroundColor = .white
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.insertSegment(withTitle: "Nigeria", at: 0)
        segmentedControl.insertSegment(withTitle: "Ghana", at: 1)
        segmentedControl.insertSegment(withTitle: "Mali", at: 2)
        segmentedControl.insertSegment(withTitle: "Zambia", at: 3)
        segmentedControl.insertSegment(withTitle: "Egypt", at: 4)
        segmentedControl.insertSegment(withTitle: "Kenya", at: 5)
        segmentedControl.insertSegment(withTitle: "Ethiopia", at: 6)
        segmentedControl.insertSegment(withTitle: "Cameroun", at: 7)
        segmentedControl.insertSegment(withTitle: "Liberia", at: 8)
        segmentedControl.insertSegment(withTitle: "Gambia", at: 9)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        segmentedControl.underlineSelected = true

        // Set the text colors for normal and selected segments
        segmentedControl.segmentContentColor = .black
       
        segmentedControl.segmentContentColor = .blue
        segmentedControl.selectedSegmentContentColor = .red
        segmentedControl.backgroundColor = .white
        segmentedControl.fixedSegmentWidth = false

        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white

        // Set the initial background color based on the default selected segment
        let initialSegmentTitle = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) ?? ""
        let initialBackgroundColor = segmentColors[initialSegmentTitle]
        containerView.backgroundColor = initialBackgroundColor
    }

    @objc func segmentedControlValueChanged(_ sender: ScrollableSegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        let selectedSegmentTitle = sender.titleForSegment(at: selectedSegmentIndex) ?? ""
        let backgroundColor = segmentColors[selectedSegmentTitle]

        // Update the view with the selected background color
        containerView.backgroundColor = backgroundColor
    }

    func setupViews() {
        view.addSubview(containerView)
        view.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
}
