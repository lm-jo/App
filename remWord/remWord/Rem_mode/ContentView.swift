import SwiftUI
import SwiftData

struct ContentView: View
{
    
    //boolean variables:
    @State var isMessageVisi = true
    @State var isStart = false
    @State var isAddToFile = true
    @State var isGoBack = false
    @State var isOpenAFile = false
    @State var userInput: String = ""
    @State var isUserAddWords = false
    @State var isUserStopInput = false
    
    @StateObject private var wordListModel = WordListModel()

    var body: some View
    {
        VStack
        {
            if isMessageVisi
            {
                Text(message)
                    .font(.largeTitle)
                    .padding()
            }
            
            Button(action: {isMessageVisi.toggle(); isStart.toggle()})
            {
                if !isStart
                {
                    Text(start)
                }
            }
        }
///VStack (1)..................................................................................................................................................................................................................................................................................................
        //actually it means is_start
        if isStart
        {
            NavigationView {
                       VStack {
                           NavigationLink(destination: FileStorage(wordListModel: wordListModel)) {
                               Text("My files")
                                   .padding()
                                   .background(Color.blue)
                                   .foregroundColor(.white)
                                   .cornerRadius(8)
                           }
                       }
                       .navigationTitle("My workspace")
                   }
        }
    }
}

#Preview {
    ContentView()
}



