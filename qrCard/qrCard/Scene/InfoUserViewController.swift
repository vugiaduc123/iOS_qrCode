//
//  InfoUserViewController.swift
//  qrCard
//
//  Created by Vũ Đức on 8/1/25.
//

import UIKit
import AVFoundation
class InfoUserViewController: UIViewController {
    let viewModel: InfoUserViewModel
    init(viewModel: InfoUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let widthLabel:CGFloat = 80
    private let heightTF:CGFloat = 40
    private let distanceItem: CGFloat = 15

    private let sizeTitle:CGFloat = 20
    private let sizeFontNormal:CGFloat = 13
    let scrollView = UIScrollView()
    let scrollContainer = UIView()
    let titleLB = UILabel()

    let nameLb = UILabel()
    let firtnameTF = UITextField()
    let lastnameTF = UITextField()

    let contactLb = UILabel()
    let mobileTF = UITextField()
    let phoneTF = UITextField()
    let faxTF = UITextField()

    let emailLb = UILabel()
    let emailTF = UITextField()

    let companyLb = UILabel()
    let companyTF = UITextField()
    let jobTF = UITextField()

    let streetLb = UILabel()
    let streetTF = UITextField()

    let cityLb = UILabel()
    let cityTF = UITextField()
    let zipTF = UITextField()

    let countryLB = UILabel()
    let countryTF = UITextField()

    let stateLb = UILabel()
    let stateTF = UITextField()

    let websiteLB = UILabel()
    let websiteTF = UITextField()

    let createQrCode = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        configView()
        constraint()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureNav()
    }



}
// MARK: Navigation
extension InfoUserViewController {
    func configureNav() {
        let btnCamera = NavigationItem().itemBarbtnSystem(icon: "camera.fill", color: .black, target: self, selector: #selector(scanQR(sender:)), sizeIcon: 15)
        self.navigationItem.rightBarButtonItems = [btnCamera]
    }
}

// MARK: Set up View
extension InfoUserViewController {
    /// add view
    private func addView() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(scrollContainer)

        self.scrollContainer.addSubview(titleLB)

        self.scrollContainer.addSubview(nameLb)
        self.scrollContainer.addSubview(firtnameTF)
        self.scrollContainer.addSubview(lastnameTF)

        self.scrollContainer.addSubview(contactLb)
        self.scrollContainer.addSubview(mobileTF)
        self.scrollContainer.addSubview(phoneTF)
        self.scrollContainer.addSubview(faxTF)

        self.scrollContainer.addSubview(emailLb)
        self.scrollContainer.addSubview(emailTF)

        self.scrollContainer.addSubview(companyLb)
        self.scrollContainer.addSubview(companyTF)
        self.scrollContainer.addSubview(jobTF)

        self.scrollContainer.addSubview(streetLb)
        self.scrollContainer.addSubview(streetTF)

        self.scrollContainer.addSubview(cityLb)
        self.scrollContainer.addSubview(cityTF)
        self.scrollContainer.addSubview(zipTF)

        self.scrollContainer.addSubview(stateLb)
        self.scrollContainer.addSubview(stateTF)

        self.scrollContainer.addSubview(countryLB)
        self.scrollContainer.addSubview(countryTF)

        self.scrollContainer.addSubview(websiteLB)
        self.scrollContainer.addSubview(websiteTF)

        self.scrollContainer.addSubview(createQrCode)
    }

    /// configure view
    private func configView() {
        configScrollView()
        configScrollContainer()
        configTitlelb()

        configYourNameLb()
        configFirtNameTF()
        configLastNameTF()

        configContactLb()
        configMobileTF()
        configPhoneTF()
        configFaxTF()

        configEmailLb()
        configEmailTF()

        configCompanyLb()
        configCompanyTF()
        configJobTF()

        configStreetLb()
        configStreetTF()

        configCityLb()
        configCityTF()
        configZipTF()

        configStateLb()
        configStateTF()

        configCountryLb()
        configCountryTF()

        configWebsiteLb()
        configWebsiteTF()

        configCreateQrBT()
    }

