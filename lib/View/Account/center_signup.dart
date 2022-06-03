import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Utils/components/rounded_button.dart';
import '../../Utils/components/rounded_input.dart';
import '../../Utils/components/rounded_password_input.dart';
import '../../Utils/constants.dart';

class Center_Login extends StatefulWidget {
  const Center_Login({Key? key}) : super(key: key);

  @override
  _Center_Login createState() => _Center_Login();
}

class _Center_Login extends State<Center_Login>
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
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Lets add some decorations
            // Login Form
            Container(
              color: kBackgroundColor,
              width: size.width,
              height: size.height*1,

              child: Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  // Text("오 헬 몇?",style: TextStyle(fontFamily: "boldfont",fontSize: 50,fontWeight: FontWeight.bold),),
                  Container(
                    child: Image.asset("assets/images/main_text.png"),
                  ),
                  SizedBox(height: size.height * 0.1),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("센터 관리자만 로그인 할수있습니다",style: TextStyle(fontFamily: "boldfont",fontSize: 18),),
                   ),
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
