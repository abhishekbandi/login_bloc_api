import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yourdoctors/common/app_colors.dart';
import 'package:flutter_yourdoctors/common/app_strings.dart';
import 'package:flutter_yourdoctors/login_bloc/login_bloc.dart';
import 'package:flutter_yourdoctors/ui/login/home_screen.dart';

///  Login method using FutureBuilder tried on Wednesday After Noon

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  bool _passwordvisible;
 // Services _apiServices = Services();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    setState(() {});
  }

  @override
  void initState() {
    _passwordvisible = false;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  //
  // void _showSnackBar() {
  //   final snackBar = SnackBar(
  //     duration: const Duration(seconds: 2),
  //     content: Container(
  //       height: 80.0,
  //       child: Center(
  //         child: Text(
  //           "INVALID CREDENTIALS",
  //           style: const TextStyle(fontSize: 25.0),
  //         ),
  //       ),
  //     ),
  //     backgroundColor: Colors.redAccent,
  //   );
  //   Scaffold.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, FormScreenState>(
      listener: (context, state) {
        if (state.isTrue == true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Welcom()));
        } else {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Row(
                children: [
                  Text(
                    "Enter your email id and pasword",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("ok"),
                  color: Colors.blue,
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: BlocBuilder<LoginBloc, FormScreenState>(
              builder: (context, state) {
            return ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Container for your doctor text with image
                    Container(
                      child: Row(
                        // which add Row properties at the center
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.your,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: CustomizedColors.your_text_color),
                          ),
                          Text(
                            AppStrings.doctors,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: CustomizedColors.doctor_text_color),
                          ),
                          // Image.asset(
                          //   AppIcons.doctor_img,
                          //   // I added asset image
                          //   height: 60,
                          // ),
                        ],
                      ),
                      margin: const EdgeInsets.only(bottom: 80),
                    ),

                    /// Container for welcome screen
                    Container(
                      child: Text(
                        AppStrings.welcome_text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      margin: EdgeInsets.only(bottom: 20),
                    ),

                    /// Container for your_doctors text
                    Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.2,
                          maxWidth: MediaQuery.of(context).size.width * 0.9,
                        ),
                        child: Text(
                          AppStrings.your_doctor_text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: CustomizedColors.your_doctors_text_color),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 25),
                    ),

                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(snapshot.data.userName),
                          /// code for the email validation
                          Container(
                            decoration: BoxDecoration(
                              color: CustomizedColors.text_field_background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 20, top: 15),
                                border: InputBorder.none,
                                hintText: AppStrings.email_text_field_hint,
                              ),
                            ),
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, top: 60),
                          ),

                          /// if statement to check the text field
                          /// is empty or not and display error message

                          SizedBox(height: 40),

                          /// code for the password validation
                          Container(
                            decoration: BoxDecoration(
                              color: CustomizedColors.text_field_background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: passwordController,
                              obscureText: !_passwordvisible,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 20, top: 15),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordvisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordvisible = !_passwordvisible;
                                    });
                                  },
                                ),
                                hintText: AppStrings.password_text_field_hint,
                              ),
                            ),
                            margin: const EdgeInsets.only(left: 30, right: 30),
                          ),

                          SizedBox(height: 30),

                          /// Implementation for the sign in  Flat button
                          Container(
                            decoration: BoxDecoration(
                              color: CustomizedColors.text_field_background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  // ignore: non_constant_identifier_names
                                  if (emailController.text == '' &&
                                      passwordController.text == '') {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Row(
                                          children: [
                                            Text(
                                              "Enter your email id and pasword",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Text("ok"),
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    print(
                                        "This is Email ${emailController.text}");
                                    var verify;
                                    BlocProvider.of<LoginBloc>(context).add(
                                        FormScreenEvent(emailController.text,
                                            passwordController.text, verify));
                                  }
                                },
                                color: CustomizedColors.signInButtonColor,
                                child: Text(
                                  AppStrings.sign_in,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color:
                                          CustomizedColors.sign_in_text_color),
                                )),
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, top: 40),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
