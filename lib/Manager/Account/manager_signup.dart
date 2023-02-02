import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Manager/Controller/http_manager.dart';
import 'package:shopping_tool/Model/requestDto/ManagerRequestDto.dart';
import 'package:shopping_tool/Utils/toast.dart';
import '../../Utils/components/rounded_button.dart';
import '../../Utils/components/rounded_input.dart';
import '../../Utils/components/rounded_password_input.dart';
import '../../Utils/constants.dart';


class Manager_Signup extends StatefulWidget {
  const Manager_Signup({Key? key}) : super(key: key);

  @override
  _Manager_Signup createState() => _Manager_Signup();
}

class _Manager_Signup extends State<Manager_Signup>
    with SingleTickerProviderStateMixin {

  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkpasswordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  late final int age;
  final TextEditingController _codeController = TextEditingController();




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
                RoundedInput(
                  icon: Icons.person_outline,
                    controller: _nicknameController, hint: '이름'),
               RoundedInput(
                      controller: _codeController,
                      icon: Icons.numbers,
                      hint: '가입번호'),

                SizedBox(
                  height: size.height * 0.02,
                ),
              InkWell(
                onTap: () async{
                  final prefs = await SharedPreferences.getInstance();
                    var manager_id = Http_Manager().register_manager(_userIDController.text,_passwordController.text,_nicknameController.text,_codeController.text);
                    if(manager_id == null){
                      showtoast("회원가입오류 다시 가입해주세요");
                    }else{
                      prefs.setString("userId", manager_id.toString());
                      showtoast("회원가입 성공");
                      return Navigator.pop(context);
                    }

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
