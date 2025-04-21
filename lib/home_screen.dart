import 'package:flutter/material.dart';

class HomeScreenn extends StatefulWidget {
  const HomeScreenn({super.key});
  @override
  State<HomeScreenn> createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
  TextEditingController tec = TextEditingController();
  double hold = 0;
  String convertto = "USD";
  double rate = 85.38;
  double convert(double input) {
    if (convertto == "USD") {
      return input * rate; // Convert USD to INR
    } else {
      return input / rate; // Convert INR to USD
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
            width: 2,
            color: Colors.black,
            strokeAlign: BorderSide.strokeAlignCenter));
    return Scaffold(
        appBar: AppBar(
          title: Text("Currency Converter"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          elevation: 0,
        ),
        backgroundColor: Colors.lightBlue,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${convertto == 'USD' ? 'INR' : 'USD'} ${hold.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: tec,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Please enter the amount in $convertto",
                            prefixIcon: const Icon(Icons.attach_money),
                            prefixIconColor: Colors.black,
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: border,
                            enabledBorder: border),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              convertto = convertto == "USD" ? "INR" : "USD";
                              double input = double.tryParse(tec.text) ?? 0;
                              hold = convert(input);
                            });
                          },
                          child: Text(
                              "Switch to ${convertto == "USD" ? "INR" : "USD"}")),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            double input = double.tryParse(tec.text) ?? 0;
                            hold = convert(input);
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black),
                            maximumSize: WidgetStatePropertyAll(
                                Size(double.infinity, double.infinity)),
                            minimumSize: WidgetStatePropertyAll(
                                Size(double.infinity, 50)),
                            shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            enableFeedback: true),
                        child: Text("Convert"),
                      ),
                    ],
                  ),
                ),
                Text("Made By Subhan")
              ],
            ),
          ),
        ));
  }
}
