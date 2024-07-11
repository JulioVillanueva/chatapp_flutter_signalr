import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_chat_client_demo/services/api/iam_api.dart';
import 'package:flutter_chat_client_demo/model/auth_token.dart';
import 'package:http/http.dart' as http;

class AuthService {
//instance of auth
  final iamApi _api = iamApi();
  final loggedInStreamController = StreamController<bool>();
  AuthToken? _authToken;

// sign in
  Future<http.Response> signInWithEmailPassword(
      String email, String password) async {
    try {
      http.Response response =
          await _api.loginUser(email: email, password: password);
      final bodyMap = json.decode(response.body);
      var succes = response.statusCode == 200;
      if (succes) {
        _authToken = AuthToken.fromJson(bodyMap);
      } else {
        _authToken = null;
        throw Exception(getExceptionMessage(bodyMap));
      }
      loggedInStreamController.add(succes);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  String getExceptionMessage(Map<String, dynamic> bodyMap) {
    String message = "";
    var details = bodyMap['detail'];
    if (details != null) {
      message += "Action ${details.toString()}, ";
    }
    var status = bodyMap['status'];
    if (status != null) {
      message += "Status ${status.toString()} - ";
    }
    var title = bodyMap['title'];
    if (title != null) {
      message += title.toString();
    }
    var errors = bodyMap['errors'];
    if (errors != null && errors is Map) {
      var errorsMap = errors;
      for (var errorKey in errorsMap.keys) {
        message += "${Platform.lineTerminator}Error List:";
        for (var errorMessage in errorsMap[errorKey]) {
          message += "  ${Platform.lineTerminator}$errorKey: $errorMessage";
        }
      }
    }

    return message;
  }

//sign up
  Future<http.Response> signUpWithEmailPassword(
      String email, String password) async {
    try {
      http.Response response =
          await _api.registerUser(email: email, password: password);
      var succes = response.statusCode == 200;
      if (succes) {
        return response;
      } else {
        final bodyMap = json.decode(response.body);

        throw Exception(getExceptionMessage(bodyMap));
      }
    } catch (e) {
      rethrow;
    }
  }

  //signup and signin
  Future<http.Response> signUpAndSignInWithEmailPassword(
      String email, String password) async {
    try {
      http.Response registerResponse =
          await signUpWithEmailPassword(email, password);
      var succes = registerResponse.statusCode == 200;
      if (succes) {
        http.Response loginResponse =
            await signInWithEmailPassword(email, password);
        return loginResponse;
      } else {
        return registerResponse;
      }
    } catch (e) {
      rethrow;
    }
  }

//sign out
  void signOut() {
    _authToken = null;
    loggedInStreamController.add(false);
  }

//errors
}
