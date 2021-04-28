//
//  ViewController.swift
//  FrontloopsElement01
//
//  Created by Jinwook Kim on 2021/04/28.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var changeTabButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var positiveLabel: UILabel!
    @IBOutlet weak var neutralLabel: UILabel!
    @IBOutlet weak var negativeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var positiveTap: UITapGestureRecognizer?
    var negativeTap: UITapGestureRecognizer?
    var neutralTap:
        UITapGestureRecognizer?
    var tapIndex: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateContainer()
        self.updateChangeTabButton()
        self.updateTextField()
        self.textField.delegate = self
        self.makeLabelsTappable()
    }
    @IBAction func changeTabButtonPressed(_ sender: UIButton) {
        self.textField.resignFirstResponder()
    }
    func deactivateAllLabels() {
        self.positiveLabel.textColor = UIColor.systemGray4
        self.negativeLabel.textColor = UIColor.systemGray4
        self.neutralLabel.textColor = UIColor.systemGray4
    }
    func makeLabelsTappable() {
        self.positiveTap = UITapGestureRecognizer(target: self, action: #selector(self.positiveTapped))
        self.negativeTap = UITapGestureRecognizer(target: self, action: #selector(self.negativeTapped))
        self.neutralTap = UITapGestureRecognizer(target: self, action: #selector(self.neutralTapped))
        self.positiveLabel.isUserInteractionEnabled = true
        self.negativeLabel.isUserInteractionEnabled = true
        self.neutralLabel.isUserInteractionEnabled = true
        self.positiveLabel.addGestureRecognizer(self.positiveTap!)
        self.negativeLabel.addGestureRecognizer(self.negativeTap!)
        self.neutralLabel.addGestureRecognizer(self.neutralTap!)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.text {
        case "1":
            textField.text = ""
            self.positiveTapped(sender: self.positiveTap!)
        case "2":
            textField.text = ""
            self.negativeTapped(sender: self.negativeTap!)
        case "3":
            textField.text = ""
            self.neutralTapped(sender: self.neutralTap!)
        default:
            let alert: UIAlertController = UIAlertController(title: "Error", message: "Tab index out of range", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay",  style: UIAlertAction.Style.default, handler: nil))
            textField.text = ""
            self.present(alert, animated: true, completion: nil)
        }
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        return false
    }
    func updateContainer() {
        self.container.layer.cornerRadius = 10.0
        self.container.layer.shadowColor = UIColor.darkGray.cgColor
        self.container.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.container.layer.shadowRadius = 10.0
        self.container.layer.shadowOpacity = 0.7
    }
    func updateChangeTabButton() {
        self.changeTabButton.layer.cornerRadius = 5.0
    }
    func updateTextField() {
        let bottomLine: CALayer = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.textField.frame.height - 1, width: self.textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.darkGray.cgColor
        self.textField.borderStyle = UITextField.BorderStyle.none
        self.textField.layer.addSublayer(bottomLine)
    }
    @objc func positiveTapped(sender: UITapGestureRecognizer) {
        self.deactivateAllLabels()
        self.positiveLabel.textColor = UIColor.black
        self.setDescription(text: "Positive content")
    }
    @objc func negativeTapped(sender: UITapGestureRecognizer) {
        self.deactivateAllLabels()
        self.negativeLabel.textColor = UIColor.black
        self.setDescription(text: "Negative content")
    }
    @objc func neutralTapped(sender: UITapGestureRecognizer) {
        self.deactivateAllLabels()
        self.neutralLabel.textColor = UIColor.black
        self.setDescription(text: "Neutral content")
    }
    func setDescription(text: String) {
        self.descriptionLabel.text = text
    }
}
