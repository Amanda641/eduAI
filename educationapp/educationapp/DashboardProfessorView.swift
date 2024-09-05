import SwiftUI

struct DashboardProfessorView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("edu")
                Text("Bem-vindo, Professor!")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: GerenciamentoConteudoView()) {
                    Text("Gerenciamento de Conteúdo")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: AnunciosView()) {
                    Text("Anúncios e Mensagens")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: SugestoesView()) {
                    Text("Sugestões de Questões e Matérias")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            
        }
    }
}
