import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Image Url" : null,

                decoration: InputDecoration(
                  hintText: "Quiz Image Url (Optional)",
                ),
                onChanged: (val) {
                  quizImageUrl = val;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,

                decoration: InputDecoration(
                  hintText: "Quiz Title",
                ),
                onChanged: (val) {
                  quizTitle = val;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Quiz Description" : null,

                decoration: InputDecoration(
                  hintText: "Quiz Description",
                ),
                onChanged: (val) {
                  quizDescription = val;
                },
              ),
              Spacer(),
              blueButton(context, 'Create Quiz'),
              SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );Container();
  }
}
