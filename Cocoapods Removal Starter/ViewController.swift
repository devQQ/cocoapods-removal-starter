//
//  ViewController.swift
//  Cocoapods Removal Starter
//
//  Created by Quang Trang on 5/2/20.
//  Copyright © 2020 Syncnodic LLC. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    let url = "https://source.unsplash.com/random"
    
    lazy var imageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
        makeRequest()
    }
    
    func layoutViews() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func makeRequest() {
        imageView.kf.indicatorType = .activity
        
        imageView.kf.setImage(with: URL(string: url), placeholder: UIImage(), options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
            ], progressBlock: { (downloaded, total) in
                print("\(downloaded) \(total)")
        }, completionHandler: {(result) in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        })
    }
}

