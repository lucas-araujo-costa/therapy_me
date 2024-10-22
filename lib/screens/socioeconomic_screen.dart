import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';  // Import do widget de texto
import '../widgets/custom_dropdown_field.dart';  // Import do widget de dropdown

class SocioeconomicScreen extends StatefulWidget {
  @override
  _SocioeconomicScreenState createState() => _SocioeconomicScreenState();
}

class _SocioeconomicScreenState extends State<SocioeconomicScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _livesWithOthers = false;
  String? _currentWorkStatus;
  String? _incomeRange;
  int? _numberOfPeople;

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
                          value: 0.32, // Exemplo de progresso para essa etapa
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
                              'Nos dê uma visão da sua vida profissional:',
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

                        // Campo de Profissão
                        CustomTextField(
                          hintText: 'Profissão',
                          isRequired: true,
                        ),
                        SizedBox(height: 18),

                        // Campo de Situação Atual (Dropdown)
                        CustomDropdownField(
                          hintText: 'Situação Atual',
                          options: ['Ativo', 'Desempregado', 'Aposentado', 'Pensionista', 'Dependente'],
                          isRequired: true,
                          onChanged: (value) {
                            setState(() {
                              _currentWorkStatus = value;
                            });
                          },
                        ),
                        SizedBox(height: 18),

                        // Mora com outras pessoas? (Dropdown)
                        CustomDropdownField(
                          hintText: 'Mora com outras pessoas?',
                          options: ['Sim', 'Não'],
                          isRequired: true,
                          onChanged: (value) {
                            setState(() {
                              _livesWithOthers = value == 'Sim';
                            });
                          },
                        ),
                        SizedBox(height: 18),

                        // Campo para "Quantas pessoas?" (Aparece se o usuário marcar "Sim")
                        if (_livesWithOthers) ...[
                          CustomTextField(
                            hintText: 'Quantas pessoas?',
                            isRequired: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira o número de pessoas';
                              }
                              if (int.tryParse(value) == null) {
                                return 'Insira um número válido';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 18),
                        ],

                        // Campo de Faixa de Renda Familiar (Dropdown)
                        CustomDropdownField(
                          hintText: 'Faixa de Renda Familiar',
                          options: [
                            'Até 1 salário mínimo',
                            '2 a 3 salários mínimos',
                            '3 a 5 salários mínimos',
                            'Acima de 5 salários mínimos'
                          ],
                          isRequired: true,
                          onChanged: (value) {
                            setState(() {
                              _incomeRange = value;
                            });
                          },
                        ),
                        SizedBox(height: 18),

                        // Botões Anterior e Próximo
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Botão Anterior
                            SizedBox(
                              width: 172,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context); // Volta para a tela anterior
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
                                    Navigator.pushNamed(context, '/therapyExperience'); // Navega para a próxima tela
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
