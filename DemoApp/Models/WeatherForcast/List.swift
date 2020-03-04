import Foundation

struct List: Codable {
	let dt: Int?
	let main: Main?
	let weather: [WeatherDetails]?
	let clouds: Clouds?
	let wind: Wind?
	let snow: Snow?
	let sys: Sys?
	let dt_txt : String?

	enum CodingKeys: String, CodingKey {

		case dt = "dt"
		case main = "main"
		case weather = "weather"
		case clouds = "clouds"
		case wind = "wind"
		case snow = "snow"
		case sys = "sys"
		case dt_txt = "dt_txt"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dt = try values.decodeIfPresent(Int.self, forKey: .dt)
		main = try values.decodeIfPresent(Main.self, forKey: .main)
		weather = try values.decodeIfPresent([WeatherDetails].self, forKey: .weather)
		clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
		wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
		snow = try values.decodeIfPresent(Snow.self, forKey: .snow)
		sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
		dt_txt = try values.decodeIfPresent(String.self, forKey: .dt_txt)
	}

}
