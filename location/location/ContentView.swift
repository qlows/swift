// ContentView.swift
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(locationManager.locationData.sorted { $0.key < $1.key }, id: \.key) { key, value in
                    VStack(alignment: .leading) {
                        Text("Timestamp: \(dateFormatter.string(from: Date(timeIntervalSince1970: key)))")
                        Text("Latitude: \(value.coordinate.latitude), Longitude: \(value.coordinate.longitude)")
                    }
                }
            }
            .navigationTitle("Location Tracker")
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
    }
}
