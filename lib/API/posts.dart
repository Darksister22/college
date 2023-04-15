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
      'level': 'bachaelor' //TODO: Remove level entirely from API.
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
        showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }

  Future destroyInstructor(context, String id, Function showSnackBar) async {
    try {
      var res = await Api().dio.post('instructors/destroy/$id');
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

  Future editStudent(context, String id, String nameAr, String nameEn,
      String year, Function showSnackBar) async {
    var data = {
      "id": id,
      "name_ar": nameAr,
      "name_en": nameEn,
      "year": year,
      "level": "bachaelor"
    };
    try {
      var res = await Api().dio.post('students/update', data: data);
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, "/studenttable");
        showSnackBar("تم تحديث المعلومات بنجاح");
      } else {
        showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }

  Future destroyStudent(context, String id, Function showSnackBar) async {
    try {
      var res = await Api().dio.post('students/destroy/$id');
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, "/studentstable");
        showSnackBar("تم حذف الطالب بنجاح");
      } else {
        showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }

  Future removeStudent(context, String id, Function showSnackBar) async {
    try {
      var res = await Api().dio.post("students/remove/$id");
      if (res.statusCode == 200) {
        showSnackBar('تم قطع العلاقة مع الطالب بنجاح');
        Navigator.pushNamed(context, "/studentstable");
      } else {
        showSnackBar("حدث خطأ ما يرجى اعادة المحاولة", isError: true);
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما يرجى اعادة المحاولة", isError: true);
    }
  }

  Future getCurrentAverage(id) async {
    try {
      var res = await Api().dio.get('students/getCurAvg?id=$id');
      return (res.data);
    } catch (e) {
      return "";
    }
  }

  Future getHomeData() async {
    try {
      var res = await Api().dio.get("homepage");
      return res;
    } catch (e) {
      return 'error';
    }
  }

  Future createUser(context, String name, String email, String selRole,
      String password, Function showSnackBar) async {
    var data = {
      "email": email,
      "password": password,
      "role": translateRoleAE(selRole),
      'name': name
    };
    try {
      final res = await Api().dio.post('users/create/', data: data);
      if (res.statusCode == 200) {
        showSnackBar("تم اضافة المستخدم بنجاح");
        Navigator.pushNamed(context, "/usertable");
      } else if (res.statusCode == 409) {
        showSnackBar('البريد الالكتروني مأخوذ سابقاً', isError: true);
      } else if (res.statusCode == 403) {
        showSnackBar('لا تملك الصلاحية', isError: true);
      } else {
        showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
      }
    } catch (e) {
      showSnackBar("حدث خطأ ما, يرجى اعادة المحاولة", isError: true);
    }
  }
}