    /// constraint view
    private func constraint() {
        // scrolView
        constraintScrollView()
        constraintScrollContainer()
        constraintTitlelb()

        constraintYourNamelb()
        constraintFirstNameTF()
        constraintLastNameTF()

        constraintContactLb()
        constraintMobileTF()
        constraintPhoneTF()
        constraintFaxTF()

        constraintEmailLb()
        constraintEmailTF()

        constraintCompanyLb()
        constraintCompanyTF()
        constraintJobTF()

        constraintStreetLb()
        constraintStreetTF()

        constraintCityLb()
        constraintCityTF()
        constraintZipTF()

        constraintStateLb()
        constraintStateTF()

        constraintCountryLb()
        constraintCountryTF()

        constraintWebsiteLb()
        constraintWebsiteTF()

        constraintCreateQrBt()
    }
}

/// configure view
extension InfoUserViewController {

    private func configScrollView() {
        self.scrollView.keyboardDismissMode = .onDrag
        self.scrollView.showsVerticalScrollIndicator = true
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false

        self.scrollContainer.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configScrollContainer() {
        self.scrollContainer.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configTitlelb() {
        self.titleLB.text = "vCard QR Code"
        self.titleLB.font = UIFont.systemFont(ofSize: sizeTitle, weight: .bold, width: .standard)
        self.titleLB.textColor = UIColor.black.withAlphaComponent(0.7)
        self.titleLB.textAlignment = .left
        self.titleLB.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configYourNameLb() {
        self.nameLb.text = "Your Name:"
        self.nameLb.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.nameLb.textColor = UIColor.black.withAlphaComponent(0.9)
        self.nameLb.textAlignment = .left
        self.nameLb.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configFirtNameTF() {
        // layout
        self.firtnameTF.borderStyle = .roundedRect
        self.firtnameTF.layer.borderWidth = 0.5
        self.firtnameTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.firtnameTF.attributedPlaceholder = NSAttributedString(
            string: "First name",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )

        self.firtnameTF.textAlignment = .left
        self.firtnameTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.firtnameTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.firtnameTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configLastNameTF() {
        // layout
        self.lastnameTF.borderStyle = .roundedRect
        self.lastnameTF.layer.borderWidth = 0.5
        self.lastnameTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.lastnameTF.attributedPlaceholder = NSAttributedString(
            string: "Last name",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )

        self.lastnameTF.textAlignment = .left
        self.lastnameTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.lastnameTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.lastnameTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configContactLb() {
        self.contactLb.text = "Contact:"
        self.contactLb.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.contactLb.textColor = UIColor.black.withAlphaComponent(0.9)
        self.contactLb.textAlignment = .left
        self.contactLb.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configMobileTF() {
        // layout
        self.mobileTF.borderStyle = .roundedRect
        self.mobileTF.layer.borderWidth = 0.5
        self.mobileTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.mobileTF.attributedPlaceholder = NSAttributedString(
            string: "Mobile",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )
        self.mobileTF.keyboardType = .numberPad

        self.mobileTF.textAlignment = .left
        self.mobileTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.mobileTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.mobileTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configPhoneTF() {
        // layout
        self.phoneTF.borderStyle = .roundedRect
        self.phoneTF.layer.borderWidth = 0.5
        self.phoneTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.phoneTF.attributedPlaceholder = NSAttributedString(
            string: "Phone",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )
        self.phoneTF.keyboardType = .numberPad

        self.phoneTF.textAlignment = .left
        self.phoneTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.phoneTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.phoneTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configFaxTF() {
        // layout
        self.faxTF.borderStyle = .roundedRect
        self.faxTF.layer.borderWidth = 0.5
        self.faxTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.faxTF.attributedPlaceholder = NSAttributedString(
            string: "Fax",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )

        self.faxTF.textAlignment = .left
        self.faxTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.faxTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.faxTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configEmailLb() {
        self.emailLb.text = "Email:"
        self.emailLb.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.emailLb.textColor = UIColor.black.withAlphaComponent(0.9)
        self.emailLb.textAlignment = .left
        self.emailLb.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configEmailTF() {
        // layout
        self.emailTF.borderStyle = .roundedRect
        self.emailTF.layer.borderWidth = 0.5
        self.emailTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.emailTF.attributedPlaceholder = NSAttributedString(
            string: "your@gmail.com",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )

        self.emailTF.textAlignment = .left
        self.emailTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.emailTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.emailTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configCompanyLb() {
        self.companyLb.text = "Company:"
        self.companyLb.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.companyLb.textColor = UIColor.black.withAlphaComponent(0.9)
        self.companyLb.textAlignment = .left
        self.companyLb.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configCompanyTF() {
        // layout
        self.companyTF.borderStyle = .roundedRect
        self.companyTF.layer.borderWidth = 0.5
        self.companyTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.companyTF.attributedPlaceholder = NSAttributedString(
            string: "Company",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )

        self.companyTF.textAlignment = .left
        self.companyTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.companyTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.companyTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configJobTF() {
        // layout
        self.jobTF.borderStyle = .roundedRect
        self.jobTF.layer.borderWidth = 0.5
        self.jobTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.jobTF.attributedPlaceholder = NSAttributedString(
            string: "Your job",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )

        self.jobTF.textAlignment = .left
        self.jobTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.jobTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.jobTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configStreetLb() {
        self.streetLb.text = "Street:"
        self.streetLb.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.streetLb.textColor = UIColor.black.withAlphaComponent(0.9)
        self.streetLb.textAlignment = .left
        self.streetLb.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configStreetTF() {
        // layout
        self.streetTF.borderStyle = .roundedRect
        self.streetTF.layer.borderWidth = 0.5
        self.streetTF.layer.borderColor = UIColor.systemGray.cgColor

        self.streetTF.textAlignment = .left
        self.streetTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.streetTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.streetTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configCityLb() {
        self.cityLb.text = "City:"
        self.cityLb.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.cityLb.textColor = UIColor.black.withAlphaComponent(0.9)
        self.cityLb.textAlignment = .left
        self.cityLb.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configCityTF() {
        // layout
        self.cityTF.borderStyle = .roundedRect
        self.cityTF.layer.borderWidth = 0.5
        self.cityTF.layer.borderColor = UIColor.systemGray.cgColor

        self.cityTF.textAlignment = .left
        self.cityTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.cityTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.cityTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configZipTF() {
        // layout
        self.zipTF.borderStyle = .roundedRect
        self.zipTF.layer.borderWidth = 0.5
        self.zipTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.zipTF.attributedPlaceholder = NSAttributedString(
            string: " Zip",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )
        self.zipTF.keyboardType = .numberPad

        self.zipTF.textAlignment = .left
        self.zipTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.zipTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.zipTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configStateLb() {
        self.stateLb.text = "State:"
        self.stateLb.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.stateLb.textColor = UIColor.black.withAlphaComponent(0.9)
        self.stateLb.textAlignment = .left
        self.stateLb.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configStateTF() {
        // layout
        self.stateTF.borderStyle = .roundedRect
        self.stateTF.layer.borderWidth = 0.5
        self.stateTF.layer.borderColor = UIColor.systemGray.cgColor

        self.stateTF.textAlignment = .left
        self.stateTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.stateTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.stateTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configCountryLb() {
        self.countryLB.text = "Country:"
        self.countryLB.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.countryLB.textColor = UIColor.black.withAlphaComponent(0.9)
        self.countryLB.textAlignment = .left
        self.countryLB.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configCountryTF() {
        // layout
        self.countryTF.borderStyle = .roundedRect
        self.countryTF.layer.borderWidth = 0.5
        self.countryTF.layer.borderColor = UIColor.systemGray.cgColor

        self.countryTF.textAlignment = .left
        self.countryTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.countryTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.countryTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configWebsiteLb() {
        self.websiteLB.text = "Website:"
        self.websiteLB.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .medium, width: .standard)
        self.websiteLB.textColor = UIColor.black.withAlphaComponent(0.9)
        self.websiteLB.textAlignment = .left
        self.websiteLB.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configWebsiteTF() {
        // layout
        self.websiteTF.borderStyle = .roundedRect
        self.websiteTF.layer.borderWidth = 0.5
        self.websiteTF.layer.borderColor = UIColor.systemGray.cgColor

        // attribute
        self.websiteTF.attributedPlaceholder = NSAttributedString(
            string: "www.your-website.com",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
            ]
        )

        self.websiteTF.textAlignment = .left
        self.websiteTF.textColor = UIColor.black.withAlphaComponent(0.9)
        self.websiteTF.font = UIFont.systemFont(ofSize: sizeFontNormal, weight: .heavy, width: .standard)
        self.websiteTF.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configCreateQrBT() {
        self.createQrCode.backgroundColor = .link
        self.createQrCode.setTitle("Create Qr code", for: .normal)
        self.createQrCode.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium, width: .standard)
        self.createQrCode.setTitleColor(.white, for: .normal)

        self.createQrCode.layer.cornerRadius = 15
        self.createQrCode.layer.masksToBounds = true

        self.createQrCode.addTarget(self, action: #selector(createQrcode(sender:)), for: .touchUpInside)

        self.createQrCode.translatesAutoresizingMaskIntoConstraints = false
    }
}

/// constraint view
extension InfoUserViewController {

    private func constraintScrollView() {
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }

    private func constraintScrollContainer() {
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide

        NSLayoutConstraint.activate([
            self.scrollContainer.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor, constant: 0),
            self.scrollContainer.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor, constant: 0),
            self.scrollContainer.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor, constant: 0),
            self.scrollContainer.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor, constant: 0),

            self.scrollContainer.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
            self.scrollContainer.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
            self.scrollContainer.heightAnchor.constraint(equalToConstant: 800)
        ])
    }

    private func constraintTitlelb() {
        NSLayoutConstraint.activate([
            self.titleLB.topAnchor.constraint(equalTo: self.scrollContainer.topAnchor, constant: 0),
            self.titleLB.leadingAnchor.constraint(equalTo: self.scrollContainer.leadingAnchor, constant: paddingLeft),
            self.titleLB.trailingAnchor.constraint(equalTo: self.scrollContainer.trailingAnchor, constant: 0),
            self.titleLB.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    private func constraintYourNamelb() {
        NSLayoutConstraint.activate([
            self.nameLb.topAnchor.constraint(equalTo: self.titleLB.topAnchor, constant: 50),
            self.nameLb.leadingAnchor.constraint(equalTo: self.scrollContainer.leadingAnchor, constant: paddingLeft),
            self.nameLb.widthAnchor.constraint(equalToConstant: widthLabel),
            self.nameLb.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintFirstNameTF() {
        NSLayoutConstraint.activate([
            self.firtnameTF.centerYAnchor.constraint(equalTo: self.nameLb.centerYAnchor),
            self.firtnameTF.leadingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 10),
            self.firtnameTF.heightAnchor.constraint(equalToConstant: heightTF),
            self.firtnameTF.widthAnchor.constraint(equalTo: self.lastnameTF.widthAnchor, multiplier: 1, constant: 0),
        ])
    }

    private func constraintLastNameTF() {
        NSLayoutConstraint.activate([
            self.lastnameTF.centerYAnchor.constraint(equalTo: self.firtnameTF.centerYAnchor),
            self.lastnameTF.leadingAnchor.constraint(equalTo: self.firtnameTF.trailingAnchor, constant: 10),
            self.lastnameTF.trailingAnchor.constraint(equalTo: self.scrollContainer.trailingAnchor, constant: -paddingRight),
            self.lastnameTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintContactLb() {
        NSLayoutConstraint.activate([
            self.contactLb.centerYAnchor.constraint(equalTo: self.mobileTF.centerYAnchor),
            self.contactLb.leadingAnchor.constraint(equalTo: self.nameLb.leadingAnchor, constant: 0),
            self.contactLb.trailingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 0),
            self.contactLb.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintMobileTF() {
        NSLayoutConstraint.activate([
            self.mobileTF.topAnchor.constraint(equalTo: self.firtnameTF.bottomAnchor, constant: distanceItem),
            self.mobileTF.leadingAnchor.constraint(equalTo: self.firtnameTF.leadingAnchor, constant: 0),
            self.mobileTF.trailingAnchor.constraint(equalTo: self.lastnameTF.trailingAnchor, constant: 0),
            self.mobileTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintPhoneTF() {
        NSLayoutConstraint.activate([
            self.phoneTF.topAnchor.constraint(equalTo: self.mobileTF.bottomAnchor, constant: distanceItem),
            self.phoneTF.leadingAnchor.constraint(equalTo: self.mobileTF.leadingAnchor, constant: 0),
            self.phoneTF.widthAnchor.constraint(equalTo: self.faxTF.widthAnchor, multiplier: 1, constant: 0),
            self.phoneTF.heightAnchor.constraint(equalToConstant: heightTF),
        ])
    }

    private func constraintFaxTF() {
        NSLayoutConstraint.activate([
            self.faxTF.centerYAnchor.constraint(equalTo: self.phoneTF.centerYAnchor),
            self.faxTF.leadingAnchor.constraint(equalTo: self.phoneTF.trailingAnchor, constant: 10),
            self.faxTF.trailingAnchor.constraint(equalTo: self.mobileTF.trailingAnchor, constant: 0),
            self.faxTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintEmailLb() {
        NSLayoutConstraint.activate([
            self.emailLb.centerYAnchor.constraint(equalTo: self.emailTF.centerYAnchor),
            self.emailLb.leadingAnchor.constraint(equalTo: self.nameLb.leadingAnchor, constant: 0),
            self.emailLb.trailingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 0),
            self.emailLb.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintEmailTF() {
        NSLayoutConstraint.activate([
            self.emailTF.topAnchor.constraint(equalTo: self.phoneTF.bottomAnchor, constant: distanceItem),
            self.emailTF.leadingAnchor.constraint(equalTo: self.firtnameTF.leadingAnchor, constant: 0),
            self.emailTF.trailingAnchor.constraint(equalTo: self.lastnameTF.trailingAnchor, constant: 0),
            self.emailTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintCompanyLb() {
        NSLayoutConstraint.activate([
            self.companyLb.centerYAnchor.constraint(equalTo: self.companyTF.centerYAnchor, constant: 0),
            self.companyLb.leadingAnchor.constraint(equalTo: self.nameLb.leadingAnchor, constant: 0),
            self.companyLb.trailingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 0),
            self.companyLb.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintCompanyTF() {
        NSLayoutConstraint.activate([
            self.companyTF.topAnchor.constraint(equalTo: self.emailTF.bottomAnchor, constant: distanceItem),
            self.companyTF.leadingAnchor.constraint(equalTo: self.companyLb.trailingAnchor, constant: 10),
            self.companyTF.heightAnchor.constraint(equalToConstant: heightTF),
            self.companyTF.widthAnchor.constraint(equalTo: self.lastnameTF.widthAnchor, multiplier: 1, constant: 0),
        ])
    }

    private func constraintJobTF() {
        NSLayoutConstraint.activate([
            self.jobTF.centerYAnchor.constraint(equalTo: self.companyTF.centerYAnchor),
            self.jobTF.leadingAnchor.constraint(equalTo: self.firtnameTF.trailingAnchor, constant: 10),
            self.jobTF.trailingAnchor.constraint(equalTo: self.lastnameTF.trailingAnchor, constant: 0),
            self.jobTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintStreetLb() {
        NSLayoutConstraint.activate([
            self.streetLb.centerYAnchor.constraint(equalTo: self.streetTF.centerYAnchor),
            self.streetLb.leadingAnchor.constraint(equalTo: self.nameLb.leadingAnchor, constant: 0),
            self.streetLb.trailingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 0),
            self.streetLb.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintStreetTF() {
        NSLayoutConstraint.activate([
            self.streetTF.topAnchor.constraint(equalTo: self.companyTF.bottomAnchor, constant: distanceItem),
            self.streetTF.leadingAnchor.constraint(equalTo: self.firtnameTF.leadingAnchor, constant: 0),
            self.streetTF.trailingAnchor.constraint(equalTo: self.lastnameTF.trailingAnchor, constant: 0),
            self.streetTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintCityLb() {
        NSLayoutConstraint.activate([
            self.cityLb.centerYAnchor.constraint(equalTo: self.cityTF.centerYAnchor, constant: 0),
            self.cityLb.leadingAnchor.constraint(equalTo: self.nameLb.leadingAnchor, constant: 0),
            self.cityLb.trailingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 0),
            self.cityLb.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintCityTF() {
        NSLayoutConstraint.activate([
            self.cityTF.topAnchor.constraint(equalTo: self.streetTF.bottomAnchor, constant: distanceItem),
            self.cityTF.leadingAnchor.constraint(equalTo: self.cityLb.trailingAnchor, constant: 10),
            self.cityTF.heightAnchor.constraint(equalToConstant: heightTF),
            self.cityTF.widthAnchor.constraint(equalTo: self.zipTF.widthAnchor, multiplier: 2, constant: 0)
        ])
    }

    private func constraintZipTF() {
        NSLayoutConstraint.activate([
            self.zipTF.centerYAnchor.constraint(equalTo: self.cityTF.centerYAnchor),
            self.zipTF.leadingAnchor.constraint(equalTo: self.cityTF.trailingAnchor, constant: 10),
            self.zipTF.trailingAnchor.constraint(equalTo: self.lastnameTF.trailingAnchor, constant: 0),
            self.zipTF.heightAnchor.constraint(equalToConstant: heightTF),
        ])
    }

    private func constraintStateLb() {
        NSLayoutConstraint.activate([
            self.stateLb.centerYAnchor.constraint(equalTo: self.stateTF.centerYAnchor),
            self.stateLb.leadingAnchor.constraint(equalTo: self.nameLb.leadingAnchor, constant: 0),
            self.stateLb.trailingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 0),
            self.stateLb.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintStateTF() {
        NSLayoutConstraint.activate([
            self.stateTF.topAnchor.constraint(equalTo: self.cityTF.bottomAnchor, constant: distanceItem),
            self.stateTF.leadingAnchor.constraint(equalTo: self.firtnameTF.leadingAnchor, constant: 0),
            self.stateTF.trailingAnchor.constraint(equalTo: self.lastnameTF.trailingAnchor, constant: 0),
            self.stateTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintCountryLb() {
        NSLayoutConstraint.activate([
            self.countryLB.centerYAnchor.constraint(equalTo: self.countryTF.centerYAnchor),
            self.countryLB.leadingAnchor.constraint(equalTo: self.nameLb.leadingAnchor, constant: 0),
            self.countryLB.trailingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 0),
            self.countryLB.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintCountryTF() {
        NSLayoutConstraint.activate([
            self.countryTF.topAnchor.constraint(equalTo: self.stateTF.bottomAnchor, constant: distanceItem),
            self.countryTF.leadingAnchor.constraint(equalTo: self.firtnameTF.leadingAnchor, constant: 0),
            self.countryTF.trailingAnchor.constraint(equalTo: self.lastnameTF.trailingAnchor, constant: 0),
            self.countryTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintWebsiteLb() {
        NSLayoutConstraint.activate([
            self.websiteLB.centerYAnchor.constraint(equalTo: self.websiteTF.centerYAnchor),
            self.websiteLB.leadingAnchor.constraint(equalTo: self.nameLb.leadingAnchor, constant: 0),
            self.websiteLB.trailingAnchor.constraint(equalTo: self.nameLb.trailingAnchor, constant: 0),
            self.websiteLB.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func constraintWebsiteTF() {
        NSLayoutConstraint.activate([
            self.websiteTF.topAnchor.constraint(equalTo: self.countryTF.bottomAnchor, constant: distanceItem),
            self.websiteTF.leadingAnchor.constraint(equalTo: self.firtnameTF.leadingAnchor, constant: 0),
            self.websiteTF.trailingAnchor.constraint(equalTo: self.lastnameTF.trailingAnchor, constant: 0),
            self.websiteTF.heightAnchor.constraint(equalToConstant: heightTF)
        ])
    }

    private func constraintCreateQrBt() {
        NSLayoutConstraint.activate([
            self.createQrCode.topAnchor.constraint(equalTo: self.websiteTF.bottomAnchor, constant: 30),
            self.createQrCode.centerXAnchor.constraint(equalTo: self.scrollContainer.centerXAnchor),
            self.createQrCode.widthAnchor.constraint(equalToConstant: 200),
            self.createQrCode.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

extension InfoUserViewController {
    func refeshLayoutText(user: UserEntity?) {
        DispatchQueue.main.async {
            self.firtnameTF.text = user?.firtName
            self.lastnameTF.text = user?.lastName
            self.mobileTF.text = user?.mobile.description
            self.phoneTF.text = user?.phone.description
            self.faxTF.text = user?.fax.description
            self.emailTF.text = user?.email
            self.companyTF.text = user?.company
            self.jobTF.text = user?.job
            self.streetTF.text = user?.street
            self.cityTF.text = user?.city
            self.zipTF.text = user?.zip.description
            self.stateTF.text = user?.state
            self.countryTF.text = user?.country
            self.websiteTF.text = user?.website
            UIView.animate(withDuration: 0.5) {
                self.loadViewIfNeeded()
            }
        }
    }
}

/// action
extension InfoUserViewController {
    @objc func createQrcode(sender: UIButton) {
        var intMobile:Int = 0
        var intPhone:Int = 0
        var intZip:Int = 0

        let firstName = firtnameTF.text ?? ""
        let lastName = lastnameTF.text ?? ""
        let mobile = mobileTF.text ?? ""
        let phone = phoneTF.text ?? ""
        let fax = faxTF.text ?? ""

        let email = emailTF.text ?? ""
        let company = companyTF.text ?? ""
        let job = jobTF.text ?? ""

        let street = streetTF.text ?? ""
        let city = cityTF.text ?? ""
        let zip = zipTF.text ?? ""

        let state = stateTF.text ?? ""
        let country = countryTF.text ?? ""
        let website = websiteTF.text ?? ""
        
        guard !firstName.isEmpty && !lastName.isEmpty && !mobile.isEmpty && !phone.isEmpty && !fax.isEmpty && !email.isEmpty && !company.isEmpty && !job.isEmpty && !street.isEmpty && !city.isEmpty && !zip.isEmpty && !state.isEmpty && !country.isEmpty && !website.isEmpty else {
            showAlert(title: "Thông báo", message: "Vui lòng nhập đầy đủ thông tin")
            return
        }

        guard mobile.isNumber else {
            showAlert(title: "Thông báo", message: "Mobile phải là số 0xxx")
            return
        }
        intMobile = Int(mobile)!

        guard phone.isNumber else {
            showAlert(title: "Thông báo", message: "Mobile phải là số 0xxx")
            return
        }
        intPhone = Int(phone)!

        guard validateEmail(enteredEmail: email) == true else {
            showAlert(title: "Thông báo", message: "Vui lòng điền đúng kiểu email: your@email.com")
            return
        }

        guard zip.isNumber else {
            showAlert(title: "Thông báo", message: "Mobile phải là số 0xx")
            return
        }
        intZip = Int(zip)!

        let info = UserEntity(firtName: firstName, lastName: lastName, mobile: intMobile, phone: intPhone, fax: fax, email: email, company: company, job: job, street: street, city: city, zip: intZip, state: state, country: country, website: website)
        viewModel.createQrCode(userEntity: info, completion: { result in
            switch result {
            case.success(let image):
                CustomViewCreatePlaylist.create.createView(image: image)
                break;
            case .failure(let error):
                print("fail createQrCode ===> \(error)")
                break;
            }
        })
    }

    @objc func scanQR(sender: UIButton) {
        let view = ScannerViewController()
        view.delegate = self
        self.navigationController?.pushViewController(view, animated: true)
    }

    // create alert
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
}


extension InfoUserViewController: DelegationBackJsonData {
    func jsonString(withText text: String) {
        let result = viewModel.decoderUserEntity(jsonString: text)
        switch result {
        case .success(let data):
            refeshLayoutText(user: data)
        case .failure(let err):
            print(err.localizedDescription)
            break;
        }
    }
}
