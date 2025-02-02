import 'package:flutter/cupertino.dart';
import 'package:flutter_login_profile_app/model/profileResModel.dart';

import '../services/helper/authHelper.dart';

class ProfileNotifier extends ChangeNotifier{
  Future<ProfileResModel>? profile;
  getProfile()async{
    profile =  AuthHelper.getProfile();
  }
}