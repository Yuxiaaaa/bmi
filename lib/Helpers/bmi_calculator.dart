import 'package:bmi/Constant/Constant.dart';
import 'package:flutter/foundation.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    //this.bmi = bmi;
  }

  double CalculateBMI() {
    double heightInMeter = height! / 100;

    //final h= pow(Height, 2);
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  }

  String determinebmiCategory() {
    String bmicategory = "";
    if (bmi! < 16.0) {
      bmicategory = underweightSevere;
    } else if (bmi! < 17) {
      bmicategory = underweightModerate;
    } else if (bmi! < 18.5) {
      bmicategory = underweightMild;
    } else if (bmi! < 25.0) {
      bmicategory = normal;
    } else if (bmi! < 30.0) {
      bmicategory = overweight;
    } else if (bmi! < 35.0) {
      bmicategory = obeseI;
    } else if (bmi! < 40.0) {
      bmicategory = obeseII;
    } else if (bmi! >= 40.0) {
      bmicategory = obeseIII;
    }
    return bmiCategory!;
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Posibble nutritional deficiency and osteoporosis";
        break;

      case normal:
        desc = "Low Risk ( healty range).";
        break;

      case overweight:
        desc =
            "Moderate risk for developing heart disease , high blood plessure , stroke , and diabetes mellitus.";
        break;

      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk for developing heart disease , high blood plessure , stroke , and diabetes mellitus.";
        break;
      default:
    }

    bmiDescription = desc;
    return desc;
  }
}
