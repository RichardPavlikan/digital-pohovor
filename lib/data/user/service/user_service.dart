import 'package:dartz/dartz.dart';
import 'package:digital/config/api.dart';
import 'package:digital/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserService {
  Future<Either> getUsers();
}

class UserServiceImpl extends UserService {
  @override
  Future<Either> getUsers() async {
    try {
      final token = await sl<FlutterSecureStorage>().read(key: "auth_token");

      debugPrint("makking request with token: $token");

      final response = await sl<Dio>().get(
        Api.baseUrl + Api.getUsers,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      debugPrint("get: ${Api.baseUrl}${Api.getUsers}");

      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return const Left('Failed to fetch user');
      }
    } on DioException catch (e) {
      debugPrint("DioException: ${e.message}");
      debugPrint(e.error.toString());

      return Left(e.message);
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }
}
