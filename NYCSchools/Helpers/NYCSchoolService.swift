//
//  NYCSchoolService.swift
//  NYCSchools
//
//  Created by Karthik Vadlamudi on 5/10/21.
//

import Foundation
import UIKit

class NYCSchoolService {
    
    func getHighSchools(completion: @escaping (Result<[HighSchoolInfo], Error>) -> Void) {
        guard let url = URL(string: NYCUrls.kAPI_NYCSchools) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
            }
            do {
                guard let jsondata = data else {
                    return
                }
                let highScools: [HighSchoolInfo] = try! JSONDecoder().decode([HighSchoolInfo].self, from: jsondata)
                completion(.success(highScools ))
                print(highScools )
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
        
    }
    
    func getSatDetails(completion: @escaping (Result<[SatScoreInfo], Error>) -> Void) {
        guard let url = URL(string: NYCUrls.kAPI_SATResults) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
            }
            do {
                guard let jsondata = data else {
                    return
                }
                let satScores: [SatScoreInfo] = try! JSONDecoder().decode([SatScoreInfo].self, from: jsondata)
                completion(.success(satScores ))
                print(satScores )
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
        
    }
    
}
