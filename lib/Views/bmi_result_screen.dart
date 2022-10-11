import 'package:bmi/Constant/Constant.dart';
import 'package:bmi/Views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class bmiresultscreen extends StatelessWidget {
  const bmiresultscreen({super.key, required this.bmi});
  final double bmi;

  String determinebmiCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue < 17) {
      category = underweightModerate;
    } else if (bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue < 25.0) {
      category = normal;
    } else if (bmiValue < 30.0) {
      category = overweight;
    } else if (bmiValue < 35.0) {
      category = obeseI;
    } else if (bmiValue < 40.0) {
      category = obeseII;
    } else if (bmiValue >= 40.0) {
      category = obeseIII;
    }
    return category;
  }

  String getHealRiskDescription(String Categoryname) {
    String desc = "";
    switch (Categoryname) {
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
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determinebmiCategory(bmi);
    final bmiDesc = getHealRiskDescription(bmiCategory);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung Bmi"),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Hasil Perhitungan",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCategory,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "${bmi.toStringAsFixed(1)}",
                      style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      bmiDesc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              MaterialPageRoute(builder: (context) {
                return bmiresultscreen(bmi: bmi);
              });
            },
            child: Container(
              width: 500,
              height: 70,
              color: const Color(0xff8a00c2),
              child: const Center(
                child: Text(
                  "Hitung Ulang",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
