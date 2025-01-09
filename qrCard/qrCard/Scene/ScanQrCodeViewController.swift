//
//  ScanQrCodeViewController.swift
//  qrCard
//
//  Created by Vũ Đức on 9/1/25.
//
import Foundation
import UIKit
import AVFoundation

class ScannerViewController: UIViewController {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    var qrCodeFrameView = UIView()
    var scanAreaView = UIView()
    var delegate: DelegationBackJsonData?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureScanQR()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            captureSession.startRunning();
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning();
        }
    }

    func found(code: String) {
        print("jsondat===>\(code)")
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    deinit {
        print("Free memory ScannerViewController retain cycle ")
    }
}
extension ScannerViewController {
    func configureScanQR() {
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()

        let videoCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice!)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed();
            return;
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.global(qos: .userInteractive))
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }

        configureScanAreaView()

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill;
        view.layer.addSublayer(previewLayer);

        captureSession.startRunning();

        configureQrCodeFrameView()

        view.addSubview(qrCodeFrameView)
        view.bringSubviewToFront(qrCodeFrameView)
        view.addSubview(scanAreaView)
    }

    func configureScanAreaView() {
        // calculate a centered square rectangle with red border
        let size = 300
        let screenWidth = self.view.frame.size.width
        let xPos = (CGFloat(screenWidth) / CGFloat(2)) - (CGFloat(size) / CGFloat(2))
        let scanRect = CGRect(x: Int(xPos), y: 150, width: size, height: size)

        // create UIView that will server as a red square to indicate where to place QRCode for scanning
        scanAreaView = UIView()
        scanAreaView.layer.borderColor = UIColor.red.cgColor
        scanAreaView.layer.borderWidth = 4
        scanAreaView.frame = scanRect
    }

    func configureQrCodeFrameView() {
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
        qrCodeFrameView.layer.borderWidth = 2
    }

}

//
extension ScannerViewController {
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
}
extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;

            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: readableObject.stringValue!);
            delegate?.jsonString(withText: readableObject.stringValue!);
        }
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }

}

extension ScannerViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else {
            print("Error while generating image from photo capture data.");
            return
        }
        guard let qrImage = UIImage(data: imageData) else {
            print("Unable to generate UIImage from image data.");
            return
        }
        print("qrImage===>\(qrImage.description)")
    }
}


protocol DelegationBackJsonData {
    func jsonString(withText text: String)
}
