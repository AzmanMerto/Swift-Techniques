import SwiftUI

struct Tanim: View {
    var body: some View {
        VStack {
            Text("Bu Bootcamp de profesyonel bir yazılım temelini göstermiş olacağım. İş sektöründe nelerin kullanıldığı sırası ile bakalım.")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
            List {
                NavigationLink {
                    ViewModifiersCamp()
                } label: {
                    Text("1 - ViewModifier")
                }
                NavigationLink {
                    ButtonStyleCamp()
                } label: {
                    Text("2 - ButtonStyle")
                }
                NavigationLink {
                    AnyTransitionsCamp()
                } label: {
                    Text("3 - AnyTransitions")
                }
                NavigationLink {
                    MatchedGeometryEffectCamp()
                } label: {
                    Text("4 - MatchedGeometryEffect")
                }
                NavigationLink {
                    CustomShapeCamp()
                } label: {
                    Text("5 - CustomShape")
                }
            }
        }
    }
}
