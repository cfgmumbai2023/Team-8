import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/error_handling.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/utils.dart';
import '../../../models/health_model.dart';
import 'package:http/http.dart' as http;

final healthRepositoryProvider = Provider((ref) {
  return HealthRepository();
});

class HealthRepository {
  HealthRepository();

  // CollectionReference get _healthCards =>
  //     _firestore.collection(FirebaseConstants.healthCardsCollection);

  void updateHealthCard(
      HealthModel healthModel, String hid, BuildContext context) async {
    try {
      // http.Response res =
      //     await http.post(Uri.parse('localhost:8080/urmi/addReport'), body: {
      //   'reportId': hid,
      //   'studentId': "90",
      //   'schoolId': healthModel.attributes['schoolId'],
      //   'subjectFraction': healthModel.attributes['subjectFraction'],
      //   'subjectAddition': healthModel.attributes['subjectAddition'],
      //   'subjectVocab': healthModel.attributes['subjectVocab'],
      //   'subjectFamilyTree': healthModel.attributes['subjectFamilyTree'],
      //   'subjectStampDesign': healthModel.attributes['subjectStampDesign'](),
      //   'description': healthModel.attributes['description'].toString(),
      // });

      print("server bef");
      var body = jsonEncode({  'reportId': '323',
        'studentId': '90',
        'schoolId': 'fdsfa',
        'subjectFraction': 1,
        'subjectAddition': 1,
        'subjectVocab': 1,
        'subjectFamilyTree': 1,
        'subjectStampDesign': 1,
        'description': 'esd' });

      // String res =
      http.post(Uri.parse("http://localhost:8080/urmi/addReport"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: body).then((http.Response response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.contentLength}");
        print(response.headers);
        print(response.request);
      });

      // httpErrorHandle(
      //   response: res,
      //   context: context,
      //   onSuccess: () {
      //     showSnackBar(context, 'Product Added Successfully!');
      //     Navigator.pop(context);
      //   },
      // );
      print("serv");
      // print(res.toString());
    } catch (e) {
      print("error");
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  // Future<HealthModel?> getHealthCard(String hid) async {
  //   try {
  //     final healthCard = await _healthCards
  //         .doc(hid)
  //         .snapshots()
  //         .map(
  //           (event) =>
  //               HealthModel.fromMap(event.data() as Map<String, dynamic>),
  //         )
  //         .first;
  //     return healthCard;
  //   } on FirebaseException catch (e) {
  //     throw e.message!;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
