import 'package:college/API/apiconfig.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiPosts {
  Future login(context, email, password, Function showSnackBar) async {
    var data = {'email': email, 'password': password};

    try {
      final response = await Api().dio.post(
            'users/login',
            data: data,
          );

      if (response.statusCode == 200) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        await localStorage.setString('token', response.data['access_token']);
        await localStorage.setString('role', response.data['role']);
        showSnackBar("تم تسجيل الدخول بنجاح");
        Navigator.pushNamed(context, '/home');
      } else if (response.statusCode == 401) {
        showSnackBar(
          'البريد الالكتروني او الرقم السري غير صحيح, يرجى اعادة المحاولة',
          isError: true,
        );
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }
}
