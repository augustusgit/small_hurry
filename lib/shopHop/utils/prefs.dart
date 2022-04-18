import 'package:shared_preferences/shared_preferences.dart';

void saveRegisteredUserInfo(String firstname, String lastname, String phone, String email,  int id) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString('first_name', firstname);
  _prefs.setString('last_name', lastname);
  _prefs.setString('phone', phone);
  _prefs.setString('email', email);
  _prefs.setInt('id', id);
}

 getRegisteredUserInfo() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var _firstName = _prefs.getString('first_name');
  var _lastName = _prefs.getString('last_name');
  var _phone = _prefs.getString('phone');
  var _email = _prefs.getString('email');
  var _id = _prefs.getInt('id');

  Map registeredUser = {"first_name": _firstName, "last_name": _lastName, "phone": _phone, "email": _email, "id": _id};
  return registeredUser;
}

void removeRegisteredUserData() async {
   SharedPreferences _prefs = await SharedPreferences.getInstance();
   _prefs.remove('id');
   _prefs.remove('first_name');
   _prefs.remove('last_name');
   _prefs.remove('phone');
   _prefs.remove('email');
   _prefs.remove('token');
   _prefs.remove('image_url');
}

void saveLoggedUserInfo(String firstname, String lastname, String phone, String email,  int id, String token, String imageUrl) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString('first_name', firstname);
  _prefs.setString('last_name', lastname);
  _prefs.setString('phone', phone);
  _prefs.setString('email', email);
  _prefs.setInt('id', id);
  _prefs.setString('token', token);
  _prefs.setString('image_url', imageUrl);
}

getLoggedInUserInfo() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var _firstName = _prefs.getString('first_name');
  var _lastName = _prefs.getString('last_name');
  var _phone = _prefs.getString('phone');
  var _email = _prefs.getString('email');
  var _id = _prefs.getInt('id');
  var _token = _prefs.getString('token');
  var _imageUrl = _prefs.getString('image_url');

  Map loggedInUser = {"first_name": _firstName, "last_name": _lastName, "phone": _phone, "email": _email, "id": _id, "token": _token, "image_url": _imageUrl};
  return loggedInUser;
}

 checkLoggedInUser()async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var _token = _prefs.getString('token');
  print(_token);
  if(_token == null){
    return false;
  }else {
    return true;
  }
}

getUserToken()async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var _token = _prefs.getString('token');
  print(_token);

    return _token;
}