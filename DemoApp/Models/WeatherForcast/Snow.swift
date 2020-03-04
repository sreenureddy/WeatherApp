import Foundation

struct Snow: Codable {
    let snowValue: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case snowValue = "3h"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        snowValue = try values.decodeIfPresent(Double.self, forKey: .snowValue)
    }
    
}
