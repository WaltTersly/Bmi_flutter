import 'package:bmi_calculator_flutter/bottom_button.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';
import 'bmi_brain.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "YOUR RESULTS",
                  style: kLargeButtonStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: kActiveReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kTextResultsStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kTextBmiStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kTextResultsBodyStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: "RE-CALCULATE",
          ),
        ],
      ),
    );
  }
}
