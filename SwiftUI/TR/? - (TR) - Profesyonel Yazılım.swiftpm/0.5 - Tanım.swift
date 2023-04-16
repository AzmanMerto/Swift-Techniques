import SwiftUI

struct Tanim: View {
    var body: some View {
        VStack {
            Text("Bu Bootcamp de profesyonel bir yazılım temelini göstermiş olacağım. İş sektöründe nelerin kullanıldığı sırası ile bakalım.")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top)
            List {
                NavigationLink {
                    ViewModifiersCamp()
                } label: {
                    Text("1 - View Modifier")
                }
            }
        }
    }
}
