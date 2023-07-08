import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      if (context.debugDoingBuild) {
        showSnackBar(context, jsonDecode(response.body)['msg']);
      }
      break;
    case 500:
      if (context.debugDoingBuild) {
        showSnackBar(context, jsonDecode(response.body)['error']);
      }
      break;
    default:
      if (context.debugDoingBuild) {
        showSnackBar(context, response.body);
      }
  }
}
