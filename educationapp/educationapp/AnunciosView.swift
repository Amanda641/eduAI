import SwiftUI

struct AnunciosView: View {
    var body: some View {
        VStack {
            TextEditor(text: .constant("Escreva seu anúncio"))
                .padding()
            
            Button("Enviar Anúncio") {
                // Implementar envio
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Text("Histórico de Mensagens")
                .font(.headline)
                .padding()
            
            List {
                ForEach(0..<5) { index in
                    VStack(alignment: .leading) {
                        Text("Anúncio \(index + 1)")
                            .font(.headline)
                        Text("Descrição do anúncio...")
                            .font(.subheadline)
                        Text("Data e Hora")
                            .font(.caption)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Anúncios e Mensagens")
    }
}

