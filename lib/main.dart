import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: BmiCalculator());
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _State();
}

class _State extends State<BmiCalculator> {
  var hightControllerFeet = TextEditingController();
  var hightControllerInch = TextEditingController();
  var weightController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "bmi calculator".toUpperCase(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "Calculat your BMI",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: ListView(
                  padding: const EdgeInsets.all(30),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: Colors.green.withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                            )
                          ]),
                      child: TextField(
                        controller: hightControllerFeet,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Height in Feet',
                            icon: Icon(Icons.height)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: Colors.green.withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                            )
                          ]),
                      child: TextField(
                        controller: hightControllerInch,
                        decoration: const InputDecoration(
                            labelText: 'Hight in Inch',
                            icon: Icon(Icons.trending_up)),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: Colors.green.withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                            )
                          ]),
                      child: TextField(
                        controller: weightController,
                        decoration: const InputDecoration(
                            labelText: 'Weight in KG',
                            icon: Icon(Icons.line_weight)),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var hfeet = hightControllerFeet.text.toString();
                        var hinch = hightControllerInch.text.toString();
                        var weight = weightController.text.toString();

                        if (hfeet != "" && hinch != "" && weight != "") {
                          var ifeet = int.parse(hfeet);
                          var iinch = int.parse(hinch);
                          var iweight = int.parse(weight);

                          var thight = (ifeet * 12) + iinch;
                          var tcem = thight * 2.54;
                          var tm = tcem / 100;
                          var bmi = iweight / (tm * tm);
                          var msg = "";

                          if (bmi >= 18.50 && bmi <= 25.50) {
                            msg = "Your weight is Perfect.";
                          } else if (bmi > 25.50) {
                            msg = "You are over Weight.";
                          } else if (bmi < 18.50) {
                            msg = "You are Under Weight.";
                          }

                          setState(() {
                            result =
                                "$msg\n Your BMI is: ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill up all box.";
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: Colors.purpleAccent,
                      ),
                      child: Text("Calculate".toUpperCase()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          result,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
