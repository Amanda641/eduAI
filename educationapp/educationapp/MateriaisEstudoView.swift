
import SwiftUI

struct MateriaisEstudoView: View {
    var body: some View {
        VStack {
            TextField("Pesquisar materiais", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List {
                ForEach(0..<5) { index in
                    VStack(alignment: .leading) {
                        Text("Material \(index + 1)")
                            .font(.headline)
                        Text("Descrição do material...")
                            .font(.subheadline)
                        Button("Download") {
                            // Implementar download
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Materiais de Estudo")
    }
}
