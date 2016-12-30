//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by Matthijs on 25/07/2016.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class Location: NSManagedObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2DMake(latitude, longitude)
  }
  
  var title: String? {
    if locationDescription.isEmpty {
      return "(No Description)"
    } else {
      return locationDescription
    }
  }
  
  var subtitle: String? {
    return category
  }
  
  var hasPhoto: Bool {
    return photoID != nil
  }
  
  var photoURL: URL {
    assert(photoID != nil, "No photo ID set")
    let filename = "Photo-\(photoID!.intValue).jpg"
    return applicationDocumentsDirectory.appendingPathComponent(filename)
  }
  
  var photoImage: UIImage? {
    return UIImage(contentsOfFile: photoURL.path)
  }

  class func nextPhotoID() -> Int {
    let userDefaults = UserDefaults.standard
    let currentID = userDefaults.integer(forKey: "PhotoID")
    userDefaults.set(currentID + 1, forKey: "PhotoID")
    userDefaults.synchronize()
    return currentID
  }
  
  func removePhotoFile() {
    if hasPhoto {
      do {
        try FileManager.default.removeItem(at: photoURL)
      } catch {
        print("Error removing file: \(error)")
      }
    }
  }
}
