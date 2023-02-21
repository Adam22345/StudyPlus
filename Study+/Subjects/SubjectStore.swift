//
//  SubjectStore.swift
//  Study+
//
//  Created by Adam Mohsin on 20/02/2023.
//

import Foundation

import SwiftUI

class SubjectStore: ObservableObject {
    
    @Published var subjects: [Subject] = []
    
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        
        .appendingPathComponent("subjects.data")
    }
    
    
    static func load(completion: @escaping (Result<[Subject], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let subject = try JSONDecoder().decode([Subject].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(subject))
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                    
                }
            }
            
            
        }
        
        
    }
    
    static func save(subjects: [Subject], completion: @escaping (Result<Int, Error>)->Void) {
        
        DispatchQueue.global(qos: .background).async {
                    do {
                        let data = try JSONEncoder().encode(subjects)
                        let outfile = try fileURL()
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
