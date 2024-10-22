// lib/presentation/screens/general_data/current_treatment_screen.dart

import 'package:flutter/material.dart';

class CurrentTreatmentScreen extends StatefulWidget {
  @override
  _CurrentTreatmentScreenState createState() => _CurrentTreatmentScreenState();
}

class _CurrentTreatmentScreenState extends State<CurrentTreatmentScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isInTreatment = false;
  bool _isTakingMedication = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tratamento Atual'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Faz tratamento atualmente?
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Faz tratamento atualmente?'),
                items: ['Sim', 'Não']
                    .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _isInTreatment = value == 'Sim';
                  });
                },
              ),

              if (_isInTreatment) ...[
                // Toma medicação?
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Toma medicação?'),
                  items: ['Sim', 'Não']
                      .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _isTakingMedication = value == 'Sim';
                    });
                  },
                ),

                // Diagnóstico atual
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Diagnóstico atual'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu diagnóstico atual';
                    }
                    return null;
                  },
                ),
              ],

              const SizedBox(height: 20),

              // Botão "Finalizar"
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Finaliza a seção ou volta à tela anterior
                    Navigator.pushNamed(context, '/reasonForConsultation'); // Exemplo: voltar para a tela anterior
                  }
                },
                child: const Text('Próximo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
