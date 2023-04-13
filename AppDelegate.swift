//
//  AppDelegate.swift
//  test
//
//  Created by Umit Kilinc on 2023-04-13.
//

import UIKit
import CoreLocation
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {
        
        @IBOutlet weak var tableView: UITableView!
        
        let locationManager = CLLocationManager()
        var locationData: [TimeInterval: CLLocation] = [:]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupLocationManager()
            setupTableView()
        }
        
        private func setupLocationManager() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = 10 // Meters
            locationManager.requestWhenInUseAuthorization()
        }
        
        private func setupTableView() {
            tableView.dataSource = self
            tableView.delegate = self
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse {
                locationManager.startUpdatingLocation()
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                let timestamp = location.timestamp.timeIntervalSince1970
                locationData[timestamp] = location
                tableView.reloadData()
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error: \(error)")
        }
        
        // UITableViewDataSource Methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return locationData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
            let sortedData = locationData.sorted { $0.key < $1.key }
            let locationEntry = sortedData[indexPath.row]
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = dateFormatter.string(from: Date(timeIntervalSince1970: locationEntry.key))
            
            cell.textLabel?.text = "Timestamp: \(dateString)"
            cell.detailTextLabel?.text = "Latitude: \(locationEntry.value.coordinate.latitude), Longitude: \(locationEntry.value.coordinate.longitude)"
            
            return cell
        }
        
        // UITableViewDelegate Methods
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

