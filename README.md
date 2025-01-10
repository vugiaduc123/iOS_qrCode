# Generator Qr code and Scan

**QR Generator is a QR code generator developed by Swift using CIFilter. The goal is to implement the functionality that generates a QR code from the information we want to generate like the functionality implemented by the iOS Device version 16.0 program.**

### Introducing CIFilter in Swift

An image processor that produces an image by manipulating one or more input images or by generating new image data.

The following code creates a filter that generates a QR code:

![Screenshot 2025-01-09 at 14 03 29](https://github.com/user-attachments/assets/225f8c4d-cbfd-49ce-88bb-baed8246e23c)

This method generates a QR code as an image. QR codes are a high-density matrix barcode format defined in the ISO/IEC 18004:2006 standard.

The QR code generator filter uses the following properties:

`message`A `string` representing the data to be encoded as a QR Code as [`NSData`](https://developer.apple.com/documentation/foundation/nsdata).`correctionLevel`A single letter `string` representing the error-correction format as an [`NSString`](https://developer.apple.com/documentation/foundation/nsstring). L is 7 precent correction, M is 15 precent correction, Q is 25 precent correction, and H is 30 precent correction.

### **So in the project I do get user information and create it a** QR codes **image like this?**

Model UserEntity:

```jsx
struct UserEntity: Codable {
    private var id = UUID().uuidString
    var firtName: String
    var lastName: String
    var mobile: Int
    var phone: Int
    var fax: String
    var email: String
    var company: String
    var job: String
    var street: String
    var city: String
    var zip: Int
    var state: String
    var country: String
    var website: String

    init(firtName: String, lastName: String, mobile: Int, phone: Int, fax: String, email: String, company: String, job: String, street: String, city: String, zip: Int, state: String, country: String, website: String) {
        self.firtName = firtName
        self.lastName = lastName
        self.mobile = mobile
        self.phone = phone
        self.fax = fax
        self.email = email
        self.company = company
        self.job = job
        self.street = street
        self.city = city
        self.zip = zip
        self.state = state
        self.country = country
        self.website = website
    }
}
```

I have a method to generate QR code as follows:

```jsx
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
```

- *First I pass UserEntity through request method and completion to return result*
- *When I have T:Model I JSONEncoder to String type in UTF8*
- *Then I use Swift's CIFilter to generate the image.*

**And let's see the results:**

![z6211662810319_83aca326bc80a229a6e562ea6c63f2e7](https://github.com/user-attachments/assets/42960234-04ad-4d00-97e8-ccdbe820ff2c)

![z6211662815357_648ac442eba3d96edd14f30817cb971f](https://github.com/user-attachments/assets/9d0d1a5b-028e-43f6-96f4-2f785658c49f)

### **Next step I configure a ScanViewController to scan the QR code to get information:**

https://github.com/user-attachments/assets/be3845ee-7192-4d4c-a430-e245198775f2

### **When I finished scanning the code, I wrote a method to import information to the machine as follows:**

```jsx
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
```

- *After scanning the code I get a String result.*
- *Format String to Data type*
- *Then I use JSONDecoder() to get the Model Entity based on the result.*

# **And that's what I did in this Project.**
