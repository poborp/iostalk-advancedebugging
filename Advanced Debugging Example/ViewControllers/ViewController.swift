//
//  ViewController.swift
//  Advanced Debugging Example
//
//  Created by Jacobo Rodriguez on 20/08/18.
//  Copyright © 2018 Jacobo Rodriguez. All rights reserved.
//
//  More Info: https://ncalculators.com/number-conversion/pythagoras-theorem.htm
//

import UIKit

class ViewController: UIViewController {
    
    var aValue: Float?
    var bValue: Float?
    var hValue: Float?
    
    var container: UIView?
    var aButton: UIButton?
    var bButton: UIButton?
    var triangleView: TriangleView?
    var label: UILabel?
    var aLabel: UILabel?
    var bLabel: UILabel?
    var hLabel: UILabel?
    var resultLabel: UILabel?
    var button: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pythagorean Theorem"
        
        aValue = 3
        bValue = 6
        
        container = UIView()
        container?.translatesAutoresizingMaskIntoConstraints = false
        container?.backgroundColor = .clear
        container?.layer.borderWidth = 0
        view.addSubview(container!)

        aButton = UIButton()
        aButton?.translatesAutoresizingMaskIntoConstraints = false
        aButton?.backgroundColor = .lightGray
        aButton?.layer.cornerRadius = 4
        aButton?.setTitle("a", for: .normal)
        aButton?.setTitleColor(.white, for: .normal)
        aButton?.setTitleColor(.darkGray, for: .highlighted)
        aButton?.titleLabel?.font = .boldSystemFont(ofSize: 16)
        aButton?.addTarget(self, action: #selector(didPressChangeValueButton(button:)), for: .touchUpInside)
        container?.addSubview(aButton!)
        
        bButton = UIButton()
        bButton?.translatesAutoresizingMaskIntoConstraints = false
        bButton?.backgroundColor = .lightGray
        bButton?.layer.cornerRadius = 4
        bButton?.setTitle("b", for: .normal)
        bButton?.setTitleColor(.white, for: .normal)
        bButton?.setTitleColor(.darkGray, for: .highlighted)
        bButton?.titleLabel?.font = .boldSystemFont(ofSize: 16)
        bButton?.addTarget(self, action: #selector(didPressChangeValueButton(button:)), for: .touchUpInside)
        container?.addSubview(bButton!)
        
        triangleView = TriangleView()
        triangleView?.translatesAutoresizingMaskIntoConstraints = false
        container?.addSubview(triangleView!)
        
        aLabel = UILabel()
        aLabel?.translatesAutoresizingMaskIntoConstraints = false
        aLabel?.layer.borderWidth = 0
        aLabel?.text = "a"
        aLabel?.textAlignment = .center
        aLabel?.font = .systemFont(ofSize: 18)
        container?.addSubview(aLabel!)
        
        bLabel = UILabel()
        bLabel?.translatesAutoresizingMaskIntoConstraints = false
        bLabel?.layer.borderWidth = 0
        bLabel?.text = "b"
        bLabel?.textAlignment = .center
        bLabel?.font = .systemFont(ofSize: 18)
        container?.addSubview(bLabel!)
        
        hLabel = UILabel()
        hLabel?.translatesAutoresizingMaskIntoConstraints = false
        hLabel?.layer.borderWidth = 0
        hLabel?.text = "h"
        hLabel?.textAlignment = .center
        hLabel?.font = .systemFont(ofSize: 18)
        container?.addSubview(hLabel!)
        
        label = UILabel()
        label?.translatesAutoresizingMaskIntoConstraints = false
        label?.layer.borderWidth = 0
        label?.text = "h2 = a2 + b2"
        label?.textAlignment = .center
        label?.font = .systemFont(ofSize: 18)
        label?.numberOfLines = 0
        container?.addSubview(label!)
        
        resultLabel = UILabel()
        resultLabel?.translatesAutoresizingMaskIntoConstraints = false
        resultLabel?.text = ""
        resultLabel?.textAlignment = .center
        resultLabel?.font = .boldSystemFont(ofSize: 20)
        view.addSubview(resultLabel!)
        
        button = UIButton()
        button?.translatesAutoresizingMaskIntoConstraints = false
        button?.backgroundColor = .darkGray
        button?.layer.cornerRadius = 4
        button?.setTitle("Calculate", for: .normal)
        button?.setTitleColor(.white, for: .normal)
        button?.setTitleColor(.lightGray, for: .highlighted)
        button?.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button?.addTarget(self, action: #selector(didPressCalculateButton(button:)), for: .touchUpInside)
        view.addSubview(button!)

        addCustomConstraints()
        updateLabels()
    }
    
    func addCustomConstraints() {
        // View
        NSLayoutConstraint.activate([
            container!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            container!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            container!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            button!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            button!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            button!.topAnchor.constraint(equalTo: container!.bottomAnchor, constant: 10),
            button!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button!.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        // Container
        NSLayoutConstraint.activate([
            aButton!.leadingAnchor.constraint(equalTo: container!.leadingAnchor, constant: 10),
            aButton!.widthAnchor.constraint(equalToConstant: 100),
            aButton!.topAnchor.constraint(equalTo: container!.topAnchor, constant: 0), //FIXME: constant: 10
            aButton!.heightAnchor.constraint(equalToConstant: 40),
            
            bButton!.leadingAnchor.constraint(equalTo: aButton!.trailingAnchor, constant: 0), //FIXME: constant: 20
            bButton!.widthAnchor.constraint(equalToConstant: 100),
            bButton!.topAnchor.constraint(equalTo: container!.topAnchor, constant: 10),
            bButton!.heightAnchor.constraint(equalTo: aButton!.heightAnchor),
            
            triangleView!.leadingAnchor.constraint(equalTo: container!.leadingAnchor, constant: 20),
            triangleView!.trailingAnchor.constraint(equalTo: container!.trailingAnchor, constant: -20),
            triangleView!.centerYAnchor.constraint(equalTo: container!.centerYAnchor, constant: -80),
            triangleView!.heightAnchor.constraint(equalTo: triangleView!.widthAnchor, constant: 0),
            
            hLabel!.centerXAnchor.constraint(equalTo: triangleView!.centerXAnchor, constant: -15),
            hLabel!.centerYAnchor.constraint(equalTo: triangleView!.centerYAnchor, constant: -15),
            
            aLabel!.trailingAnchor.constraint(equalTo: triangleView!.trailingAnchor, constant: -10),
            aLabel!.centerYAnchor.constraint(equalTo: triangleView!.centerYAnchor, constant: 0),
            
            bLabel!.centerXAnchor.constraint(equalTo: triangleView!.centerXAnchor, constant: 0),
            bLabel!.bottomAnchor.constraint(equalTo: triangleView!.bottomAnchor, constant: -5),
            
            label!.leadingAnchor.constraint(equalTo: container!.leadingAnchor, constant: 20),
            label!.trailingAnchor.constraint(equalTo: container!.trailingAnchor, constant: -20),
            label!.topAnchor.constraint(equalTo: triangleView!.bottomAnchor, constant: 30),
            
            resultLabel!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            resultLabel!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            resultLabel!.topAnchor.constraint(equalTo: label!.bottomAnchor, constant: 20),
            ])
    }
    
    func updateLabels() {
        aButton?.setTitle(String(format: "a = %.0f", aValue!), for: .normal)
        bButton?.setTitle(String(format: "b = %.0f", bValue!), for: .normal)
        aLabel?.text = String(format: "a = %.0f", aValue!) //FIXME: Show aValue
        bLabel?.text = String(format: "b = %.0f", bValue!)
        hLabel?.text = "h"
        label?.text = String(format: "h\u{00B2} = a\u{00B2} + b\u{00B2}\n\nh = √ (a\u{00B2} + b\u{00B2})\n\nh = √ (%.0f\u{00B2} + %.0f\u{00B2})", aValue!, bValue!)
        resultLabel?.text = nil
    }
    
    // MARK: - Utils
    
    func calculateHypotenuse(aLeg: Float, bLeg: Float) -> Float {
        let h = hypot(aLeg, bLeg)
        return h
    }
    
    // MARK: - Actions
    
    @objc func didPressChangeValueButton(button: UIButton) {
        let alertController = UIAlertController(title: button == self.aButton ? "Value a" : "Value b", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField: UITextField) in
            textField.keyboardType = .numberPad
            textField.textAlignment = .center
            if button == self.aButton {
                textField.text = String(format: "%.0f", self.aValue!)
            } else {
                textField.text = String(format: "%.0f", self.bValue!)
            }
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alertAction: UIAlertAction) in
            if let textField = alertController.textFields?.first {
                if let value = Float(textField.text!) {
                    if button == self.aButton {
                        self.aValue = value
                    } else {
                        self.bValue = value
                        self.bValue = 1 //TODO: Remove me, only for test
                    }
                }
            }
            self.updateLabels()
        }))
        navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    @objc func didPressCalculateButton(button: UIButton) {
        
        hValue = calculateHypotenuse(aLeg: aValue!, bLeg: aValue!) //FIXME: Wrong bLeg value
        resultLabel?.text = String(format: "h = %.2f", hValue!)
    }
}

