import 'package:flutter/material.dart';
import 'package:therapy_me/screens/auth_screen.dart';
import 'package:therapy_me/screens/processing_screen.dart';
import 'package:therapy_me/screens/result_screen.dart';

import 'screens/general_info_screen.dart'; // Dados Gerais
import 'screens/socioeconomic_screen.dart'; // Dados Socioeconômicos
import 'screens/therapy_experience_screen.dart'; // Especificação da Demanda
import 'screens/reason_for_consultation_screen.dart'; // Motivo da Procura
import 'screens/complaint_categories_screen.dart'; // Categorias da Queixa Principal


void main() {
  runApp(TherapyMeApp());
}

class TherapyMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Therapy Me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // Isso garante que o AppBar seja branco em todas as telas
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(), // Login
        '/generalInfoScreen': (context) => GeneralInfoScreen(), // Dados Gerais
        '/socioeconomicScreen': (context) => SocioeconomicScreen(), // Dados Socioeconômicos
        '/therapyExperience': (context) => TherapyExperienceScreen(), // Experiência com Terapias
        '/reasonForConsultation': (context) => ReasonForConsultationScreen(), // Motivo da Procura
        '/complaintCategories': (context) => ComplaintCategoriesScreen(), // Categorias da Queixa Principal
        '/processing': (context) => ProcessingScreen(), // Processamento de dados
        '/resultScreen': (context) => ResultScreen(), // Resultado final
      },
    );
  }
}
