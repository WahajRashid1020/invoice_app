import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../main.dart';

class NetworkUtils {
  final box = GetStorage();
  Dio? _dio;
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // SharedPreferences? prefs;

  // static const String host = "https://comms-tkymsxhvwa-oa.a.run.app";
  // static final String host =
  //     "http://k8master.risknucleus.com/api/sys-y-customer-onboarding";
  // "http://10.11.12.7:175/api/sys-y-customer-onboarding";
  String _host = "";
  NetworkUtils(String host) {
    BaseOptions options = BaseOptions(
        baseUrl: host,
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        });

    _dio = Dio(options);
    _host = host;
    _setupLoggingInterceptor();
  }

  void _setupLoggingInterceptor() async {
    var token = box.read('tokenid');
    int maxCharactersPerLine = 200;

    _dio!.interceptors.add(
      InterceptorsWrapper(
          onRequest: (options, handler) async {
            Map<String, String>? headers = <String, String>{
              'Content-type': 'application/json',
              'Authorization': 'Bearer ' + token,
            };
            options.headers = headers;

            // prefs = await _prefs;
            // var timeNow = DateTime.now().millisecondsSinceEpoch;
            // var lastHitApi = prefs!.getInt("lastApiHit");
            // prefs!.setInt("lastApiHit", timeNow);
            // if (lastHitApi != null) {
            //   var delay = timeNow - lastHitApi;

            //   if (delay > int.parse(prefs!.getString("timeout")!)) {
            //     Utility.logout();
            //     navigatorKey.currentState!.pushNamedAndRemoveUntil(
            //         '/login', (Route<dynamic> route) => false);
            //   }
            // }

            return handler.next(options);
          },
          onResponse: (response, handler) {
            if (response.statusCode == 401) {
              // Get.toNamed('/login');
            }
            String responseAsString = response.data.toString();
            if (responseAsString.length > maxCharactersPerLine) {
              int iterations =
                  (responseAsString.length / maxCharactersPerLine).floor();
              for (int i = 0; i <= iterations; i++) {
                int endingIndex =
                    i * maxCharactersPerLine + maxCharactersPerLine;
                if (endingIndex > responseAsString.length) {
                  endingIndex = responseAsString.length;
                }
              }
            } else {}

            return handler.next(response);
          },
          onError: (DioError e, handler) {}),
    );
  }

  // dynamic login(var data) async {
  //   var requestPayload = {};

  //   requestPayload["email"] = data["email"];
  //   requestPayload["password"] = data["password"];
  //   var uri = _host + "public/user/login_trucker";
  //   final response = await _dio!.post(uri, data: json.encode(requestPayload));
  //   return response;
  // }

  // dynamic updateFcmToken(String fcmToken) async {
  //   var uri = _host + "/users/update_fcm_token";
  //   var requestPayload = {};
  //   requestPayload["fcm_token"] = fcmToken;
  //   final response = await _dio!.put(uri, data: json.encode(requestPayload));
  //   return response;
  // }

  dynamic getSingleTransactions() async {
    // var userId = AuthUtils.getUserId()!;
    var uri = '${_host}transactions';
    final response = await _dio!.get(uri);
    return response.data;
  }

  dynamic getCustomers() async {
    // var userId = AuthUtils.getUserId()!;
    var uri = _host + 'customers'.toString();
    final response = await _dio!.get(uri);
    return response;
  }

  dynamic postCustomers(var data) async {
    var requestPayload = {};
    requestPayload["name"] = data["name"];
    requestPayload["address"] = data["address"];
    requestPayload["email"] = data["email"];
    requestPayload["poc_name"] = data["pocName"];
    var uri = _host + 'customers'.toString();
    final response = await _dio!.post(uri, data: json.encode(requestPayload));
    return response;
  }

  dynamic updateCustomers(var data) async {
    var requestPayload = {};
    requestPayload["name"] = data["name"];
    requestPayload["address"] = data["address"];
    requestPayload["email"] = data["email"];
    requestPayload["poc_name"] = data["pocName"];
    requestPayload["document_id"] = data["documentId"];
    var uri = _host + 'customer'.toString();
    final response = await _dio!.put(uri, data: json.encode(requestPayload));
    return response;
  }

  dynamic deleteCustomer(var data) async {
    var requestPayload = {};
    requestPayload["name"] = data["name"];
    requestPayload["email"] = data["email"];
    requestPayload["poc_name"] = data["pocName"];
    requestPayload["address"] = data["address"];
    requestPayload["document_id"] = data["documentId"];
    var uri = _host + 'customer'.toString();
    final response = await _dio!.delete(uri, data: json.encode(requestPayload));
    return response;
  }
}
