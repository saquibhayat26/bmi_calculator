import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/bottom_button.dart';
import 'components/rounded_buttons.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // ignore: prefer_typing_uninitialized_variables
  var selectedGender;
  int _height = 180;
  int _weight = 60;
  int _age = 18;

  void handleIncreaseWeight() {
    setState(() {
      _weight++;
    });
  }

  void handleDeacreaseWeight() {
    setState(() {
      _weight--;
    });
  }

  void handleIncreaseAge() {
    setState(() {
      _age++;
    });
  }

  void handleDeacreaseAge() {
    setState(() {
      _age--;
    });
  }

  void handleNavigate() {
    CalculatorBrain calc = CalculatorBrain(height: _height, weight: _weight);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          bmiResult: calc.calculateBMI(),
          interpretation: calc.getInterPretation(),
          resultText: calc.getResult(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: ReusableCard(
                    /* PROPERTY 1 OF REUSABLE CARD CLASS */
                    handlePress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    /* PROPERTY 2 REUSABLE CARD CLASS*/
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    /* PROPERTY 3 REUSABLE CARD CLASS*/
                    cardChild: const ReusbaleIconsWidget(
                      icon: FontAwesomeIcons.mars,
                      label: "male",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    /* PROPERTY 1 OF REUSABLE CARD CLASS */
                    handlePress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    /* PROPERTY 1 OF REUSABLE CARD CLASS */
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    /* PROPERTY 1 OF REUSABLE CARD CLASS */
                    cardChild: const ReusbaleIconsWidget(
                      icon: FontAwesomeIcons.venus,
                      label: "female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ReusableCard(
                handlePress: () {},
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 10.0,
                        trackShape: const RoundedRectSliderTrackShape(),
                        activeTrackColor: Colors.purple.shade800,
                        inactiveTrackColor: Colors.purple.shade100,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 14.0,
                          pressedElevation: 8.0,
                        ),
                        thumbColor: Colors.pinkAccent,
                        overlayColor: Colors.pink.withOpacity(0.2),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 32.0),
                        tickMarkShape: const RoundSliderTickMarkShape(),
                        activeTickMarkColor: Colors.pinkAccent,
                        inactiveTickMarkColor: Colors.white,
                        valueIndicatorShape:
                            const PaddleSliderValueIndicatorShape(),
                        valueIndicatorColor: Colors.black,
                        valueIndicatorTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      child: Slider(
                        value: _height.toDouble(),
                        min: kMinHeight.toDouble(),
                        max: kMaxHeight.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.round();
                          });
                        },
                        thumbColor: kBottomContainerColor,
                        activeColor: Colors.white,
                        inactiveColor: const Color(0xff8d8e98),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: ReusableCard(
                    handlePress: () {},
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedButton(
                                icon: FontAwesomeIcons.minus,
                                handlePress: handleDeacreaseWeight),
                            RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                handlePress: handleIncreaseWeight),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    handlePress: () {},
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              handlePress: handleDeacreaseAge,
                            ),
                            RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                handlePress: handleIncreaseAge),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: BottomButton(
              navigate: handleNavigate,
              buttonTitle: "CALCULATE",
            ),
          ),
        ],
      ),
    );
  }
}
