import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_services_module/model/service_model.dart';

import '../core/exceptions/exceptions.dart';

abstract class CloudFirestoreService {
  Future<List<ServiceModel>> fetchServices();
}

class CloudFirestoreServiceImpl implements CloudFirestoreService {
  CloudFirestoreServiceImpl({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;

  @override
  Future<List<ServiceModel>> fetchServices() async {
    try {
      final querySnapshot =
          await firebaseFirestore
              .collection('services')
              .withConverter<ServiceModel>(
                fromFirestore: ServiceModel.fromFirestore,
                toFirestore: (serviceModel, _) => serviceModel.toFirestore(),
              )
              .get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CloudFirestoreException(message: e.toString());
    }
  }
}
