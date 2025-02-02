import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/loginModel.dart';
import '../config.dart';
class AuthHelper{
  // login function
  static Future<bool> login(LoginModel model)async{
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json"
    };

    try{
      response = await http.post(Uri.parse('${Config.apiUrl}${Config.loginUrl}'),
          body: model.toJson(), // body ta jsonEncode kora hosse toJson() call kore
          headers: requestHeaders);
    }catch(e)
    {
      debugPrint('login api call error: $e');
    }

    if(response!.statusCode == 200)
    {

      final SharedPreferences pref = await SharedPreferences.getInstance();

      var responseBody = jsonDecode(response.body);

      String token = responseBody['data']['accessToken'];

      await pref.setString('token', token);

      return true;
    }
    else{

      return false;
    }

  }

// // Get Profile
//   static Future<ProfileResponse> getProfile()async{
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     String? token = pref.getString("token");
//     String? userId = pref.getString('userId');
//
//     http.Response? response;
//     Map<String, String> requestHeaders = {
//       "Content-Type": "application/json",
//       "x-auth-token": '$token'  // this is x-auth-token same as backend req.header("x-auth-token");
//     };
//     try{
//       response = await http.get(Uri.parse('${Config.apiUrl}${Config.profileUrl}/$userId'),
//           headers: requestHeaders);
//     }catch(e)
//     {
//       //print('update profile api call error: $e');
//     }
//
//     if(response!.statusCode == 200)
//     {
//       //  var data = jsonDecode(response.body);
//       // print(data);
//
//       ProfileResponse profile;
//
//       profile = profileResponseFromJson(response.body);
//
//
//       return profile;
//     }
//     else{
//       throw Exception('Failed to get profile');
//     }
//
//   }

}