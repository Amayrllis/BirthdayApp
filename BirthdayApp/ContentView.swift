//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    //This is an array with @state
    @State private var newName = "" //This is an empty string to put whatever name I want.
    @State private var newBirthday = Date.now //This is a placeholder. Not everybody is born today!
    @State private var friends: [Friend] = [
        Friend(name: "Amaryllis", birthday: .now),
        Friend(name: "Lamlae", birthday: .now)
    ] //The syntax for an array is []. This is an array.
    //Curly brackets are enclosed in the struct, used for functions, stacks, navigations, and classes
    
    var body: some View {
        //Here's a new Navigation Stack.
        NavigationStack{
            //This is a list
            List(friends, id: \.name) { friend in
                // This is an HStack
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    
                }
                
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date){
                        //The $ sign is two way binding. It gets saved as a private variable and as part of your code.
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save"){
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
        // closing the nav stack
        }
        //closing the body
    }
    //closing the struct

#Preview {
    ContentView()
}
