import SwiftUI

struct DisciplinasProfessorView: View {
    @State private var availableSubjects: [String] = ["Matemática", "História", "Física", "Química"]
    @State private var selectedSubjects: [String] = ["Matemática"] // Matérias já selecionadas
    @State private var newSubject = "" // Para adicionar novas matérias

    var body: some View {
        NavigationView {
            VStack {
                Text("Gerenciar Matérias")
                    .font(.largeTitle)
                    .padding()
                
                // Campo de texto para adicionar nova matéria
                TextField("Nova Matéria", text: $newSubject)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    adicionarNovaMateria()
                }) {
                    Text("Adicionar Matéria")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                // Listando as matérias que já estão disponíveis
                List(availableSubjects, id: \.self) { subject in
                    HStack {
                        Text(subject)
                        Spacer()
                        // Mostrar um "checkmark" para as matérias selecionadas
                        if selectedSubjects.contains(subject) {
                            Image(systemName: "checkmark")
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // Se já estiver selecionada, remove da lista
                        if selectedSubjects.contains(subject) {
                            selectedSubjects.removeAll { $0 == subject }
                        } else {
                            selectedSubjects.append(subject)
                        }
                    }
                }
                
                // Botão para confirmar as matérias selecionadas
                Button(action: {
                    // Função para salvar as matérias selecionadas
                }) {
                    Text("Salvar Matérias Selecionadas")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        
        }
    }
    
    func adicionarNovaMateria() {
        if !newSubject.isEmpty {
            availableSubjects.append(newSubject)
            newSubject = ""
        }
    }
}
