import 'package:flutter/material.dart';
import 'package:quizmaker/services/auth.dart';
import 'package:quizmaker/views/home.dart';
import 'package:quizmaker/views/signin.dart';
import 'package:quizmaker/widgets/widgets.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  final _formKey = GlobalKey<FormState>();
  String name,email, password;
  bool isLoading = false;
  final AuthService _authService = AuthService();

  singUp() async {

    if(_formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });

      await _authService.signUpWithEmailAndPassword(email,
          password).then((result){
        if(result != null){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Home()
          ));
        }
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
      ),
      body: isLoading
          ? Container(
        child: Center(child: CircularProgressIndicator()),
      )
          : Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter name" : null;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (val) {
                  name = val;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Emailid" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                validator: (val) {
                  return val.isEmpty ? "Enter Password" : null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(height: 24,),
              GestureDetector(
                onTap: () {
                  singUp();
                },
                child: blueButton(context, "Sign Up"),
              ),
              SizedBox(height: 24,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",style: TextStyle(fontSize: 15.5),),
                  GestureDetector(
                      onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SingIn()) );
                  },
                      child: Text("Sign In ",style: TextStyle(fontSize: 15.5,decoration: TextDecoration.underline),)),
                ],
              ),

              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}