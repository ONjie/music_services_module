import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:music_services_module/core/network/network_info.dart';
import 'package:music_services_module/services/cloud_firestore_service.dart';
import 'package:music_services_module/view_model/service_view_model.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(
    () => ServiceViewModel(
      cloudFirestoreService: locator(),
      networkInfo: locator(),
    ),
  );

  locator.registerLazySingleton<CloudFirestoreService>(
    () => CloudFirestoreServiceImpl(firebaseFirestore: locator()),
  );

  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: locator()),
  );

  locator.registerLazySingleton(
    () => InternetConnectionChecker.createInstance(),
  );

   locator.registerLazySingleton(
    () => FirebaseFirestore.instance,
  );


}
