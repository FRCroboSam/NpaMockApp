
import SwiftUI

struct iosCheckboxToggleStyle: View {
    @Binding var checked: Bool
    @State var color: Color?
    var body: some View {
//        Button {
//            self.checked.toggle()
//        } label: {
            if(checked){
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .foregroundStyle(color ?? Color(UIColor.systemGray4))
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

            }
            else{
                Circle()
                    .strokeBorder(color ?? Color(UIColor.systemGray4))
                    .frame(width: 50, height: 50)
//        }

            
//            Image(systemName: checked ? "checkmark.square.fill" : "square")
//                .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
//                .frame(width: 30, height: 30)
//                .clipShape(Circle())
        }//.buttonStyle(.bordered)


    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            iosCheckboxToggleStyle(checked: $checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
