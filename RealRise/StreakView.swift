import SwiftUI
import HalfASheet

struct StreakView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingTime = false
    @State private var amount = 0.0
    @State private var currentDate = Date()
    
    var body: some View {
        
        ZStack {
            Color("mint")
                .ignoresSafeArea()
            VStack {
                ZStack {
                    VStack(alignment: .leading) {
                        HStack{
                            VStack (alignment:.leading){
                                Text("Current Streak")
                                    .font(.custom(FontsManager.DMSans.medium, size: 20))
                                    .foregroundColor(.white)
                                Text("0 Days")
                                    .font(.custom(FontsManager.DMSans.bold, size: 34))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            Image("fire")
                        }
                    }
                    .padding()
                    
                }
                .frame(width: UIScreen.main.bounds.width - 32, height: 113)
                .background(LinearGradient(colors: [Color("purple"),  Color("blue")], startPoint: .trailing, endPoint: .leading))
                .cornerRadius(25)
                .padding(.horizontal)
                .padding(.bottom,10)
                
                
                ZStack {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack (alignment:.leading){
                                Text("Never miss a day!")
                                    .font(.custom(FontsManager.DMSans.bold, size: 28))
                                    .foregroundColor(Color("darkblue"))
                                Text("Get a reminder everyday to fill in your learnings")
                                    .font(.custom(FontsManager.DMSans.medium, size: 20))
                                    .foregroundColor(Color("black"))
                            }
                            Spacer()
                        }
                        
                        Button {
                                isShowingTime.toggle()
                        } label: {
                            Text("Set Reminder")
                                .frame(width: 325, height: 47)
                                .background(LinearGradient(colors: [Color("purple"),  Color("blue")], startPoint: .trailing, endPoint: .leading))
                                .foregroundColor(Color("white"))
                                .cornerRadius(15)
                                .shadow(color: Color("darkpurple"), radius: 5, x: 2, y: 2)
                                .font(.custom(FontsManager.DMSans.bold, size: 20))
                        }
                        
                        //
                    }
                    .padding()
                    
                    
                    
                }
                .frame(width: UIScreen.main.bounds.width - 32, height: 212)
                .background(Color("white"))
                .cornerRadius(25)
                .padding(.horizontal)
                
                Spacer()
            }
            
            HalfASheet(isPresented: $isShowingTime, title: "Set Reminder") {
                VStack {
                            DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .pickerStyle(.wheel)
                        }
            }
            .height(.proportional(0.4))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct StreakView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView()
    }
}
