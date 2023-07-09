import 'package:flutter/material.dart';
import 'package:taree/theme/pallete.dart';

import '../home/screens/home_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.objColor,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.blueGrey)),
                  child: Image.asset(
                    'assets/images/logo.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                  // validator: MultiValidator([
                                  // 	RequiredValidator(
                                  // 		errorText: 'Enter email address'),
                                  // 	EmailValidator(
                                  // 		errorText:
                                  // 			'Please correct email filled'),
                                  // ]),
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      labelText: 'Email',
                                      prefixIcon: Icon(
                                        Icons.email,
                                        //color: Colors.green,
                                      ),
                                      errorStyle: TextStyle(fontSize: 18.0),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(9.0)))))),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              // validator: MultiValidator([
                              // 	RequiredValidator(
                              // 		errorText: 'Please enter Password'),
                              // 	MinLengthValidator(8,
                              // 		errorText:
                              // 			'Password must be atlist 8 digit'),
                              // 	PatternValidator(r'(?=.*?[#!@$%^&*-])',
                              // 		errorText:
                              // 			'Password must be atlist one special character')
                              // ]),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Colors.green,
                                ),
                                errorStyle: TextStyle(fontSize: 18.0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9.0))),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
                          //   child: Text('Forget Password!'),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    print('form submiitted');
                                    // ref.read(healthControllerProvider.notifier).updateHealthRepository(context);
                                    Navigator.pushNamed(
                                      context,
                                      HomeScreen.routeName,
                                    );
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                          // Center(
                          //   child: Padding(
                          //     padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          //     child: Center(
                          //       child: Text(
                          //         'Or Sign In Using!',
                          //         style: TextStyle(
                          //             fontSize: 18, color: Colors.black),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          //     ),
                          //   ],
                          // ),
                          // Center(
                          //   child: Container(
                          //     padding: EdgeInsets.only(top: 50),
                          //     child: Text(
                          //       'SIGN UP!',
                          //       style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.w700,
                          //         color: Colors.lightBlue,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
