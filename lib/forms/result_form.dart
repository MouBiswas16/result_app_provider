// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result_app_provider/provider/result_provider.dart';

class ResultForm extends StatelessWidget {
  ResultForm({super.key});

  TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ChangeNotifierProvider<ResultProvider>(
        create: (BuildContext context) => ResultProvider(),
        child: Scaffold(
          body: Center(
            child: Consumer<ResultProvider>(
              // builder: (BuildContext context, ResultProvider value, Widget? child) {  },
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.isPassed ? "Welcome !" : "",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: resultController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    ElevatedButton(
                      onPressed: () {
                        var data = int.parse(resultController.text);
                        provider.examResult(data);
                      },
                      child: Text("Show Result"),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text(provider.result),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
