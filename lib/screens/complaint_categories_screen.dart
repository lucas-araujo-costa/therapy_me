import 'package:flutter/material.dart';

class ComplaintCategoriesScreen extends StatefulWidget {
  @override
  _ComplaintCategoriesScreenState createState() => _ComplaintCategoriesScreenState();
}

class _ComplaintCategoriesScreenState extends State<ComplaintCategoriesScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String> _selectedCategories = [];

  // Lista de categorias disponíveis
  final List<String> _categories = [
    'Questões emocionais gerais',
    'Questões de identidade',
    'Luto',
    'Questões comportamentais',
    'Questões educacionais',
    'Abuso/Violência',
    'Questões familiares',
    'Questões sexuais',
    'Relacionamentos',
    'Substâncias químicas',
    'Pensamentos suicidas',
    'Nenhuma das categorias',
  ];

  // Função para gerenciar a seleção múltipla
  void _onCategorySelected(bool selected, String category) {
    setState(() {
      if (selected) {
        if (category == 'Nenhuma das categorias') {
          _selectedCategories.clear();
          _selectedCategories.add(category);
        } else {
          _selectedCategories.remove('Nenhuma das categorias');
          _selectedCategories.add(category);
        }
      } else {
        _selectedCategories.remove(category);
      }
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
                          value: 1.0, // Progresso completo para a última etapa
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
                              'Queixas e Sintomas Prioritários:',
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

                        // Lista de categorias com seleção múltipla (checkboxes)
                        ..._categories.map((category) {
                          return CheckboxListTile(
                            title: Text(
                              category,
                              style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                            ),
                            value: _selectedCategories.contains(category),
                            onChanged: (bool? selected) {
                              _onCategorySelected(selected!, category);
                            },
                            controlAffinity: ListTileControlAffinity.leading, // Checkbox à esquerda
                            activeColor: Color(0xFF0098FF), // Cor do checkbox selecionado (azul)
                          );
                        }).toList(),

                        SizedBox(height: 20),

                        // Botões "Anterior" e "Finalizar"
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

                            // Botão Finalizar
                            SizedBox(
                              width: 172,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_selectedCategories.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Por favor, selecione pelo menos uma categoria.'),
                                      ),
                                    );
                                  } else {
                                    // Finaliza ou salva os dados da seleção de categorias
                                    Navigator.pushNamed(context, '/processing'); // Exemplo: vai para a tela final
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
                                  'Finalizar',
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
