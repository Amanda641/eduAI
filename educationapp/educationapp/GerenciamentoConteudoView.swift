
import SwiftUI

struct GerenciamentoConteudoView: View {
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Criar/Editar Conteúdo")) {
                    TextField("Título", text: .constant(""))
                    TextField("Matéria", text: .constant(""))
                    TextEditor(text: .constant("Descrição"))
                }
                Button("Salvar") {
                    // Implementar salvar
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            Text("Lista de Materiais")
                .font(.headline)
                .padding()
            
            List {
                ForEach(0..<5) { index in
                    HStack {
                        Text("Material \(index + 1)")
                        Spacer()
                        Button("Editar") {
                            // Implementar edição
                        }
                        Button("Excluir") {
                            // Implementar exclusão
                        }
                    }
                }
            }
        }
        .navigationTitle("Gerenciamento de Conteúdo")
    }
}


