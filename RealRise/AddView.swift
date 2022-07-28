import SwiftUI
import HalfASheet

struct AddView: View {
    @Environment(\.managedObjectContext) var context
    
    var chooseCategory = ["Tech", "Design", "Professional", "Personal"]
    @State private var categorytext: String = "Tech"
    
    
    @State var textTitle: String = ""
    @State var textSummary: String
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingCategory = false
    @State private var isShowingDate = false
    @State private var amount = 0.0
    
    @State private var date = Date()
    
    var body: some View {
        
        ZStack {
            Color("mint")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color("black"))
                            .font(.system(size: 25))
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                    Button {
                        let lessons = Lesson(context: context)
                        
                        lessons.title = (textTitle)
                        lessons.summary = (textSummary)
                        lessons.category = (categorytext)
                        lessons.date = (date)
                        try? context.save()
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Text("Save")
                            .foregroundColor(Color("black"))
                            .font(.custom(FontsManager.DMSans.medium, size: 20))
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 24)
                
                VStack(alignment: .leading) {
                    HStack
                    {
                        Text("What Did You Learn Today?")
                            .frame(width: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .font(.custom(FontsManager.DMSans.bold, size: 34))
                            .foregroundColor(Color("darkblue"))
                            .padding()
                        Spacer()
                    }
                    
                }
                
                VStack(alignment: .leading) {
                    Text("Title")
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.bold, size: 18))
                        .padding(.horizontal)
                    TextField("", text: $textTitle)
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.medium, size: 18))
                        .padding(.leading, 16)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 47)
                        .background(Color("darkmint"))
                        .cornerRadius(13)
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color("darkmint").opacity(0.5))
                        )
                    
                    Text("Summary")
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.bold, size: 18))
                        .padding(.horizontal)
                    
                    TextEditor(text: $textSummary)
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.medium, size: 18))
                        .padding(.leading, 12)
                    
                        .colorMultiply(Color("darkmint"))
                        .background(Color("darkmint"))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 144, alignment: .top)
                        .cornerRadius(18)
                        .padding(.horizontal)
                    
                    //                    TextField
                    
                    Text("Category")
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.bold, size: 18))
                        .padding(.horizontal)
                    
                    Text(categorytext)
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.medium, size: 18))
                        .padding(.leading, 16)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 47, alignment: .leading)
                        .background(Color("darkmint"))
                        .cornerRadius(13)
                        .padding(.horizontal)
                        .onTapGesture{
                            isShowingCategory.toggle()
                        }
                    
                    Text("Date")
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.medium, size: 18))
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.bold, size: 18))
                        .padding(.horizontal)
                    
                    Text("\(date, formatter: itemFormatter)")
                        .foregroundColor(Color("black"))
                        .font(.custom(FontsManager.DMSans.medium, size: 18))
                        .padding(.leading, 16)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 47,
                               alignment: .leading)
                        .background(Color("darkmint"))
                        .cornerRadius(13)
                        .padding(.horizontal)
                        .onTapGesture{
                            isShowingDate.toggle()
                        }
                    
                    
                    
                    
                }
                Spacer()
                
            }
            
            HalfASheet(isPresented: $isShowingCategory, title: "Choose Category") {
                VStack {
                    Picker("Choose Category", selection: $categorytext) {
                        ForEach(chooseCategory, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .height(.proportional(0.3))
            
            HalfASheet(isPresented: $isShowingDate, title: "Choose Date") {
                VStack {
                    DatePicker(
                        selection: $date,
                        in: ...Date(),
                        displayedComponents: [.date],
                        label: { EmptyView() }
                    )
                    .labelsHidden()
                    .datePickerStyle(.wheel)
                    .padding(.horizontal)
                }
            }
            .height(.proportional(0.4))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(textTitle: "", textSummary: "")
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
}()
