import 'package:flutter/material.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/views/addquestion.dart';
import 'package:quizmaker/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription,quizId;

  DatabaseServices databaseServices = new DatabaseServices();

  bool isLoading = false;


  createQuiz() async {

    quizId = randomAlphaNumeric(16);
    if(_formKey.currentState.validate()){

      setState(() {
        isLoading = true;
      });

      Map<String, String> quizData = {
        "auizId" : quizId,
        "quizImgUrl" : quizImageUrl,
        "quizTitle" : quizTitle,
        "quizDesc" : quizDescription
      };

     await databaseServices.addQuizData(quizData, quizId).then((value){
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>  AddQuestion(quizId)
        ));
      });
    }
  }


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
              GestureDetector(
                  onTap: () {
                    createQuiz();
                  },
                  child: blueButton(
                     context: context,
                      label: 'Create Quiz'
                  )
              ),
              SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );Container();
  }
}
