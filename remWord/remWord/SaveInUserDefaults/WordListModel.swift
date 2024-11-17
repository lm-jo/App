//
//  WordListModel.swift
//  remWord
//
//  Created by Johnny Li on 11/14/24.
//

import Foundation
import SwiftUI
import Combine

struct WordData: Codable {
    var wordLists: [[String]]
    var listNames: [String]
}

class WordListModel: ObservableObject {
    @Published var wordData: WordData

    private let wordDataKey = "wordData"

    init() {
        // Load data from UserDefaults when the model initializes
        if let data = UserDefaults.standard.data(forKey: wordDataKey),
           let savedWordData = try? JSONDecoder().decode(WordData.self, from: data) {
            wordData = savedWordData
        } else {
            // Default data if nothing is saved
            wordData = WordData(wordLists: [["Apple", "Banana"], ["Cat", "Dog"], ["House", "Car"]],
                                listNames: ["Word List 1", "Word List 2", "Word List 3"])
        }
    }

    // Save word lists and names to UserDefaults
    func saveWordLists() {
        if let encoded = try? JSONEncoder().encode(wordData) {
            UserDefaults.standard.set(encoded, forKey: wordDataKey)
        }
    }
}
