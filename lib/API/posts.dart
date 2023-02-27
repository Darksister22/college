import 'package:college/API/apiconfig.dart';

class ApiPosts {
  Future login(context, email, password) async {
    var data = {'email': email, 'password': password};

    try {
      final response = await Api().dio.post(
            'api/users/login',
            data: data,
          );
      if (response.statusCode == 401) {
        return '401';

        // context.showSnackBar(
        //     'البريد الالكتروني او الرقم السري غير صحيح, يرجى اعادة المحاولة',
        //     isError: true);
      } else {
        return '200';
      }
    } catch (e) {
      return 'error';
    }
  }
}

//response = await dio.post("base_url/test", data: {"id": 1, "name": "jhon"});


