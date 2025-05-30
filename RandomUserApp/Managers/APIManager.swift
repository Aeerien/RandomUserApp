
import Foundation

struct APIManager {
    static let baseURL = "https://randomuser.me/api/?results=50"
    
    static func getUsers() async throws -> [User] {
        guard let url = URL(string: baseURL) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse
            }
            let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            return apiResponse.results
        } catch let decodingError as DecodingError {
            throw APIError.decodingError(decodingError)
        } catch {
            throw APIError.networkError(error)
        }
    }
}
