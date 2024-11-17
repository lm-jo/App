
import SwiftUI
import SwiftData



//string variables:
var message = "Hello, it's RemWord!"
var start = "Start now!"
var addWords = "add words"
var addToFile = String()
var newFile = "New Files"
var goBack = String()
var done = String()

//arrays:
var wordList: [String] = []

///.........................................................................................................................................................................................................................................................................................................................................................................................................


//functions:
//func openFileMenuButton (isAddToFile: Binding<Bool>, isGoBack:Binding<Bool>, isOpenAFile: Binding<Bool>, addToFile: String) -> some View{
//    NavigationView {
//                VStack {
//                    // Button that navigates to FileStorage
//                    NavigationLink(destination: FileStorage()) {
//                        Text("My files")
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                    }
//                }
//                .navigationTitle("Your workspace")
//            }
//}



func goBackButton (isAddToFile: Binding<Bool>, isGoBack: Binding<Bool>, isOpenAFile: Binding<Bool>, goBack: String) -> some View{
    HStack{
        Button(action: {isAddToFile.wrappedValue.toggle()/*to True*/; isGoBack.wrappedValue.toggle()/*to Flase*/; isOpenAFile.wrappedValue.toggle()}){
            if isGoBack.wrappedValue{
                Text(goBack)
            }
        }
        .position(x:60, y:0)}
    }
    


//isOpenAFile:是否显示图标
func openFileButton (isGoBack: Binding<Bool>, isOpenAFile: Binding<Bool>, isUserAddWords: Binding<Bool>) -> some View{
    HStack{
        Button(action: {isGoBack.wrappedValue.toggle()/*to False*/; isOpenAFile.wrappedValue.toggle()/*to false*/; isUserAddWords.wrappedValue.toggle()/*to True*/}){
            if isOpenAFile.wrappedValue{
                Rectangle()
                    .fill(Color.blue)
                    .frame(width:71, height: 100)
            }
        }
    }
    .position(x:80, y:-300)
}



func doneButton (isUserStopInput: Binding<Bool>, isUserAddWords: Binding<Bool>) -> some View{
    Button(action: {isUserStopInput.wrappedValue.toggle()/*to True*/}){
        ZStack{
            if isUserAddWords.wrappedValue{
                Text("Done")
                    .foregroundColor(Color.blue)
            }
        }
    }
    .position(x:350, y:-480)
}


