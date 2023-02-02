import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Client/Controller/provider/providers.dart';
import 'package:shopping_tool/Client/View/frame/frame_page.dart';
import 'package:shopping_tool/Manager/Account/manager_signup.dart';
import 'package:shopping_tool/Manager/Controller/http_manager.dart';
import 'package:shopping_tool/Utils/toast.dart';
import '../../Utils/components/rounded_button.dart';
import '../../Utils/components/rounded_input.dart';
import '../../Utils/components/rounded_password_input.dart';
import '../../Utils/constants.dart';

class Manager_Login extends StatefulWidget {
  const Manager_Login({Key? key}) : super(key: key);

  @override
  _Manager_Login createState() => _Manager_Login();
}

class _Manager_Login extends State<Manager_Login>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                  InkWell(
                    onTap: ()async{
                      final prefs = await SharedPreferences.getInstance();
                      var token = await Http_Manager().login_manager(_userIDController.text, _passwordController.text);
                      if(token == null){
                        return showtoast("로그인 실패");
                      }else{

                        if(prefs.getString("token") == null){
                          prefs.setString("token", token.toString());
                        }else{
                          prefs.remove("token");
                          prefs.setString("token", token.toString());
                        }
                        Providers().change_admin_authority();
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: FramePage()));
                      }

                    },
                    child: RoundedButton(
                      id_controller: _userIDController,
                      pw_controller: _passwordController,
                      title: 'LOGIN',
                      check_pw_controller: null,
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {

                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: Manager_Signup()));
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
