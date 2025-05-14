import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_flutter/core/storage/hive-storage/hive_storage.dart';
import 'package:boilerplate_flutter/core/storage/hive-storage/hive_storage_service.dart';
import 'package:boilerplate_flutter/core/storage/secure-storage/secure_storage.dart';
import 'package:boilerplate_flutter/core/storage/share_pref.dart';
import 'package:boilerplate_flutter/core/third-party/environment.dart';
import 'package:boilerplate_flutter/core/utils/app_url.dart';

final inject = GetIt.instance;

Future<void> initializeCore({required Environmentx environment}) async {
  ApiEndpoints.init(environment);
  await _initializeCore();
  await _initstorage();
}

Future<void> _initializeCore() async {
  await SharedPrefManager.init();
}

/// Initialize services's here

Future<void> _initstorage() async {
  ///------------>> Storage
  inject.registerLazySingleton<SecureStorage>(() => SecureStorage());
  inject.registerLazySingleton<SecureStorageBase>(() => SecureStorage());
}

///----------------------->> Storage

final hiveStorageService = Provider<HiveStorageBase>(
  (_) => HiveStorageService(),
);

final secureStorageService = Provider<SecureStorageBase>(
  (_) => SecureStorage(),
);

/// Network Service
//final _networkService = Provider<HttpService>((ref) => NetworkService());

/// User Storage
// final userStorageService = Provider<UserStorageService>((ref) {
//   return UserStorageService(
//     storageService: ref.watch(hiveStorageService),
//   );
// });

// final userRepo = Provider<UserRepository>((ref) {
//   final userService = ref.watch(userStorageService);
//   return UserDataStorage(userService);
// });

/// Auth Service Dependency Injection
// final _authService = Provider<AuthService>((ref) {
//   var network = ref.watch(_networkService);
//   var hiveStorage = ref.watch(hiveStorageService);
//   var secureStorage = ref.watch(secureStorageService);
//   return AuthService(
//     networkService: network,
//     storage: secureStorage,
//     hivestorage: hiveStorage,
//   );
// });

// final authRepository = Provider<AuthRepository>(
//   (ref) {
//     final authService = ref.watch(_authService);
//     return AuthImpl(authService);
//   },
// );
