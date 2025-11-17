

import SwiftUI

enum Tabs {
    case Home, New, Radio, Songs, Library, Search
}



struct TabBarView: View {
    @State var selectedTab: Tabs = .Home
    @State var searchString = ""
    let mainColor = Color (red: 0.2, green: 0.6, blue: 0.5)
    
    var body: some View {
        TabView (selection: $selectedTab) {
            Tab ("Home", systemImage: "house.fill", value: .Home) {
                NavigationStack {
                    ListenNowView ()
                }
                
            }
            Tab ("New", systemImage: "square.grid.2x2.fill", value: .New) {
                NavigationStack {
                    BrowseView ()
                }
                
            }
            Tab ("Radio", systemImage: "antenna.radiowaves.left.and.right", value: .Radio){
                NavigationStack {
                    RadioView ()
                }
                
            }
            Tab ("Songs", systemImage: "music.note.square.stack.fill", value: .Library){
                NavigationStack {
                    LibraryView ()
                }
                
            }
            Tab (value: .Search, role: .search) {
                NavigationStack {
                    SearchView()
                    //List {
                        //Text ("Type your research here")
                    //}
                   // .navigationTitle("Search")
                   // .searchable (text: $searchString)
                }
            }
        }
        .accentColor(.red)
    }
}


#Preview {
    TabBarView()
}
