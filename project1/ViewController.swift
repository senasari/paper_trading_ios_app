//
//  ViewController.swift
//  project1
//
//  Created by Sena Nur Sari on 3/19/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var ppImageView: UIImageView!
    
    @IBOutlet weak var buyTF: UITextField!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var selTF: UITextField!
    
    
    @IBOutlet weak var mySellButton: UIButton!
    
    @IBOutlet weak var uploadImageButton: UIButton!
    
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    var walletModel:WalletModel?
    var imageModel:ImageModel?
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    var mResults: [MyResults]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walletModel = WalletModel(context:managedObjectContext)
        imageModel = ImageModel(context:managedObjectContext)
        if (!imageItem.isEmpty) {
            ppImageView.image = imageItem[0] }
        // Do any additional setup after loading the view.

    }
    

    
    @IBAction func onBuyClick(_ sender: Any) {
        walletModel!.buyStock(ticker: buyTF.text!)
        
        
    }
    
    @IBAction func onSellClick(_ sender: Any) {
        walletModel!.sellStock(ticker: selTF.text!)
    }
    
    
    
    @IBAction func uploadImageButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Your Profile Photo", message: nil, preferredStyle: .alert)
        
        
//        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
               alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                   self.openCamera()
               }))

               alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                   self.openGallery()
               }))

        self.present(alert, animated: true)
        
        
    }
    
    func openGallery()
    {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let myAlert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    func openCamera()
    {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let myAlert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        ppImageView.image = userPickedImage
        imageModel!.saveImage(myPNGData: userPickedImage.pngData()!)
        picker.dismiss(animated: true)
    }
    
    
    
    
}

