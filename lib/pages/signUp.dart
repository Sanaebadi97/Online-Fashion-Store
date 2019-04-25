import 'package:Sana_Shop/db/users.dart';
import 'package:Sana_Shop/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  /*Create the google sign in var && firebase auth && shared pref*/
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  UserServices _userServices = UserServices();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  String gender;
  String groupValue = "male";

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;
  bool hidePass = true;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  /*Sign in method*/
  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();

    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  /*Handel Sign in */
  Future handelSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser firebaseUser =
        await firebaseAuth.signInWithCredential(credential);

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();

      final List<DocumentSnapshot> documents = result.documents;

      if (documents.length == 0) {
        //Insert the user to our collection
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoUrl
        });

        //Store in shared pref
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.photoUrl);
      } else {
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("username", documents[0]["username"]);
        await preferences.setString("photoUrl", documents[0]["photoUrl"]);
      }

      Fluttertoast.showToast(msg: 'Login was successful');
      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } else {
      Fluttertoast.showToast(msg: "Login failed :(");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/login_bg.jpeg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
//TODO:: make the logo show

          Container(
            color: Colors.white.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),

//          Padding(
//            padding: const EdgeInsets.fromLTRB(8,50,8,10),
//            child: Container(
//                alignment: Alignment.topCenter,
//                child: Image.asset(
//                  'assets/images/logo.png',
//                  width: 100,
//                  height: 100,
//                )),
//          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                cursorColor: Colors.pinkAccent,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                ),
                                controller: _nameTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Full Name",
                                  icon: Icon(Icons.person),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                cursorColor: Colors.pinkAccent,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                ),
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  icon: Icon(Icons.email),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePass,
                                  cursorColor: Colors.pinkAccent,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    icon: Icon(Icons.vpn_key),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2, 2, 2, 2),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: ListTile(
                                title: TextFormField(
                                  cursorColor: Colors.pinkAccent,
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                  ),
                                  controller: _confirmPasswordController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Confirm Password",
                                    icon: Icon(Icons.vpn_key),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    } else if (_passwordTextController.text !=
                                        value) {
                                      return "the password do not match";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2, 2, 2, 2),
                                  child: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'male',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.black,
                                        fontSize: 17.0),
                                  ),
                                  trailing: Radio(
                                      activeColor: Colors.pinkAccent,
                                      value: 'male',
                                      groupValue: groupValue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'female',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.black,
                                        fontSize: 17.0),
                                  ),
                                  trailing: Radio(
                                    activeColor: Colors.pinkAccent,
                                    value: 'female',
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(70, 8, 70, 8),
                          child: Material(
                              borderRadius: BorderRadius.circular(40.0),
                              color: Colors.pinkAccent,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {
                                  /*The Sign Up method Call*/
                                  validateForm();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Register",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      color: Colors.white,
                                      fontSize: 17.0),
                                ),
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0),
                                    children: [
                                  TextSpan(
                                      text:
                                          "already have an accout ? click here to",
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                      )),
                                  TextSpan(
                                      text: " login!",
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () => Navigator.pop(context),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.pink,
                                        fontFamily: 'Raleway',
                                      ))
                                ]))
//                            Text("Dont't have an accout? click here to sign up!",textAlign: TextAlign.end, style: TextStyle(color: Colors.white,  fontWeight: FontWeight.w400, fontSize: 16.0),),
                            ),
                        Divider(
                          color: Colors.white,
                        ),
                        Text(
                          "Other login/sign up in option",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.black,
                              fontSize: 17.0),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                              child: new Material(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: Colors.pinkAccent,
                                  elevation: 0.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      handelSignIn();
                                    },
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(
                                            'assets/images/google.png',
                                            width: 18,
                                            height: 18,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              6, 5, 5, 5),
                                          child: Text(
                                            "Sign in with google",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Raleway',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),

          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //Radio Value Changed
  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  //THE SIGN UP METHOD
  Future validateForm() async {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((user) => {
                  _userServices.createUser(user.uid.toString(), {
                    "username": user.displayName,
                    "email": user.email,
                    "userId": user.uid,
                    "gender": gender,
                  })
                })
            .catchError((err) => {print(err.toString())});

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      }
    }
  }
}
