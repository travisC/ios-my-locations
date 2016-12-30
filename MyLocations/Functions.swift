import Foundation
import Dispatch

func afterDelay(_ seconds: Double, closure: @escaping () -> ()) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: closure)
}

let applicationDocumentsDirectory: URL = {
  let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
  return paths[0]
}()

let MyManagedObjectContextSaveDidFailNotification = Notification.Name(rawValue: "MyManagedObjectContextSaveDidFailNotification")

func fatalCoreDataError(_ error: Error) {
  print("*** Fatal error: \(error)")
  NotificationCenter.default.post(name: MyManagedObjectContextSaveDidFailNotification, object: nil)
}
