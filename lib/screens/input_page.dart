import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/screens/widgets/bottom_button.dart';
import 'package:bmi_calculator/screens/widgets/custom_card.dart';
import 'package:bmi_calculator/screens/widgets/custom_card_gender.dart';
import 'package:bmi_calculator/screens/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int age = 20;
  int weight = 85;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: CustomCard(
                  onPress: () {
                    setState(() => selectedGender = Gender.male);
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  containerChild: CustomCardGender(
                    label: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  onPress: () {
                    setState(() => selectedGender = Gender.female);
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  containerChild: CustomCardGender(
                    label: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: CustomCard(
                colour: kActiveCardColor,
                containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT', style: kLabelTextStyle),
                      RichText(
                        text: TextSpan(
                          text: height.toString(),
                          style: kNumberTextStyle,
                          children: <TextSpan>[
                            TextSpan(
                              text: ' cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                      ),
                      SliderTheme(
                        child: Slider(
                          min: 120,
                          max: 250,
                          value: height.toDouble(),
                          onChanged: (double newValue) =>
                              setState(() => height = newValue.round()),
                        ),
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: kInactiveColorSlider,
                          thumbColor: kThumbColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayColor: kThumbColor.withAlpha(32),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                      ),
                    ])),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: CustomCard(
                  colour: kActiveCardColor,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(height: 5),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icone: Icons.remove,
                              onPressed: () => setState(() => weight--)),
                          SizedBox(width: 15),
                          RoundIconButton(
                              icone: Icons.add,
                              onPressed: () => setState(() => weight++)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  colour: kActiveCardColor,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(height: 5),
                      Text(
                        age.toString(),
                        style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icone: Icons.remove,
                            onPressed: () => setState(() => age--),
                          ),
                          SizedBox(width: 15),
                          RoundIconButton(
                            icone: Icons.add,
                            onPressed: () => setState(() => age++),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          BottomButton(
            label: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              String bmi = calc.calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: calc.getResult(bmi),
                    interpretationResult: calc.getInterpretation(bmi),
                    bmi: calc.calculateBMI(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
