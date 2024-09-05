import SwiftUI

struct DashboardView: View {
    @State private var selectedRole: String?

    var body: some View {
        NavigationView {
            VStack {
                if let role = selectedRole {
                    if role == "aluno" {
                        DashboardAlunoView()
                    } else if role == "professor" {
                        DisciplinasProfessorView()
                    }
                } else {
                    VStack {
                        Button("Entrar como Aluno") {
                            selectedRole = "aluno"
                        }
                        .padding()
                        Button("Entrar como Professor") {
                            selectedRole = "professor"
                        }
                        .padding()
                    }
                }
            }
            
        }
    }
}


