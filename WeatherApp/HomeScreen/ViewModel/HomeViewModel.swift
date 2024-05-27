//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Naden on 19/05/2024.
//

import Foundation
import CoreLocation
import Combine
import Reachability

class HomeViewModel: NSObject , ObservableObject , CLLocationManagerDelegate{
    
    @Published var weatherData: WeatherData?
    var networkHandler: NetworkHandler?
    let manager : CLLocationManager?
    
    let reachability = try! Reachability()
    
    
   
    @Published var isConnected : Bool = false
    @Published var backgoundImageName : String = "Day"
    @Published var isDark : Bool?
    
    init(networkHandler: NetworkHandler, manager : CLLocationManager) {
        
        print("enter init first time")
        self.networkHandler = networkHandler
        self.manager = manager
        super.init()
        checkConnection()
        getPersmission()
     
        
        
    }
    
    func checkConnection(){
        switch reachability.connection    {
            
        case .unavailable:
            isConnected = false
        case .wifi , .cellular:
            isConnected = true
        
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate =  (locations.first?.coordinate)!
        self.loadData(latitude: coordinate.latitude, longitude: coordinate.longitude )
    }
    
    
    func prepareHourlyData(){
        
        print("enter")
        if var forecastDays = weatherData?.forecast?.forecastday {
            print("enter 2")
            for index in 0..<forecastDays.count {
                
                prepareHours(forecastDay: &forecastDays[index])
            }
            print("enter 4")
            weatherData?.forecast?.forecastday = forecastDays
        }
        
        
    }
    
    
    func setTheme(){
        
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let lastUpdatedDate  = dateFormater.date(from: weatherData?.current?.lastUpdated ?? "") else {return}
        dateFormater.dateFormat = "HH"
        let lastUodatedStr = dateFormater.string(from: lastUpdatedDate)
        guard let lastTime = Int(lastUodatedStr) else {return}

        print("\(lastTime) kmbhbjhb")
        if (lastTime < 17  && (lastTime > 6)) {
            backgoundImageName = "Day"
            
            isDark = true
        }
        else {
            backgoundImageName = "Night"
            isDark = false
        }
        
    }
    
    func prepareHours(forecastDay : inout Forecastday){
        
        if let firstHour = forecastDay.hour?.first{
            print("enter 5")
            guard let forecastTime = firstHour.time else { return}
            print("enter 6")

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            print(forecastTime)
            guard let forecastTimeDate = dateFormatter.date(from: forecastTime) else { print("why")
                
                return }
            print("enter 7")

            dateFormatter.dateFormat = "yyyy-MM-dd"

            let forecastDateStr = dateFormatter.string(from: forecastTimeDate)
            let currentDateStr = dateFormatter.string(from: Date())
            
            if forecastDateStr == currentDateStr {
                
                print("ENTER 8")
                
                let calendar = Calendar.current
                let currentHour = calendar.component(.hour, from: Date())
                
                var newHourList: [Hour] = []
                
                for index in currentHour...((forecastDay.hour?.count ?? 1) - 1) {
                    print("enter 9")
                    if let hour = forecastDay.hour?[index], let time = hour.time {
                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                        
                        if let currentHourDate = timeFormatter.date(from: time) {
                            timeFormatter.dateFormat = "HH:mm"
                            let currentHourDateStr = timeFormatter.string(from: currentHourDate)
                            
                            hour.time = currentHourDateStr
                            print(currentHourDateStr)
                            newHourList.append(hour)
                        } else {
                            // Handle the case when conversion from string to date fails
                        }
                    }
                }
                
                print(newHourList.count)
                
                newHourList[0].time = "Now"
                
                forecastDay.hour = newHourList
            }
            else {
                
                var newHourList: [Hour] = []
                
                
                for index in 0...((forecastDay.hour?.count ?? 1) - 1) { // Using '...' to include the current hour
                    print("enter 9")
                    if let hour = forecastDay.hour?[index], let time = hour.time {
                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm" // Corrected format string
                        
                        if let currentHourDate = timeFormatter.date(from: time) {
                            timeFormatter.dateFormat = "HH:mm" // Corrected format string
                            let currentHourDateStr = timeFormatter.string(from: currentHourDate)
                            
                            // Modify the time property of the hour to the current date string
                            hour.time = currentHourDateStr
                            print(currentHourDateStr)
                            newHourList.append(hour)
                        } else {
                            // Handle the case when conversion from string to date fails
                        }
                    }
                }
                
                print(newHourList.count)
                
                
                forecastDay.hour = newHourList
                
            }
        }
        
    }
    
    func getPersmission() {
        
        manager?.delegate = self
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
        
    }
    
    func loadData(latitude: Double, longitude: Double) {
        networkHandler?.loadData(url: "&q=\(latitude),\(longitude)") { [weak self] (weatherData: WeatherData?, error) in
            guard let weatherData = weatherData else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            DispatchQueue.main.async {
                self?.weatherData = weatherData
                self?.prepareData()
                self?.prepareHourlyData()
                self?.setTheme()
            }
        }
    }
    
    func prepareData() {
        for item in weatherData?.forecast?.forecastday ?? [] {
            item.litrealDate = checkCurrentDay(date: item.date ?? "")
        }
    }
    
    func checkCurrentDay(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let providedDate = dateFormatter.date(from: date) else {
            return "Invalid Date"
        }
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.weekday], from: providedDate)
        
        if let weekday = dateComponents.weekday {
            if calendar.isDateInToday(providedDate) {
                return "Today"
            } else {
                return dateFormatter.weekdaySymbols[weekday - 1]
            }
        } else {
            return "Unknown Day"
        }
    }
}
