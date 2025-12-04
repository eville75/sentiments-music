import 'package:flutter/material.dart';
import '../../shared/models/user_model.dart';
import '../../design_system/widgets/mood_button.dart';

class MoodViewModel extends ChangeNotifier {
  final UserModel user;

  MoodViewModel({required this.user});

  final Map<String, List<String>> allSentiments = {
    'Sentimentos Positivos': [
      'Alegria','Amor','Esperança','Gratidão','Inspiração','Entusiasmo',
      'Paz interior','Relaxamento','Coragem','Determinação','Orgulho',
      'Satisfação','Alívio','Confiança','Euforia','Diversão','Otimismo',
      'Liberdade','Carinho','Compaixão',
    ],
    'Sentimentos Negativos': [
      'Tristeza','Raiva','Ansiedade','Medo','Solidão','Melancolia','Ciúmes',
      'Insegurança','Frustração','Angústia','Desespero','Desânimo',
      'Desapontamento','Culpa','Arrependimento','Impaciência','Estresse',
      'Vergonha','Mágoa','Cansaço',
    ],
    'Sentimentos Neutros / Reflexivos': [
      'Nostalgia','Saudade','Calma','Curiosidade','Surpresa','Espera',
      'Neutralidade','Reflexão','Introspecção','Contemplação','Confusão',
      'Indiferença','Mistério','Expectativa','Estranhamento',
    ],
  };

  MoodType resolveType(String category) {
    if (category.contains("Positivos")) return MoodType.positive;
    if (category.contains("Negativos")) return MoodType.negative;
    return MoodType.neutral;
  }
}
