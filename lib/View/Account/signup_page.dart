import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Utils/toast.dart';
import 'package:shopping_tool/View/Account/login_page.dart';
import 'package:shopping_tool/View/Account/signup_detail_page.dart';

import '../../Utils/components/rounded_button.dart';
import '../../Utils/components/rounded_input.dart';
import '../../Utils/components/rounded_password_input.dart';
import '../../Utils/constants.dart';


class Signup_page extends StatefulWidget {
  const Signup_page({Key? key}) : super(key: key);

  @override
  _Signup_page createState() => _Signup_page();
}

class _Signup_page extends State<Signup_page>
    with SingleTickerProviderStateMixin {

  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkpasswordController =
  TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double defaultLoginSize = size.height - (size.height * 0.2);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
      Scaffold(
      body: Align(
      alignment: Alignment.topCenter,
        child: Container(
          color: kBackgroundColor,
          width: size.width,
          height: size.height*1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.1),
                Text(
                  '회원가입',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),

                SizedBox(height: size.height*0.05),
                RoundedInput(
                    controller: _userIDController,
                    icon: Icons.mail,
                    hint: 'ID'),
                RoundedPasswordInput(
                    controller: _passwordController, hint: 'Password'),
                RoundedPasswordInput(
                    controller: _checkpasswordController, hint: 'check pw'),
                InkWell(
                  onTap: (){
                    showtoast("가입번호는 고객센터에 문의해주세요!");
                  },
                  child: RoundedInput(
                      controller: _userIDController,
                      icon: Icons.numbers,
                      hint: '가입번호'),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              InkWell(
                onTap: () {
                  // if(_passwordController != _checkpasswordController){
                  //   showtoast("비밀번호가 일치하지 않습니다");
                  // }
                  Navigator.push(context,
                      PageTransition(type: PageTransitionType.fade, child: Signup_Detail_page()));

                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryColor,
                  ),

                  padding: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: Text(
                    "가입 하기",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                ),
              ),


                SizedBox(height: 30),
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/center_login');
                    },
                    child: Text(
                      "로그인 페이지로 이동",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    )

        ],
      ),
    );
  }


}
