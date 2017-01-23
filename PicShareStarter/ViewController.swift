//
//  ViewController.swift
//  PicShareStarter
//
//  Created by HChlebek on 1/19/17.
//  Copyright © 2017 HChlebek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = [UIImage]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        
        title = "Pic Share"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(importPicture))
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageView", for: indexPath as IndexPath)
        
        if let imageView = cell.viewWithTag(1000) as? UIImageView
        {
            imageView.image = images[indexPath.item]
        }
        
        return cell
    }

    func importPicture()
    {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        var newImage: UIImage
        
        if let possibleImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        dismiss(animated: true, completion: nil)
        
        images.insert(newImage, at: 0)
        collectionView.reloadData()
        
        // add peer to peer
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }




}

