
import SwiftUI

struct LoginView: View {
    @Binding var showLogin: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var role: String?
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Senha", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Button("Aluno") {
                    role = "aluno"
                }
                .padding()
                Button("Professor") {
                    role = "professor"
                }
                .padding()
            }
            
            Button("Entrar") {
                // Simulação de login simples
                print("Botão Entrar pressionado")
                print("Email: \(email), Senha: \(password), Role: \(role ?? "nenhum")")
                if (email == "" && password == "" && role == "aluno") ||
                    (email == "" && password == "" && role == "professor") {
                    isLoggedIn = true
                    showLogin = false
                    print("Login bem-sucedido")
                } else {
                    print("Falha no login")
                    // Implementar tratamento de erro
                }
            }
        }
    }
}
