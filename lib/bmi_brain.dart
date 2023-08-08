import 'dart:math';

class BmiBrain {
  late int height;
  late int weight;

  BmiBrain({required this.height, required this.weight});

  late double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else if (_bmi <= 0) {
      return "Re-Calculate Please";
    } else {
      return "UnderWeight";
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return "You have a Higher than a Normal body weight. Please Exercise more";
    } else if (_bmi > 18.5) {
      return "You have a Normal body weight. Good Job keep up the good lifestyle|||";
    } else if (_bmi <= 0) {
      return "Re-Calculate Please";
    } else {
      return "You have a Lower than Normal body weight. Eat more but Healthy foods";
    }
  }
}
