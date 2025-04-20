//
//  Audio.swift
//  Walkie
//
//  Created by Nathan Wang on 4/19/25.
//
// This is used to start, stop and store recorded audio files.


import Foundation
import AVFoundation

class AudioRecorder {
    private var audioRecorder: AVAudioRecorder?
    
    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)

            let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let timestamp = Int(Date().timeIntervalSince1970) // Unique timestamp
            let audioFileURL = documentsPath.appendingPathComponent("recording_\(timestamp).m4a")

            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 44100,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]

            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
            audioRecorder?.record()
        } catch {
            print("Failed to start recording: \(error.localizedDescription)")
        }
    }

//    func startRecording() {
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//            try audioSession.setCategory(.playAndRecord, mode: .default)
//            try audioSession.setActive(true)
//
//            let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            let audioFileURL = documentsPath.appendingPathComponent("recording.m4a")
//
//            let settings: [String: Any] = [
//                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
//                AVSampleRateKey: 44100,
//                AVNumberOfChannelsKey: 2,
//                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
//            ]
//
//            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
//            audioRecorder?.record()
//        } catch {
//            print("Failed to start recording: \(error.localizedDescription)")
//        }
//    }

    func stopRecording() {
        audioRecorder?.stop()
        audioRecorder = nil
    }
}
