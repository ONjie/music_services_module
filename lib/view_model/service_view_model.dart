import 'package:flutter/material.dart';
import 'package:music_services_module/core/exceptions/exceptions.dart';
import 'package:music_services_module/model/service_model.dart';
import 'package:music_services_module/services/cloud_firestore_service.dart';

import '../core/network/network_info.dart';

class ServiceViewModel extends ChangeNotifier {
  ServiceViewModel({
    required this.cloudFirestoreService,
    required this.networkInfo,
  });

  final CloudFirestoreService cloudFirestoreService;
  final NetworkInfo networkInfo;

  late List<ServiceModel> _services = [];
  late bool _isLoading = false;
  late String _errorMessage = '';

  List<ServiceModel> get services => _services;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchServices() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    if (!await networkInfo.isConnected) {
      _errorMessage = 'No internet connection';
      _isLoading = false;
      notifyListeners();
    }
    try {
      _services = await cloudFirestoreService.fetchServices();
    } on CloudFirestoreException catch (e) {
      _errorMessage = e.message;
    }

    _isLoading = false;
    notifyListeners();
  }
}
