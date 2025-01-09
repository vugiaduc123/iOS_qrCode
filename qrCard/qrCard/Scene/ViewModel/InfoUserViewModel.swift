//
//  InfoUserViewModel.swift
//  qrCard
//
//  Created by Vũ Đức on 8/1/25.
//

import Foundation
import UIKit

class InfoUserViewModel {
    var userEntity: UserEntity?
    func createQrCode(userEntity: UserEntity?, completion: @escaping ( Result<UIImage, Error> ) -> Void) {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return }
        if let user = try? JSONEncoder().encode(userEntity) {
            let jsonString = String(data: user, encoding: .utf8)
            let data = jsonString!.data(using: String.Encoding.ascii)
            filter.setValue(data, forKey: "inputMessage")
            let transfrom = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transfrom) {
                DispatchQueue.main.async {
                    let image = UIImage(ciImage: output)
                    completion(.success(image))
                }
            }else{
                let err = "Fail" as! Error
                completion(.failure((err)))
            }
        }else{
            let err = "Fail" as! Error
            completion(.failure((err)))
        }
    }

    func decoderUserEntity(jsonString: String) -> Result<UserEntity, Error> {
        guard let data = jsonString.data(using: .utf8) else {
            let err = "fail string to json utf8" as? Error
            return .failure(err!)
        }
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(UserEntity.self, from: data)
            return .success(data)
        } catch {
            let err = "Decoder fail json data" as? Error
            return .failure(err!)
        }
    }
}
