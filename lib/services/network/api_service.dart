import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ApiService {
  Future<dynamic> getRequest(String url) async {
    try {
      final response = await get(Uri.parse(url));
      return _processResponse(response);
    } on SocketException {
      throw Exception('No internet connection');
    } catch (e) {
      debugPrint('Error in getRequest : $url -> $e');
      rethrow;
    }
  }
}

dynamic _processResponse(Response response) {
  switch (response.statusCode) {
    case 200:
    debugPrint('${jsonDecode(response.body)}');
      return jsonDecode(response.body);
    case 401:
      final mapResponse = jsonDecode(response.body);
      throw Exception(mapResponse['message'] ?? 'Unaurhoeized');
    case 500:
      throw Exception('Internal Server error occurred');
    default:
      throw Exception('Something went wrong');
  }
}
