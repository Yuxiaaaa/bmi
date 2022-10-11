import 'package:bmi/Constant/Constant.dart';
import 'package:bmi/Helpers/bmi_calculator.dart';
import 'package:bmi/Views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class bmidatascreen extends StatefulWidget {
  @override
  State<bmidatascreen> createState() => _bmidatascreenState();
}

class _bmidatascreenState  extends State<bmidatascreen>{
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  /*double CalculateBMI() {
    double heightInMeter = height / 100;

    //final h= pow(Height, 2);
    final h = (heightInMeter * heightInMeter);
    final Bmi = weight / h;

    return Bmi;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculate BMI"), //appbar,
        //backgroundColor: Colors.green,
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: (() {
                  gender = "male";
                  setState(() {});
                }),
                child: BmiCard(
                    Bordercolor:
                        (gender == "male") ? Colors.white : primarycolor,
                    child: const Gendericontext(
                      icon: Icons.male,
                      Title: 'Male',
                    )),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: (() {
                  gender = "female";
                  setState(() {});
                }),
                child: BmiCard(
                    Bordercolor:
                        (gender == "female") ? Colors.white : primarycolor,
                    child: const Gendericontext(
                      icon: Icons.female,
                      Title: 'female',
                    )),
              )),
            ],
          ),
        ),
        Expanded(
          child: BmiCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height",
                    style: labelTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$height",
                      style: numberStyle,
                    ),
                    const Text(
                      "Cm",
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 70,
                  max: 210,
                  thumbColor: Colors.black,
                  activeColor: Colors.white,
                  onChanged: (Value) {
                    height = Value.toInt();
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight",
                          style: labelTextStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(
                        "$weight",
                        style: numberStyle,
                      ),
                      const SizedBox(width: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              weight += 1;
                              setState(() {});
                            },
                            elevation: 0,
                            child: const Icon(Icons.add),
                            //focusColor: Colors.white,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff7600bc),
                            constraints: const BoxConstraints.tightFor(
                              width: 45,
                              height: 45,
                            ),
                          ),
                          const SizedBox(width: 5),
                          RawMaterialButton(
                              onPressed: () {
                                weight -= 1;
                                setState(() {});
                              },
                              elevation: 0,
                              child: const Icon(Icons.remove),
                              //splashColor: Colors.white,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff7600bc),
                              constraints: const BoxConstraints.tightFor(
                                width: 45,
                                height: 45,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Age",
                                style: labelTextStyle.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              "$age",
                              style: numberStyle,
                            ),
                            const SizedBox(width: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    age += 1;
                                    setState(() {});
                                  },
                                  elevation: 0,
                                  child: const Icon(Icons.add),
                                  //focusColor: Colors.white,
                                  shape: const CircleBorder(),
                                  fillColor: const Color(0xff7600bc),
                                  constraints: const BoxConstraints.tightFor(
                                    width: 45,
                                    height: 45,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                RawMaterialButton(
                                    onPressed: () {
                                      age -= 1;
                                      setState(() {});
                                    },
                                    elevation: 0,
                                    child: const Icon(Icons.remove),
                                    //splashColor: Colors.white,
                                    shape: const CircleBorder(),
                                    fillColor: const Color(0xff7600bc),
                                    constraints: const BoxConstraints.tightFor(
                                      width: 45,
                                      height: 45,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            final bmiCalculator = BmiCalculator(height: height, weight: weight);
            bmiCalculator.CalculateBMI();

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return bmiresultscreen(
                  bmi: bmiCalculator.bmi!,
                );
              }),
            );
          },
          child: Container(
            width: 500,
            height: 70,
            color: const Color(0xff8a00c2),
            child: const Center(
              child: Text(
                "Hitung BMI", //hitungbmi
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.Bordercolor = primarycolor,
  }) : super(key: key);

  final Widget? child;
  final Color? Bordercolor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff8a00c8),
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Bordercolor!),
        ),
        // ignore: prefer_const_constructors
        margin: EdgeInsets.all(15),
        child: child);
  }
}

class Gendericontext extends StatelessWidget {
  const Gendericontext({
    Key? key,
    required this.Title,
    required this.icon,
  }) : super(key: key);

  final String Title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          Title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}


/*Gendericontext(
                        icon: Icons.male,
                        Title: 'Male',
                      ),*/