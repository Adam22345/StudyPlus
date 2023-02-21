/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation
import SwiftUI

class SubjectStorage: ObservableObject {
    @Published var subjects: [CurrentSchedule] = []
    
    private static func fileLocation() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("subjects.data")
    }
    
    static func load(completion: @escaping (Result<[CurrentSchedule], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileLocation()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let currentSchedule = try JSONDecoder().decode([CurrentSchedule].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(currentSchedule))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func store(subjects: [CurrentSchedule], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(subjects)
                let outfile = try fileLocation()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(subjects.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
