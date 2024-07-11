import 'dart:convert';

import 'package:flutter_chat_client_demo/model/refresh_token.dart';
import 'package:flutter_chat_client_demo/model/user.dart';
import 'package:http/http.dart' as http;

class iamApi{
  final String baseUri = "https://localhost:7120/iam";

//login

Future<http.Response> loginUser({
    required String email, 
    required String password
    })
    async {
        final uri = Uri.parse("$baseUri/login");
        late http.Response response;

        final user = User(email: email, password: password);

        try{
          response = await http.post(
            uri,
            headers: <String, String>{
              'Content-type': 'application/json',

            },
            body: json.encode(user)
          );
        }
        catch (e)
        {
          return response;
        }
        return response;
    }


//register 

  Future<http.Response> registerUser({
    required String email, 
    required String password
    })
    async {
        final uri = Uri.parse("$baseUri/register");
        late http.Response response;

        final user = User(email: email, password: password);

        try{
          response = await http.post(
            uri,
            headers: <String, String>{
              'Content-type': 'application/json',

            },
            body: json.encode(user)
          );
        }
        catch (e)
        {
          return response;
        }
        return response;
    }

    //refresh
  Future<http.Response> RefreshUserToken({
    required String refreshToken, 
    })
    async {
        final uri = Uri.parse("$baseUri/refresh");
        late http.Response response;

        final rToken = RefreshToken(refreshToken: refreshToken);

        try{
          response = await http.post(
            uri,
            headers: <String, String>{
              'Content-type': 'application/json',

            },
            body: json.encode(rToken)
          );
        }
        catch (e)
        {
          return response;
        }
        return response;
    }



}