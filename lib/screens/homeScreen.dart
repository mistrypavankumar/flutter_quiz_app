import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/quiz/quizScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz_app/constants/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
              child: Column(
                children: [
                  Spacer(
                    flex: 2, // 2/6
                  ),
                  Text(
                    "Let's Play Quiz",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),

                  Text("Enter your details below"),
                  Spacer(), // 1/6
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      )),
                    ),
                  ),
                  Spacer(), // 1/6

                  InkWell(
                    onTap: () {
                      Get.to(QuizScreen());
                      print("You clicked me");
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.all(mgDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: mgPrimaryGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Let's Start Quiz",
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2) // 2/6
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
