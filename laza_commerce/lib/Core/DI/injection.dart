import 'package:get_it/get_it.dart';
import 'package:laza_commerce/Core/Service/firebase_service.dart';

import '../Service/firebase_storage_service.dart';

class DependencyInjection {
  final GetIt getIt = GetIt.instance;
  void setUp() {
    getIt.registerLazySingleton(() => FirebaseService());
    getIt.registerLazySingleton(() => FirebaseStorageService());
  }
}
