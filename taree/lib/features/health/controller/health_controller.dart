import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/health_model copy.dart';
import '../../../models/health_model.dart';
import '../repository/health_repository.dart';

final healthModelProvider =
    StateProvider<HealthModel>((ref) => HealthModel(attributes: {}));

final healthControllerProvider = StateNotifierProvider<HealthController, bool>(
  (ref) => HealthController(
    healthRepository: ref.watch(healthRepositoryProvider),
    ref: ref,
  ),
);

// final getHealthModelProvider = FutureProvider.family((ref, String hid) {
//   final healthController = ref.watch(healthControllerProvider.notifier);
//   return healthController.getHealthCard(hid);
// });

class HealthController extends StateNotifier<bool> {
  final HealthRepository _healthRepository;
  final Ref _ref;
  HealthController({
    required HealthRepository healthRepository,
    required Ref ref,
  })  : _healthRepository = healthRepository,
        _ref = ref,
        super(false);

  void updateHealthRepository(BuildContext context) {
    final healthModel = _ref.read(healthModelProvider);
    final hid = "988";
    _healthRepository.updateHealthCard(healthModel, hid, context);
  }

  // Future<HealthModel?> getHealthCard(String hid) async {
  //   try {
  //     final healthModel = await _healthRepository.getHealthCard(hid);
  //     _ref
  //         .read(healthModelProvider.notifier)
  //         .update((state) => healthModel ?? state);
  //     return healthModel;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
