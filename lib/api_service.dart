import 'dart:convert';

import 'package:flutter_yourdoctors/common/app_strings.dart';
import 'package:http/http.dart' as http;

import 'data/model/model_class.dart';
class Services{
  Future<AuthenticateUser> postApiMethod(String name,String password) async {
String apiUrl = ApiUrlConstants.getUser;
print('requestUrl $apiUrl');


final json = {

"userName": name,
"password": password,
"deviceCode": "string",
"encryptionKey": "string"
};

http.Response response = await http.post(
apiUrl, body: jsonEncode(json), headers: <String, String>{
'Content-Type': 'application/json; charset=UTF-8',
},);
print(response);

var jsonResponse = jsonDecode(response.body);
print(jsonResponse);
return AuthenticateUser.fromJson(jsonResponse);
}
  // Future<AuthenticateUser> postApiMethod(String name,String password) async {
  //   String apiUrl = ApiUrlConstants.getUser;
  //   print(name);
  //   print(password);
  //   final json = {
  //     "userName": name,
  //     "password": password,
  //     "deviceCode": "string",
  //     "encryptionKey": "string"
  //   };
  //
  //   http.Response response = await http.post(
  //     apiUrl,
  //     body: jsonEncode(json),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //
  //   var jsonResponse = jsonDecode(response.body);
  //   print(jsonResponse);
  //   AuthenticateUser authenticateUser =parseUsers(response.body);
  // }
  // AuthenticateUser parseUsers(String responseBody){
  //   final AuthenticateUser authenticateUser =AuthenticateUser.fromJson(json.decode(responseBody));
  //   return authenticateUser;
  // }
}
