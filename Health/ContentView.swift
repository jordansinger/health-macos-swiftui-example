//
//  ContentView.swift
//  Health
//
//  Created by Jordan Singer on 7/14/20.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Set<Int> = [0]
    
    var body: some View {
        NavigationView {
            List(selection: self.$selection) {
                Label("Summary", systemImage: "heart.fill")
                Label("Favorites", systemImage: "star.fill")
                Label("Highlights", systemImage: "sparkles")
                
                Divider()
                
                Label("Activity", systemImage: "flame.fill").accentColor(.orange)
                    .tag(0)
                
                Label("Body", systemImage: "figure.walk").accentColor(.purple)
                Label("Hearing", systemImage: "ear.fill").accentColor(.blue)
                Label("Heart", systemImage: "heart.fill").accentColor(.red)
                Label("Respiratory", systemImage: "lungs.fill").accentColor(Color(NSColor.systemTeal))
                Label("Sleep", systemImage: "bed.double.fill").accentColor(.green)
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 180, idealWidth: 180, maxWidth: 180, maxHeight: .infinity)
            
            ActivityView()
        }
    }
}

struct ActivityView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Module(title: "Steps", value: "5,972", subtitle: "steps")
                Module(title: "Walking + Running Distance", value: "2.8", subtitle: "mi")
                Module(title: "Active Energy", value: "251", subtitle: "cal")
                Module(title: "Resting Energy", value: "1,326", subtitle: "cal")
                Module(title: "Stand Minutes", value: "48", subtitle: "min")
                Module(title: "Exercise Minutes", value: "88", subtitle: "min")
                Module(title: "Stand Hours", value: "6", subtitle: "hr")
            }
            .padding()
        }
        .frame(width: 420)
        .navigationTitle("Activity")
        .toolbar {
            ToolbarItem(placement: .status) {
                
            }
        }
    }
}

struct Module: View {
    var title: String
    var value: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 6) {
                Group {
                    Image(systemName: "flame.fill")
                    Text(title)
                        .font(.headline)
                }
                .foregroundColor(Color(NSColor.systemPink))
                
                Spacer()
                
                Group {
                    Text("5:15 PM")
                    Image(systemName: "chevron.right")
                }
                .font(.callout)
                .foregroundColor(.secondary)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(value)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
