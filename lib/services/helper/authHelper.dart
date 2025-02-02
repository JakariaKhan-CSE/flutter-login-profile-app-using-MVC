import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_profile_app/model/profileResModel.dart';
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

// Get Profile
  static Future<ProfileResModel> getProfile()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");

    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token'  // this is x-auth-token same as backend req.header("x-auth-token");
    };
    try{
      response = await http.get(Uri.parse('${Config.apiUrl}${Config.profileUrl}'),
          headers: requestHeaders);
    }catch(e)
    {
      //print('update profile api call error: $e');
    }

    if(response!.statusCode == 200)
    {
      //  var data = jsonDecode(response.body);
      // print(data);

      ProfileResModel profile;

      profile = ProfileResModel.fromJson(jsonDecode(response.body));


      return profile;
    }
    else{
      throw Exception('Failed to get profile');
    }

  }

}