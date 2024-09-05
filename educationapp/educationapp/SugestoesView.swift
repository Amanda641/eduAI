import SwiftUI

struct SugestoesView: View {
    @State private var suggestions: [String] = []
    @State private var selectedFile: String?
    @State private var availableFiles: [String] = ["Arquivo 1", "Arquivo 2", "Arquivo 3"]
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            Text("Sugestões de Questões e Matérias")
                .font(.title)
                .padding()

            Picker("Selecione um arquivo", selection: $selectedFile) {
                ForEach(availableFiles, id: \.self) { file in
                    Text(file).tag(file as String?)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            if isLoading {
                ProgressView("Gerando sugestões...")
                    .padding()
            } else if let file = selectedFile {
                List(suggestions, id: \.self) { suggestion in
                    Text(suggestion)
                }
                .onAppear {
                    generateSuggestions(for: file)
                }
            } else {
                Text("Selecione um arquivo para ver as sugestões")
                    .font(.subheadline)
                    .padding()
            }
        }
        .navigationTitle("Sugestões")
    }

    func generateSuggestions(for file: String) {
        isLoading = true
        suggestions = []

        
        guard let url = URL(string: "https://suaapi.com/gerarSugestoes") else {
            print("URL inválida")
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
   
        let body: [String: Any] = ["fileName": file, "fileContent": "conteúdo do arquivo"] // Substituir pelo conteúdo real do arquivo
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        // Faz a chamada da API
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro na requisição: error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            guard let data = data else {
                print("Nenhum dado retornado")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let iaSuggestions = jsonResponse["suggestions"] as? [String] {
                    DispatchQueue.main.async {
                        self.suggestions = iaSuggestions
                        self.isLoading = false
                    }
                } else {
                    print("Resposta inesperada do servidor")
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                }
            } catch {
                print("Erro ao processar a resposta JSON: error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
}
