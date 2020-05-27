import 'package:bmi_calculator/screens/widgets/bottom_button.dart';
import 'package:bmi_calculator/screens/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String interpretationResult;
  final String bmi;

  ResultPage({@required this.result,@required this.interpretationResult,@required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                      child: Text(
                'Your result',
                style: kTitleTexstyle,
              ))),
              Expanded(
                  flex: 5,
                  child: CustomCard(
                    colour: kActiveCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          result,
                          style: kResulyTextStyle,
                        ),
                        Text(
                          bmi,
                          style: kBMItextStyle,
                        ),
                        Text(
                          interpretationResult,
                          style: kInterpretationResultTextStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )),
              BottomButton(label: 'RE-CALCULATE', onTap: (){
                Navigator.popAndPushNamed(context, '/input_page');
              },)
            ]),
      ),
    );
  }
}
