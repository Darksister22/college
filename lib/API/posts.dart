import 'package:college/API/apiconfig.dart';
import 'package:college/translate.dart';
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
        Api().setToken(localStorage.getString('token')!);
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

  Future createInstructor(
      String nameAr, String nameEn, Function showSnackBar) async {
    var data = {'name_ar': nameAr, "name_en": nameEn};
    try {
      final res = await Api().dio.post('instructors/create', data: data);
      if (res.statusCode == 200) {
        showSnackBar("تم اضافة التدريسي بنجاح");
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }

  Future createStudent(String nameAr, String nameEn, String selYear,
      Function showSnackBar) async {
    var data = {
      "name_ar": nameAr,
      "name_en": nameEn,
      "year": translateYearAE(selYear),
      'level': 'master' //TODO: Remove level entirely from API.
    };
    try {
      final res = await Api().dio.post('students/create/', data: data);
      if (res.statusCode == 200) {
        showSnackBar("تم اضافة الطالب بنجاح");
      } else {
        showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }

  Future editInstructor(context, String id, String nameAr, String nameEn,
      Function showSnackBar) async {
    var data = {"id": id, "name_ar": nameAr, "name_en": nameEn};
    try {
      var res = await Api().dio.post('instructors/update', data: data);
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, "/instructortable");
        showSnackBar("تم تحديث المعلومات بنجاح");
      } else {
        print(res.statusCode);
        showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }

  Future destroyInstructor(context, String id, Function showSnackBar) async {
    try {
      var res = await Api().dio.post('instructors/destroy/$id');
      print(res.statusCode);
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, "/instructortable");
        showSnackBar("تم حذف التدريسي بنجاح");
      } else if (res.statusCode == 409) {
        showSnackBar("لا يمكن حذف تدريسي لديه مواد حالية", isError: true);
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }
}
