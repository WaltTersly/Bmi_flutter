import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_button.dart';
import 'bmi_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int heightNumber = 130;
  int weightkg = 50;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconContent(
                      icon: Icons.male,
                      gender: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconContent(
                      icon: Icons.female,
                      gender: "FEMALE",
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kIconLabelStyle,
                        ),
                        SizedBox(
                          height: 9.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              heightNumber.toString(),
                              style: kHeightNumberStyle,
                            ),
                            Text(
                              'cm',
                              style: kIconLabelStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Colors.white60,
                            activeTrackColor: Colors.redAccent.shade400,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                          ),
                          child: Slider(
                            value: heightNumber.toDouble(),
                            min: 125.0,
                            max: 240.0,
                            onChanged: (double newValue) {
                              setState(() {
                                heightNumber = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kIconLabelStyle,
                        ),
                        SizedBox(
                          height: 9.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weightkg.toString(),
                              style: kHeightNumberStyle,
                            ),
                            Text(
                              'kg',
                              style: kIconLabelStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weightkg--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 25.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weightkg++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kIconLabelStyle,
                        ),
                        SizedBox(
                          height: 9.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: kHeightNumberStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 25.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BmiBrain calc = BmiBrain(height: heightNumber, weight: weightkg);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBmi(),
                    resultText: calc.getResults(),
                    interpretation: calc.getDescription(),
                  ),
                ),
              );
            },
            buttonTitle: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
