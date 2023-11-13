import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class Internet {
  static final Map<String, String> headersCook = {'Accept': 'application/json'};

  static Future httpPostcook({
    required String url,
    required Map<String, dynamic> body,
    bool timeOut = false,
  }) async {
    int seconds = 0;
    debugPrint("Request to $url");
    debugPrint("Send $body to $url");
    try {
      final queryUrl = Uri.parse(url);
      final headers = Map<String, String>.from(headersCook);
      headers['Content-Type'] = 'application/json';
      final response = timeOut
          ? await http
              .post(queryUrl, body: json.encode(body), headers: headers)
              .timeout(Duration(seconds: seconds))
          : await http.post(queryUrl,
              body: json.encode(body), headers: headers);
      var decodedData = json.decode(response.body);

      debugPrint("Request status code ${response.statusCode} from $url");
      debugPrint("Request response $decodedData from $url");
      return decodedData;
    } on TimeoutException catch (e) {
      return {
        'valor': '0',
        'message': 'Límite de tiempo de espera excedido.',
        'exception': e
      };
    } catch (e) {
      return {
        'valor': '0',
        'message': 'Ocurrió un error, vuelva a intentarlo.',
        'exception': e
      };
    }
  }
}
