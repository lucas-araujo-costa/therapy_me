import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProcessingScreen extends StatefulWidget {
  @override
  _ProcessingScreenState createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    super.initState();

    // Delay de 3 segundos (ou o tempo que você quiser)
    Future.delayed(Duration(seconds: 5), () {
      // Redireciona para outra rota após o delay
      Navigator.pushReplacementNamed(context, '/resultScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
            children: [
              // Título da tela
              Center(
                child: Text(
                  'Processando sua triagem',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40),

              // Widget de carregamento
              Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Color(0xFF0098FF), // Cor azul padrão
                  size: 70, // Tamanho do widget de carregamento
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
