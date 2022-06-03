import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Utils/components/rounded_button.dart';
import '../../Utils/components/rounded_input.dart';
import '../../Utils/components/rounded_password_input.dart';
import '../../Utils/constants.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Lets add some decorations
            // Login Form
            Container(
              color: kBackgroundColor,
              width: size.width,
              height: size.height * 1,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  Container(
                    child: Image.asset("assets/images/main_text.png"),
                  ),
                  SizedBox(height: size.height * 0.1),
                  RoundedInput(
                      controller: _userIDController,
                      icon: Icons.person,
                      hint: 'ID'),
                  RoundedPasswordInput(
                      controller: _passwordController, hint: 'Password'),
                  SizedBox(height: 10),
                  RoundedButton(
                    id_controller: _userIDController,
                    pw_controller: _passwordController,
                    title: 'LOGIN',
                    check_pw_controller: null,
                  ),
                  SizedBox(height: size.height * 0.07),
                  Text(
                    "다른 계정으로 로그인하기",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: size.width * 0.1,
                            height: size.height * 0.07,
                            child: Image.asset("assets/images/kakao.png")),
                        Container(
                            width: size.width * 0.13,
                            height: size.height * 0.08,
                            child: Image.asset("assets/images/naver.png")),
                        Container(
                            width: size.width * 0.1,
                            height: size.height * 0.07,
                            child: Image.asset("assets/images/facebook.png")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "회원가입 하러가기",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )

            // buildRegisterContainer(size)
          ],
        ),
      ),
    );
  }
}
