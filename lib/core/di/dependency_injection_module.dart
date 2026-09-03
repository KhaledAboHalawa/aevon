import 'package:aevon/core/network/token_interceptor.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio(TokenInterceptor tokenInterceptor) {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    dio.interceptors.add(tokenInterceptor);
    return dio;
  }

  // same thing works for instances that's gotten asynchronous.
  // all you need to do is wrap your instance with a future and tell injectable how
  // to initialize it
  @preResolve // if you need to pre resolve the value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  // Also, make sure you await for your configure function before running the App.

  @lazySingleton
  FirebaseFirestore firestore() => FirebaseFirestore.instance;
}
