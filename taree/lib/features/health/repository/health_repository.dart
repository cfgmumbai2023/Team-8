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
  return HealthRepository(firestore: ref.watch(firestoreProvider));
});

class HealthRepository {
  final FirebaseFirestore _firestore;
  HealthRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _healthCards =>
      _firestore.collection(FirebaseConstants.healthCardsCollection);

  void updateHealthCard(
      HealthModel healthModel, String hid, BuildContext context) async{

    try {

    

      http.Response res = await http.post(
        Uri.parse('localhost:8080/urmi/addReport'),
        
        body:{
          'reportId':healthModel.attributes['reportId'],
          'subjectFraction':healthModel.attributes['subjectFraction'],
          'subjectAddition':healthModel.attributes['subjectAddition'],
          'subjectVocab':healthModel.attributes['subjectVocab'],
          'subjectFamilyTree':healthModel.attributes['subjectFamilyTree'],
          'subjectStampDesign':healthModel.attributes['subjectStampDesign'],
          'description':healthModel.attributes['description'],
        }
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<HealthModel?> getHealthCard(String hid) async {
    try {
      final healthCard = await _healthCards
          .doc(hid)
          .snapshots()
          .map(
            (event) =>
                HealthModel.fromMap(event.data() as Map<String, dynamic>),
          )
          .first;
      return healthCard;
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      rethrow;
    }
  }
}
