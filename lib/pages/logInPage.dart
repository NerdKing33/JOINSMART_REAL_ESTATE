import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/themes/theme.dart';

import '../resources/auth.dart';
import '../resources/utils.dart';


class logInPage extends StatefulWidget {
  const logInPage({super.key});

  @override
  _logInPageState createState() => _logInPageState();
}

class _logInPageState extends State<logInPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    if (res == 'Success') {
      setState(() {
        showSnackBar('Login Success', context);
      });
      setState(() {
        isLoading = false;
      });
      Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacementNamed('/navigationPage');
    } else {
      setState(() {
        isLoading = false;
      });
      setState(() {
        showSnackBar(res, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.white,
          toolbarHeight:90 ,
          title: SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width +60,
            child: ListView(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            border: Border.all(
                              color: lRed,
                              width: .5,
                            )
                        ),
                        child: IconButton(
                            hoverColor: Colors.white10,
                            highlightColor: pRed,
                            onPressed: (){
                              setState(() {
                                Navigator.pushReplacementNamed(context, '/navigationPage');
                              });
                            },
                            icon: Row(
                              children: [
                                ///theLogo
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: lRed,
                                        width: 1.0
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(jeLogo),
                                    radius: 18,
                                  ),
                                ),
                                sb5,
                                ///theTitle
                                Text(
                                  titleCptl,
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color:  lRed,
                                      letterSpacing: 1.5,
                                      wordSpacing: 2.0
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: lRed,
                            border: Border.all(
                              color: lRed,
                              width: .5,
                            )
                        ),
                        child: IconButton(
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, '/signUpPage');
                            },
                            icon:Text(
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            )
                        ),
                      ),
                    ]
                )
              ],
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  height: 450,
                  width:400,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                              text:  TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Welcome Back\n',
                                      style: GoogleFonts.poppins(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400,
                                          color: lRed
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Please Enter Your Details',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey[800]
                                      ),
                                    )
                                  ]
                              )
                          ),
                          sbH20,
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: lRed,
                                  width: .5,
                                )
                            ),
                            child: TextFormField(
                              controller: emailController,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              decoration:  InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: GoogleFonts.poppins(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                      wordSpacing: 1.5,
                                      fontWeight: FontWeight.w400
                                  ),
                                  border: InputBorder.none
                              ),
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          sbH15,
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: lRed,
                                  width: .5,
                                )
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              style: GoogleFonts.poppins(
                                color: Colors.black
                              ),
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: GoogleFonts.poppins(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                      wordSpacing: 1.5,
                                      fontWeight: FontWeight.w400
                                  ),
                                  border: InputBorder.none
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 8) {
                                  return 'Please enter a password with at least 8 characters';
                                }
                                return null;
                              },
                            ),
                          ),
                          sbH20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: lRed,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      loginUser();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: lRed,
                                    elevation: 0,
                                  ),
                                  child: isLoading?const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 4.0,
                                    )
                                  ) :Text(
                                    'Log In',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                              ),
                              ////theLoginWithGoogleOption
                              // sbH5,
                              // Text(
                              //   'or',
                              //   style: GoogleFonts.poppins(
                              //     color: lRed,
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 14,
                              //   ),
                              // ),
                              // sbH5,
                              // Container(
                              //   width: MediaQuery.of(context).size.width,
                              //   padding: const EdgeInsets.all(8.0),
                              //   decoration: BoxDecoration(
                              //       color: Colors.transparent,
                              //       borderRadius: BorderRadius.circular(6.0),
                              //       border: Border.all(
                              //           color: lRed,
                              //           width: .5
                              //       )
                              //   ),
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       if (_formKey.currentState!.validate()) {
                              //         // If the form is valid, then invoke the API or whatever you want
                              //       }
                              //     },
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: Colors.transparent,
                              //       elevation: 0,
                              //     ),
                              //     child: Text(
                              //       'Log In with Google',
                              //       style: GoogleFonts.poppins(
                              //           color: lRed,
                              //           fontSize: 20,
                              //           fontWeight: FontWeight.w400
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          sbH20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Don\'t have an account?',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black
                                ),
                              ),
                              sbH10,
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, '/signUpPage');
                                },
                                child: Text(
                                  ' Sign Up!',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: lRed
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              sb30,
              Container(
                width:MediaQuery.of(context).size.width < 1300 ? 400 : 500,
                height: MediaQuery.of(context).size.width < 1300 ?  400 : 500,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(jeLogo)),
                ),
              )
            ],
          ),
        )
    );
  }
}