import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.7:5000/',
        connectTimeout: Duration(milliseconds: 20 * 1000),
        receiveTimeout: Duration(milliseconds: 20 * 1000),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return dio!.post(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio!.put(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': "Bearer " + token!,
      'Content-Type': 'application/json',
    };

    return dio!.patch(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData(
      {required String url, String lang = 'en', String? token}) async {
    dio!.options.headers = {
      'lang': '$lang',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    return await dio!.delete(url);
  }
}
