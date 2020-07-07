import 'package:eye_form/app/modules/home/home_module.dart';
import 'package:eye_form/app/modules/login/login_module.dart';
import 'package:eye_form/app/services/firebase_auth_service.dart';
import 'package:eye_form/app/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;
  bool isLoading = false;
  final FirebaseAuthService _firebaseAuth = FirebaseAuthService();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  register() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Inputs can't be empty",
          toastLength: Toast.LENGTH_LONG,
          webBgColor: "#e74c3c",
          gravity: ToastGravity.TOP);
      return;
    }

    bool validEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (!validEmail) {
      Fluttertoast.showToast(
          msg: "Email not valid",
          toastLength: Toast.LENGTH_LONG,
          webBgColor: "#e74c3c",
          gravity: ToastGravity.TOP);
      return;
    }
    setState(() {
      isLoading = true;
    });

    print(emailController.text);
    print(passwordController.text);
    try {
      await _firebaseAuth.registerWithEmailAndPassword(
        email: emailController.text,
        password: emailController.text,
      );
      _firebaseAuth.storeAccount();
      Navigator.pushNamed(context, HomeModule.routeName);
    } catch (err) {
      print(err);
      Fluttertoast.showToast(
          msg: 'Something Went wrong',
          toastLength: Toast.LENGTH_LONG,
          webBgColor: "#e74c3c",
          gravity: ToastGravity.TOP);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: RaisedButton(
        onPressed: () {
          register();
        },
        // padding: EdgeInsets.all(12),
        color: ColorConstants.blue,
        child: (isLoading)
            ? CircularProgressIndicator(backgroundColor: Colors.white)
            : Text('Register',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final registerLabel = FlatButton(
      child: Text(
        'Already member? Sign In?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () => {Navigator.pushNamed(context, LoginModule.routeName)},
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: ColorConstants.blue,
              ),
            ],
          ),
          Center(
            child: Card(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.all(42),
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 0.5,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    Center(
                        child: Text(
                      "Softagon Admin",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    SizedBox(height: 48.0),
                    email,
                    SizedBox(height: 8.0),
                    password,
                    SizedBox(height: 24.0),
                    Visibility(
                      visible: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                },
                              ),
                              Text("Remember Me")
                            ],
                          ),
                          forgotLabel,
                        ],
                      ),
                    ),
                    SizedBox(height: 18.0),
                    loginButton,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        registerLabel,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
