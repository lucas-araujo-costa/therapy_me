import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginSelected = true; // Inicializa com a aba de Login selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Título da tela
                  Text(
                    'Bem-vindo(a) ao',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Therapy.me',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Botões Login e Cadastre-se
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildToggleButton('Login', isLoginSelected),
                      _buildToggleButton('Cadastre-se', !isLoginSelected),
                    ],
                  ),
                ],
              ),
            ),
            // Conteúdo que muda de acordo com a seleção
            Expanded(
              child: Container(
                color: Color(0xffe6f5ff),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: SingleChildScrollView(
                  child: isLoginSelected ? _buildLoginForm() : _buildSignUpForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Botão de alternância entre Login e Cadastro
  Widget _buildToggleButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLoginSelected = (text == 'Login');
        });
      },
      child: Container(
        width: 185, // Largura fixa
        height: 43, // Altura fixa
        transform: Matrix4.translationValues(0.0, -15.0, 0.0), // Translação negativa no eixo Y
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffe6f5ff) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Formulário de Login
  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSocialButton('Login com Google', Icons.login, Colors.white, 'google_logo.png'),
        SizedBox(height: 13), // Espaçamento ajustado entre os botões sociais
        _buildSocialButton('Login com Apple', Icons.login, Colors.black, 'apple_logo.png'),
        SizedBox(height: 30), // Espaçamento ajustado para 30px acima do texto
        Center(
          child: Text(
            'ou continue com e-mail',
            style: TextStyle(fontSize: 13),
          ),
        ),
        SizedBox(height: 30), // Espaçamento ajustado para 30px abaixo do texto
        _buildCustomTextField('Endereço de e-mail', Icons.email),
        SizedBox(height: 10),
        _buildCustomTextField('Senha', Icons.lock, obscureText: true), // Campo de senha
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Esqueceu sua senha?', style: TextStyle(fontSize: 14)),
        ),
        SizedBox(height: 20),
        _buildMainButton('Login', Colors.blue),
        SizedBox(height: 20),
        Center(
          child: Text(
            'Ao fazer login com uma conta, você concorda com nossos Termos de Serviço e Política de Privacidade.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Formulário de Cadastro
  Widget _buildSignUpForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSocialButton('Entrar com Google', Icons.login, Colors.white, 'google_logo.png'),
        SizedBox(height: 13), // Espaçamento ajustado entre os botões sociais
        _buildSocialButton('Entrar com Apple', Icons.login, Colors.black, 'apple_logo.png'),
        SizedBox(height: 30), // Espaçamento ajustado para 30px acima do texto
        Center(
          child: Text(
            'ou cadastre-se com e-mail',
            style: TextStyle(fontSize: 13),
          ),
        ),
        SizedBox(height: 30), // Espaçamento ajustado para 30px abaixo do texto
        _buildCustomTextField('Endereço de e-mail', Icons.email),
        SizedBox(height: 10),
        _buildCustomTextField('Senha', Icons.lock, obscureText: true),
        SizedBox(height: 10),
        _buildCustomTextField('Confirmar Senha', Icons.lock, obscureText: true),
        SizedBox(height: 20),
        _buildMainButton('Cadastre-se', Colors.blue),
        SizedBox(height: 20),
        Center(
          child: Text(
            'Ao cadastrar sua conta, você concorda com nossos Termos de Serviço e Política de Privacidade.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Widget de TextField customizado
  Widget _buildCustomTextField(String hintText, IconData icon, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // Remove a borda preta
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  // Botão principal (Login ou Cadastre-se)
  Widget _buildMainButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/generalInfoScreen');
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Botão social (Google, Apple)
  Widget _buildSocialButton(String text, IconData icon, Color iconColor, String asset) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.white,
      ),
      icon: Image.asset(
        'assets/$asset',
        height: 24,
        width: 24,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 19, // Tamanho da fonte ajustado para 19px
          color: Colors.black,
        ),
      ),
    );
  }
}
