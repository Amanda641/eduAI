import SwiftUI

struct RevisaoDesempenhoView: View {
    var body: some View {
        VStack {
            Text("Resumo do Desempenho")
                .font(.headline)
                .padding()
            
            List {
                ForEach(0..<5) { index in
                    VStack(alignment: .leading) {
                        Text("Questão \(index + 1)")
                            .font(.headline)
                        Text("Feedback sobre a questão...")
                            .font(.subheadline)
                        Text("Nota: 8/10")
                            .font(.caption)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Revisão de Desempenho")
    }
}


