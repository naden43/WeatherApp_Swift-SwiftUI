//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//


import Foundation

class WeatherData: Codable {
    let location: Location?
    let current: Current?
    var forecast: Forecast?
}

class Current: Codable {
    let lastUpdated: String?
    let tempC: Double?
    let condition: Condition?
    let pressureMB, pressureIn: Double?
    let humidity, feelslikeC: Double?
    let visKM: Double?
    
    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case condition
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case humidity
        case feelslikeC = "feelslike_c"
        case visKM = "vis_km"
    }
}

class Condition: Codable {
    let text: String?
    let icon: String?
}

class Forecast: Codable {
    var forecastday: [Forecastday]?
}

class Forecastday: Codable {
    let date: String?
    let day: Day?
    let astro: Astro?
    var hour: [Hour]?
    var litrealDate: String = ""

    enum CodingKeys: String, CodingKey {
        case date, day, astro, hour
    }

    init(date: String?, day: Day?, astro: Astro?, hour: [Hour]?) {
        self.date = date
        self.day = day
        self.astro = astro
        self.hour = hour
    }
}
struct Astro: Codable {
    let sunrise, sunset: String
    let isMoonUp, isSunUp: Int

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

struct Day: Codable {
    let maxtempC, mintempC: Double
    let condition: Condition
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
}

class Hour: Codable {
    var time: String?
    var tempC: Double?
    var condition: Condition?


    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
    }
}

struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
    }
}
