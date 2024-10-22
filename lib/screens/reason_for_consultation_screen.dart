import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';  // Import do widget de texto

class ReasonForConsultationScreen extends StatefulWidget {
  @override
  _ReasonForConsultationScreenState createState() => _ReasonForConsultationScreenState();
}

class _ReasonForConsultationScreenState extends State<ReasonForConsultationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Barra de progresso
                        LinearProgressIndicator(
                          value: 0.8, // Exemplo de progresso para essa etapa
                          backgroundColor: Colors.grey[300],
                          color: Color(0xFF0098FF),
                          minHeight: 2,
                        ),
                        SizedBox(height: 20),

                        // Título da tela
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 46.0),
                            child: Text(
                              'Motivo da Procura',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Campo de texto para o motivo da consulta
                        CustomTextField(
                          hintText: 'Explique o motivo principal de sua procura por atendimento (máximo de 5 linhas)',
                          controller: _reasonController,
                          isRequired: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, explique o motivo da sua procura';
                            }
                            return null;
                          },
                          maxLines: 5, // Limite de 5 linhas
                          maxLength: 145,
                        ),
                        SizedBox(height: 18),

                        // Botões "Anterior" e "Próximo"
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Botão Anterior
                            SizedBox(
                              width: 172,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context); // Voltar para a tela anterior
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey, // Cor cinza
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                child: Text(
                                  'Anterior',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            // Botão Próximo
                            SizedBox(
                              width: 172,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context, '/complaintCategories'); // Navega para a próxima tela
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF0098FF), // Cor azul
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                child: Text(
                                  'Próximo',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
