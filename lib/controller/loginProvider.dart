import 'package:flutter/material.dart';
import 'package:flutter_login_profile_app/view/profilePage.dart';
import '../model/loginModel.dart';
import '../services/helper/authHelper.dart';
class LoginNotifier extends ChangeNotifier{
  bool _obsecureText = true;

  bool get obsecureText => _obsecureText;

  set obsecureText(bool newState) {
    _obsecureText = newState;
    notifyListeners();  // for update state
  }

  final loginFormKey = GlobalKey<FormState>();
  bool validateAndSave()
  {

    final form = loginFormKey.currentState;

    if(form != null && form.validate())
    {
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

  userLogin(LoginModel model, BuildContext context)
  {
    AuthHelper.login(model).then((response){
      print(response);
     if(response)
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profilepage(),));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('SignIn Failed'),backgroundColor: Colors.red));

      }
    });
  }

}