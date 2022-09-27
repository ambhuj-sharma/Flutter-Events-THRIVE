import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smartvisitingcard/ScanScreen.dart';
import 'package:smartvisitingcard/LoginScreen.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  // final String title;

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  static const Color primaryColor = Color(0xFF13B5A2);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  bool passwordHidden = true;
  // bool _savePassword = true;
 

  _onFormSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyLogin()),
      );
    }

  }

  _onForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScanCode()),
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      body: Center(
        child:SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(size.width - size.width * .90),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/logo.png',
                      fit:BoxFit.contain
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: InkWell(
                          onTap: _onForgotPassword,
                          child: const Text(
                            "THRIVE",
                            style: TextStyle(color: Colors.blueAccent, fontSize: 30,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_box,
                              color: Colors.white,
                            ),
                            enabledBorder:const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 2)
                            ),
                            hintText: 'Enter Your Name',
                            hintStyle: TextStyle(color: Colors.white)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          return value!.isEmpty ? "Required field" : null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          enabledBorder:const OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 2)
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordHidden = !passwordHidden;
                              });
                            },
                            child: Icon(
                              passwordHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xff747881),
                              size: 23,
                            ),
                          ),
                        ),
                        obscureText: passwordHidden,
                        enableSuggestions: false,
                        toolbarOptions: const ToolbarOptions(
                          copy: false,
                          paste: false,
                          cut: false,
                          selectAll: false,
                          //by default all are disabled 'false'
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.link_outlined,
                              color: Colors.white,
                            ),
                            enabledBorder:const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 2)
                            ),
                            hintText: 'Enter LinkedIn ID',
                            hintStyle: TextStyle(color: Colors.white)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            enabledBorder:const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 2)
                            ),
                            hintText: 'Enter Email ID',
                            hintStyle: TextStyle(color: Colors.white)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                SizedBox(
                  width: 350.0,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: _onFormSubmit,
                    child: const Text("SIGN UP",
                      style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .015,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}