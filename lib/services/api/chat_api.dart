import 'dart:convert';

import 'package:flutter_chat_client_demo/model/message.dart';
import 'package:http/http.dart' as http;

class iamApi{
  final String baseUri = "https://localhost:7120/chat";

//login

Future<http.Response> broadcast({
    required String messageToBroadCast, 
    })
    async {
        final uri = Uri.parse("$baseUri/broadcast");
        late http.Response response;

        final message = Message(message: messageToBroadCast);
        try{
          response = await http.post(
            uri,
            headers: <String, String>{
              'Content-type': 'application/json; charset=UTF-8',

            },
            body: json.encode(message)
          );
        }
        catch (e)
        {
          return response;
        }
        return response;
    }
}