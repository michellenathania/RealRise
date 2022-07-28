import SwiftUI

struct LessonView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var lessons: FetchedResults<Lesson>
    @ObservedObject var lesson: Lesson
    var body: some View {
        ZStack
        {
            
            Color("mint")
                .ignoresSafeArea()
            ScrollView(.vertical)
            {
                Text(lesson.summary ?? "")
                    .foregroundColor(Color("black"))
                    .font(.custom(FontsManager.DMSans.regular, size: 18))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
            }
        }
        .navigationTitle("\(lesson.title ?? "")")
//        .foregroundColor(Color("black"))
//        .font(.custom(FontsManager.DMSans.bold, size: 28))
    }
}

//struct LessonView_Previews: PreviewProvider {
//    static var previews: some View {
//        LessonView()
//    }
//}
