import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:digital/config/api.dart';
import 'package:digital/data/auth/model/login_params.dart';
import 'package:digital/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class ApiService {
  Future<Either> login(LoginParams params);
}

class ApiServiceImpl extends ApiService {
  @override
  Future<Either> login(LoginParams params) async {
    try {
      debugPrint("post: ${Api.baseUrl}${Api.auth}");
      debugPrint("params: ${params.toJson()}");

      final result = await sl<Dio>().post(
        "${Api.baseUrl}${Api.auth}",
        data: json.encode(params.toJson()),
      );

      return Right(result.data);
    } on DioException catch (e) {
      debugPrint("DioException: ${e.message}");

      return Left(e.response!.data['message']);
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }
}
