

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/toast.dart';


class Providers with ChangeNotifier{
  String? admin_check_disk;

  String? _admin_authority = "off";
  String? get admin_authority => _admin_authority;

  //관리자 모드 on/off
  void change_admin_authority()async{
    final prefs = await SharedPreferences.getInstance();
    admin_check_disk = prefs.getString("admin_authority");

    if (admin_check_disk != null) {
      prefs.remove("admin_authority");
      showtoast("관리자 모드가 꺼졌습니다.");
      _admin_authority = "off";
    }
    if (admin_check_disk == null) {
      prefs.setString("admin_authority", "true");
      showtoast("관리자 모드가 켜졌습니다.");
      _admin_authority = "on";
    }
    notifyListeners();

}}

