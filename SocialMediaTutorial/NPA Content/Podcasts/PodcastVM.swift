//
//  AthleteVM.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import Foundation
class PodcastVM: ObservableObject{
    @Published var podcasts: [Podcast] = []
//    @Published var selected_podcast: Athlete?
    init(){
        fetchPodcasts()
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
    
    func fetchPodcasts() {
        //change this to match comment fetching logic when you add support for changing athlete data
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let sourceURL = Bundle.main.bundleURL.appendingPathComponent("podcasts.json")
        if(!FileManager.default.fileExists(atPath: sourceURL.path)){
            print("CAN'T FIND podcasts.json in bundle")

        }
        copyFileFromBundleToDocumentsFolder(sourceFile: "podcasts.json") //-> when you need to reset comments

        if let documentsURL{
            do {
                let fileURL = documentsURL.appendingPathComponent("podcasts.json")
                if(!FileManager.default.fileExists(atPath: fileURL.path)){
                    print("COPYING FROM BUNDLE for podcasts")

                    copyFileFromBundleToDocumentsFolder(sourceFile: "podcasts.json") //-> when you need to reset comments
                }
                if let podcasts = try? Data(contentsOf: fileURL) {

                    let podcasts2 = try! JSONDecoder().decode([Podcast].self, from: podcasts)
                    self.podcasts = podcasts2
                } else {
                    print("FAILED TO LOAD PODCAST")
                }
                
            }
        }
    }
    
}
