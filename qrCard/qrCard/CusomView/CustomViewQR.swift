//
//  swift
//
//
//  Created by Vũ Đức on 27/12/24.
//

import Foundation
import UIKit

class CustomViewCreatePlaylist {
    static let create = CustomViewCreatePlaylist()
    private init() {
        if #available(iOS 15, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                window = windowScene.windows.first { $0.isKeyWindow }!
            }
        } else {
            if let windowView = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                window = windowView
            }
        }
        configOverlay(frame: window.frame)
    }
    private var window = UIWindow()
    private var overlayView = UIView()
    private let qrImageView = UIImageView()

    private func configOverlay(frame: CGRect) {
        overlayView = UIView(frame: frame)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        overlayView.tag = 333
        overlayView.alpha = 0

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(remove(_:)))
        overlayView.addGestureRecognizer(tapGesture)
        overlayView.isUserInteractionEnabled = true
    }

    func createView(image: UIImage) {
        window.addSubview(overlayView)
        addView()
        setUpStyleView()
        setUpConstraint()
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.overlayView.alpha = 1
            DispatchQueue.main.async(execute: {
                self?.qrImageView.image = image
            })
        }
    }

    private func addView() {
        self.overlayView.addSubview(qrImageView)
    }

    private func setUpStyleView() {
        qrImageView.backgroundColor = .blue
        qrImageView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setUpConstraint() {
        constraintViewContainer()
    }

    private func constraintViewContainer() {
        NSLayoutConstraint.activate([
            self.qrImageView.centerXAnchor.constraint(equalTo: self.overlayView.centerXAnchor),
            self.qrImageView.centerYAnchor.constraint(equalTo: self.overlayView.centerYAnchor, constant: -25),
            self.qrImageView.heightAnchor.constraint(equalToConstant: 200),
            self.qrImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }

    @objc func remove(_ sender: UITapGestureRecognizer) {
        for view in window.subviews {
            if view.tag == 333 {
                UIView.animate(withDuration: 0.5) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}

