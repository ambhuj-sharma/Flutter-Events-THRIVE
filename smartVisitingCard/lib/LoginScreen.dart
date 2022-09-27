import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smartvisitingcard/ScanScreen.dart';
import 'package:smartvisitingcard/RegistrationScreen.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);



  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  static const Color primaryColor = Color(0xFF13B5A2);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Create storage
  final _storage = const FlutterSecureStorage();

  final TextEditingController _usernameController =
  TextEditingController(text: "");
  final TextEditingController _passwordController =
  TextEditingController(text: "");

  bool passwordHidden = true;
  bool _savePassword = true;

  // Read values
  Future<void> _readFromStorage() async {
    _usernameController.text = await _storage.read(key: "KEY_USERNAME") ?? '';
    _passwordController.text = await _storage.read(key: "KEY_PASSWORD") ?? '';
  }

  _onFormSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_savePassword) {
        // Write values
        await _storage.write(key: "KEY_USERNAME", value: _usernameController.text);
        await _storage.write(key: "KEY_PASSWORD", value: _passwordController.text);
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ScanCode()),
      );
     }

  }

  _onForgotPassword() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const ScanCode()),
    // );
  }
  _onSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationForm()),
    );
  }


  @override
  void initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
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
          padding: EdgeInsets.all(size.width - size.width * .95),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
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
                      controller: _usernameController,
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
                      controller: _passwordController,
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
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              CheckboxListTile(
                side: const BorderSide(color: Colors.white),
                value: _savePassword,
                onChanged: (bool? newValue) {
                  setState(() {
                    _savePassword = newValue!;
                  });
                },
                title: const Text("Remember me",
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              SizedBox(
                width: 350.0,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: _onFormSubmit,
                  child: const Text("LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                ),
                ),
              ),
              SizedBox(
                height: size.height * .015,
              ),
              Center(
                child: InkWell(
                  onTap: _onForgotPassword,
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.white, fontSize: 14,),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const Center(
                child: Text(
                  "You don't have an account?",
                  style: TextStyle(color: Colors.white,fontSize: 14, ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Center(
                child: InkWell(
                  onTap: _onSignUp,
                  child: const Text(
                    "Click here to SinUp",
                    style: TextStyle( color: primaryColor,fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}