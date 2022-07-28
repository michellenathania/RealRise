import SwiftUI

struct TabBarView: View {
    @State var showAddView: Bool = false
    @State var selectedTabItem: Int = 1
    @State var oldSelectionItem: Int = 1
//    @Binding var textTitle: String
    
    var body: some View {
        NavigationView
        {
            TabView (selection: $selectedTabItem)
            {
                LearnView()
                    .tabItem
                {
                    Image("learn button")
                }.tag(1)
                
                Text("")
                    .tabItem
                {
                    Image("add button")
                }.tag(2)
                
                StreakView()
                    .tabItem
                {
                    Image("streak button")
                }.tag(3)
            }
            .onChange(of: selectedTabItem, perform: {
                if(selectedTabItem == 2) {
                    showAddView.toggle()
                } else {
                    self.oldSelectionItem = $0
                }
            })
            .sheet(isPresented: $showAddView)
            {
                selectedTabItem = oldSelectionItem
            } content: {
                AddView(textTitle: "", textSummary: "")
            }

        }
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
