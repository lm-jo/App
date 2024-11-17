//
//  FileStorage.swift
//  remWord
//
//  Created by Johnny Li on 11/14/24.
//

import Foundation
import SwiftUI
import SwiftData


struct FileStorage: View {
    @ObservedObject var wordListModel: WordListModel
    @State private var isEditing = false

    var body: some View {
        VStack {
            Button(action: {
                wordListModel.wordData.wordLists.append([]) // Add new word list
                wordListModel.wordData.listNames.append("New Word List \(wordListModel.wordData.listNames.count + 1)")
                wordListModel.saveWordLists() // Save changes
            }) {
                Text("Add New Word List")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            List {
                ForEach(wordListModel.wordData.wordLists.indices, id: \.self) { index in
                    NavigationLink(destination: SaveWord(strings: $wordListModel.wordData.wordLists[index], onSave: wordListModel.saveWordLists)) {
                        HStack {
                            if isEditing {
                                TextField("List Name", text: $wordListModel.wordData.listNames[index])
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(8)
                            } else {
                                Text(wordListModel.wordData.listNames[index])
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .onDelete { indexSet in
                    wordListModel.wordData.wordLists.remove(atOffsets: indexSet)
                    wordListModel.wordData.listNames.remove(atOffsets: indexSet)
                    wordListModel.saveWordLists() // Save changes after deletion
                }
            }
        }
        .navigationTitle("Word Lists")
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { isEditing.toggle() }) {
                    Text(isEditing ? "Done" : "Edit")
                }
            }
        }
        .onDisappear {
            wordListModel.saveWordLists() // Save changes when navigating away
        }
    }
}


//struct FileStorage_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        FileStorage()
//    }
//}

