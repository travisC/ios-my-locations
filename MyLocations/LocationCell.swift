//
//  LocationCell.swift
//  MyLocations
//
//  Created by Matthijs on 26/07/2016.
//  Copyright © 2016 Razeware. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
  
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()

    backgroundColor = UIColor.black
    descriptionLabel.textColor = UIColor.white
    descriptionLabel.highlightedTextColor = descriptionLabel.textColor
    addressLabel.textColor = UIColor(white: 1.0, alpha: 0.4)
    addressLabel.highlightedTextColor = addressLabel.textColor

    let selectionView = UIView(frame: CGRect.zero)
    selectionView.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
    selectedBackgroundView = selectionView
    
    photoImageView.layer.cornerRadius = photoImageView.bounds.size.width / 2
    photoImageView.clipsToBounds = true
    separatorInset = UIEdgeInsets(top: 0, left: 82, bottom: 0, right: 0)
    
    //descriptionLabel.backgroundColor = UIColor.purple()
    //addressLabel.backgroundColor = UIColor.purple()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

  func configure(for location: Location) {
    if location.locationDescription.isEmpty {
      descriptionLabel.text = "(No Description)"
    } else {
      descriptionLabel.text = location.locationDescription
    }
    
    if let placemark = location.placemark {
      var text = ""
      text.add(text: placemark.subThoroughfare)
      text.add(text: placemark.thoroughfare, separatedBy: " ")
      text.add(text: placemark.locality, separatedBy: ", ")
      addressLabel.text = text
    } else {
      addressLabel.text = String(format:
        "Lat: %.8f, Long: %.8f", location.latitude, location.longitude)
    }
    
    photoImageView.image = thumbnail(for: location)
  }

  func thumbnail(for location: Location) -> UIImage {
    if location.hasPhoto, let image = location.photoImage {
      return image.resizedImage(withBounds: CGSize(width: 52, height: 52))
    }
    return UIImage(named: "No Photo")!
  }
}
