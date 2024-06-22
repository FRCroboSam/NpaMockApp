//
//  VerificationView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/11/24.
//

import Foundation
import SwiftUI


struct VerificationView: View {
    @State var fill: CGFloat = 0
    
    var body: some View {
        CustomNavBar(title: "Verification", backButtonHidden: true)
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Text("Verification Tasks")
                        .font(.title)
                        .bold()
                        .padding(10)
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(.blue)
                        .font(.title)
                        .padding(.trailing, 20)
                    Spacer()
                }
                .padding(.bottom, -10)
                Text("Upload Academic Transcript")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 15)
                VStack{
                    Text("Tap to Upload")
                    Image(systemName: "plus.circle")
                        .foregroundStyle(.gray.opacity(0.7))
                        .font(.title)
                }
                .frame(width: 120, height: 200)

                    .font(.headline)
                    .background{
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10]))
                            .foregroundStyle(.gray.opacity(0.7))
                        
                            .frame(width: 120, height: 200)
                        
                    }
                    .padding(.leading, 20)
                Text("Upload Drug Screening Results")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 15)
                HStack{
                    VStack{
                        Text("Tap to Upload")
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.gray.opacity(0.7))
                            .font(.title)
                    }
                        .font(.headline)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                .foregroundStyle(.gray.opacity(0.7))
                                .frame(width: 120, height: 180)
                            
                        }
                    Spacer()
                        .frame(width: 25)
                    Image("drug_screening")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 180)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                .foregroundStyle(.gray.opacity(0.7))
                                .overlay(alignment: .topLeading){
                                    Image(systemName: "x.circle.fill")
                                        .font(.title)
                                        .foregroundStyle(.red)
                                        .offset(x: -8, y: -10)
                                        .background{
                                            Color.white
                                        .clipShape(Circle())
                                        }

                                }
                            
                        }
                }
                .padding(.leading, 20)
                Text("Upload Medical Documents/Waviers")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 15)
                HStack{
                    VStack{
                        Text("Tap to Upload")
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.gray.opacity(0.7))
                            .font(.title)
                    }
                        .font(.headline)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                .foregroundStyle(.gray.opacity(0.7))
                            
                                .frame(width: 120, height: 180)
                            
                        }
                    Image("academic_transcripts")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 180)
                }
                .padding(.leading, 20)

            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    VerificationView()
}



struct ProjectDocumentPicker: UIViewControllerRepresentable {
    @Binding var added: Bool
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: [.text,.pdf])
        controller.allowsMultipleSelection = false
        controller.shouldShowFileExtensions = true
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeCoordinator() -> DocumentPickerCoordinator {
        DocumentPickerCoordinator(added: $added)
    }
    
}
class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate {
    @Binding var added: Bool

    init( added: Binding<Bool> ) {
        self._added = added
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            return
        }
        added = true
    }
    
}
