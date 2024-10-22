import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import '../widgets/custom_text_field.dart';  // Import do widget de texto
import '../widgets/custom_dropdown_field.dart';  // Import do widget de dropdown

class GeneralInfoScreen extends StatefulWidget {
  @override
  _GeneralInfoScreenState createState() => _GeneralInfoScreenState();
}

class _GeneralInfoScreenState extends State<GeneralInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String? _pcdValue;
  bool _isPcd = false;

  // Controladores para os campos de data e telefone
  var _dateController = MaskedTextController(mask: '00/00/0000');
  var _phoneController = MaskedTextController(mask: '(00) 0 0000-0000');

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
                        LinearProgressIndicator(
                          value: 0.16,
                          backgroundColor: Colors.grey[300],
                          color: Color(0xFF0098FF),
                          minHeight: 2,
                        ),
                        SizedBox(height: 20),

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 46.0),
                            child: Text(
                              'Vamos começar com seus dados básicos:',
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

                        // Formulário de entrada
                        CustomTextField(hintText: 'Nome Completo',
                          isRequired: true,

                        ),
                        SizedBox(height: 18),

                        // Campo de Data de Nascimento com formatação
                        CustomTextField(
                          hintText: 'Data de Nascimento',
                          controller: _dateController,
                          isRequired: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua Data de Nascimento';
                            }

                            // Tente converter o valor inserido para uma data válida
                            try {
                              final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
                              final DateTime birthDate = dateFormat.parse(value);

                              // Verifique se a data inserida é futura
                              if (birthDate.isAfter(DateTime.now())) {
                                return 'A data não pode ser no futuro';
                              }
                            } catch (e) {
                              return 'Formato de data inválido';
                            }

                            return null;  // Retorna null se tudo estiver correto
                          },
                        ),
                        SizedBox(height: 18),

                        CustomDropdownField(
                          hintText: 'Gênero',
                          options: ['Masculino', 'Feminino', 'Outro'],
                          isRequired: true,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 18),

                        CustomDropdownField(
                          hintText: 'PCD (Pessoa com Deficiência)',
                          options: ['Sim', 'Não'],
                          isRequired:true,
                          onChanged: (value) {
                            setState(() {
                              _pcdValue = value;
                              _isPcd = value == 'Sim';
                            });
                          },
                        ),
                        if (_isPcd) ...[
                          SizedBox(height: 18),
                          CustomTextField(
                            hintText: 'Qual tipo de deficiência?',
                            isRequired:true,
                          ),
                        ],
                        SizedBox(height: 18),

                        CustomDropdownField(
                          hintText: 'Estado Civil',
                          options: ['Solteiro', 'Casado', 'Divorciado', 'Outro'],
                          isRequired:true,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 18),

                        CustomDropdownField(
                          hintText: 'Cor',
                          options: ['Branco', 'Preto', 'Pardo', 'Amarelo', 'Indígena'],
                          isRequired:true,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 18),

                        CustomDropdownField(
                          hintText: 'Escolaridade',
                          options: [
                            'Não Alfabetizado',
                            'Fundamental 1',
                            'Fundamental 2',
                            'Ensino Médio',
                            'Superior Incompleto',
                            'Superior Completo'
                          ],
                          isRequired:true,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 18),

                        // Campo de Telefone com máscara de input
                        CustomTextField(
                          hintText: 'Telefone',
                          controller: _phoneController, // Controlador com a máscara
                        ),
                        SizedBox(height: 18),

                        // Botão de Prosseguir no final
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, '/socioeconomicScreen');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0098FF),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Text(
                              'Prosseguir',
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
