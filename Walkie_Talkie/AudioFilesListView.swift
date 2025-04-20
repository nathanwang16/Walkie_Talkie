//
//  AudioFilesListView.swift
//  Walkie
//
//  Created by Nathan Wang on 4/19/25.
//

import SwiftUI

import SwiftUI

struct AudioFilesListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var audioFiles: [URL] = []

    var body: some View {
        NavigationView {
            List(audioFiles, id: \.self) { file in
                Text(file.lastPathComponent)
            }
            .navigationTitle("Recorded Files")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                loadAudioFiles()
            }
        }
    }
    
    private func loadAudioFiles() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let files = try FileManager.default.contentsOfDirectory(at: documentsPath, includingPropertiesForKeys: nil)
            audioFiles = files.filter { $0.pathExtension.lowercased() == "m4a" } // Case-insensitive check
        } catch {
            print("Failed to load audio files: \(error.localizedDescription)")
        }
    }

//    private func loadAudioFiles() {
//        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        do {
//            let files = try FileManager.default.contentsOfDirectory(at: documentsPath, includingPropertiesForKeys: nil)
//            audioFiles = files.filter { $0.pathExtension == "m4a" }
//        } catch {
//            print("Failed to load audio files: \(error.localizedDescription)")
//        }
//    }
}

#Preview {
    AudioFilesListView()
}
