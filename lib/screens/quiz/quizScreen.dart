import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controller/question_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz_app/screens/quiz/componets/body.dart';



class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    QuestionController  _contoller = Get.put(QuestionController()); 
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: () => _contoller.nextQuestion(),
            child: Text("Skip"),
          ),
        ],
      ),
      body:Body(),
    );
  }
}