import SwiftUI

struct DashboardAlunoView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("edu")
                    .resizable()
                    .frame(width: 100, height: 100) // Ajuste o tamanho conforme necessário
                Text("Bem-vindo, Aluno!")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: MateriaisEstudoView()) {
                    Text("Materiais de Estudo")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: RevisaoDesempenhoView()) {
                    Text("Revisão de Desempenho")
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
