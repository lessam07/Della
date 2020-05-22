import SwiftyJSON
import Foundation
struct orderStats: Codable {
    let id: Int
    let user_id: Int
    let start_city_id: Int
    let destination_city_id: Int
    let status_id: Int
    let driver_id: Int
    let cargo_photo: String
    let cargo_name: String
    let cargo_weight: String
    let cargo_height: Int
    let cargo_width: Int
    let cargo_length: Int
    let price: String
    let comment: String
    let categories: JSON
    let start_city_name: JSON
    let destination_city_name: JSON
    
}
