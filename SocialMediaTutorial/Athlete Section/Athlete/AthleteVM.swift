//
//  AthleteVM.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import Foundation
class AthleteVM: ObservableObject{
    @Published var athletes: [Athlete] = []
    @Published var selected_athlete: Athlete?
    @Published var showingFilters: Bool = false
    @Published var animatingFilters: Bool = false 
    init(){
        fetchAthletes() 
    }
    func copyFileFromBundleToDocumentsFolder(sourceFile: String, destinationFile: String = "") {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        if let documentsURL = documentsURL {
            let sourceURL = Bundle.main.bundleURL.appendingPathComponent(sourceFile)
            // Use the same filename if destination filename is not specified
            let destURL = documentsURL.appendingPathComponent(!destinationFile.isEmpty ? destinationFile : sourceFile)
            do {
                try FileManager.default.removeItem(at: destURL)
                print("Removed existing file at destination")
            } catch (let error) {
                print(error)
            }
            do {
                try FileManager.default.copyItem(at: sourceURL, to: destURL)
                print("\(sourceFile) was copied successfully.")
            } catch (let error) {
                print(error)
            }
        }
    }
    
    func fetchAthletes() {
        //change this to match comment fetching logic when you add support for changing athlete data 
        if let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            guard let url = Bundle.main.url(forResource: "athletes", withExtension: "json") else {
                print("json athletes file not found")
                return
            }
            let data = try? Data(contentsOf: url)
            let athletes = try? JSONDecoder().decode([Athlete].self, from: data!)
            self.athletes = athletes!
            print("NUM ATHLETES: " + String(self.athletes.count))
        }
    }
    
}
