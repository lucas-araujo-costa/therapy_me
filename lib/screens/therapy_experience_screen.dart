import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';  // Import do widget de texto
import '../widgets/custom_dropdown_field.dart';  // Import do widget de dropdown

class TherapyExperienceScreen extends StatefulWidget {
  @override
  _TherapyExperienceScreenState createState() => _TherapyExperienceScreenState();
}

class _TherapyExperienceScreenState extends State<TherapyExperienceScreen> {
  final _formKey = GlobalKey<FormState>();

  // Variáveis para gerenciar o estado do formulário
  bool _hasTherapyExperience = false;
  bool _willingToShareExperience = false;
  bool _isInTreatment = false;
  bool _isTakingMedication = false;

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
                          value: 0.6, // Exemplo de progresso para essa etapa
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
                              'Conte-nos sobre sua experiência com terapia:',
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

                        // Seção 1: Experiência com Psicoterapia
                        CustomDropdownField(
                          hintText: 'Já fez psicoterapia antes?',
                          options: ['Sim', 'Não'],
                          isRequired: true,
                          onChanged: (value) {
                            setState(() {
                              _hasTherapyExperience = value == 'Sim';
                            });
                          },
                        ),
                        SizedBox(height: 18),

                        if (_hasTherapyExperience) ...[
                          CustomDropdownField(
                            hintText: 'Pode falar sobre essa experiência?',
                            options: ['Sim', 'Não'],
                            isRequired: true,
                            onChanged: (value) {
                              setState(() {
                                _willingToShareExperience = value == 'Sim';
                              });
                            },
                          ),
                          SizedBox(height: 18),

                          if (_willingToShareExperience) ...[
                            CustomTextField(
                              hintText: 'Local',
                              isRequired: true,
                            ),
                            SizedBox(height: 18),
                            CustomTextField(
                              hintText: 'Profissional',
                              isRequired: true,
                            ),
                            SizedBox(height: 18),
                            CustomDropdownField(
                              hintText: 'Tempo de tratamento',
                              options: ['Até 1 mês', 'Até 3 meses', 'Acima de 3 meses'],
                              isRequired: true,
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 18),
                            CustomDropdownField(
                              hintText: 'Motivo do encerramento',
                              options: ['Completo', 'Desistência com justificativa', 'Desistência sem justificativa'],
                              isRequired: true,
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 18),
                          ],
                        ],

                        // Seção 2: Tratamento Atual
                        CustomDropdownField(
                          hintText: 'Faz tratamento atualmente?',
                          options: ['Sim', 'Não'],
                          isRequired: true,
                          onChanged: (value) {
                            setState(() {
                              _isInTreatment = value == 'Sim';
                            });
                          },
                        ),
                        SizedBox(height: 18),

                        if (_isInTreatment) ...[
                          CustomDropdownField(
                            hintText: 'Toma medicação?',
                            options: ['Sim', 'Não'],
                            isRequired: true,
                            onChanged: (value) {
                              setState(() {
                                _isTakingMedication = value == 'Sim';
                              });
                            },
                          ),
                          SizedBox(height: 18),
                          CustomTextField(
                            hintText: 'Diagnóstico atual',
                            isRequired: true,
                          ),
                          SizedBox(height: 18),
                        ],

                        // Botões "Anterior" e "Próximo"
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Botão Anterior
                            SizedBox(
                              width: 172,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context); // Navega para a próxima tela
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
                                    Navigator.pushNamed(context, '/reasonForConsultation'); // Navega para a próxima tela
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
