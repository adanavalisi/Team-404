import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_buddy/Screens/Homepage/home_page.dart';
import 'package:food_buddy/Screens/Homepage/home_page.dart';
import 'package:food_buddy/Screens/Signup/components/or_divider.dart';
import 'package:food_buddy/Screens/Signup/signup_screen.dart';
import 'package:food_buddy/Service/auth.dart';
import 'package:food_buddy/components/already_have_an_account_acheck.dart';
import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.35,
                color: kPrimaryColor,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width * 0.4,
                color: kPrimaryLightColor,
              ),
            ),
            SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Text(
                    "GİRİŞ YAP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      controller: _emailController,
                      onChanged: (value) {},
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_rounded,
                          color: Colors.white,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      onChanged: (value) {},
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: "Şifre",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          child: Text(
                            'GİRİŞ YAP',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _authService
                                .signIn(_emailController.text,
                                    _passwordController.text)
                                .then((value) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        )),
                  ),
                  OrDivider(),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}