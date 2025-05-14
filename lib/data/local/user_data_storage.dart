// import 'dart:developer';

// import 'package:boilerplate_flutter/core/storage/hive-storage/hive_storage.dart';
// import 'package:boilerplate_flutter/core/storage/hive-storage/hive_storage_service.dart';
// import 'package:boilerplate_flutter/data/models/responses/user_response.dart';

// class UserStorageService {
//   final HiveStorageBase _storageService;

//   UserStorageService({required HiveStorageBase storageService}) : _storageService = storageService;

//   Future<UserResponse> getUser() async {
//     try {
//       final result = await _storageService.get(StorageKey.userProfile.name);

//       log("RESULT ----------->>> $result");

//       return result;
//     } catch (e) {
//       log("This is a Storage Error $e");
//       throw e.toString();
//     }
//   }
// }
