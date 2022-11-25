// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../../main.dart';
// import 'auth_utils.dart';
// import 'constants.dart';

// class NetworkUtils {
//   Dio? _dio;
//   // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   // SharedPreferences? prefs;

//   // static const String host = "https://comms-tkymsxhvwa-oa.a.run.app";
//   // static final String host =
//   //     "http://k8master.risknucleus.com/api/sys-y-customer-onboarding";
//   // "http://10.11.12.7:175/api/sys-y-customer-onboarding";
//   String _host = "";
//   NetworkUtils(String host) {
//     BaseOptions options = BaseOptions(
//         baseUrl: host,
//         followRedirects: false,
//         validateStatus: (status) {
//           return status! <= 500;
//         });

//     _dio = Dio(options);
//     _host = host;
//     _setupLoggingInterceptor();
//   }

//   void _setupLoggingInterceptor() async {
//     int maxCharactersPerLine = 200;
//     // Flutter 2
//     _dio!.interceptors.add(
//       InterceptorsWrapper(onRequest: (options, handler) async {
//         Map<String, String>? headers = <String, String>{
//           'Content-type': 'application/json',
//           'Authorization': 'Bearer ' + AuthUtils.getJWTToken().toString(),
//         };
//         options.headers = headers;
//         logger.d("--> ${options.method} ${options.path}");
//         logger.d("Content type: ${options.contentType}");
//         logger.d("Authorization: ${options.headers["Authorization"]}");
//         logger.d("Token: " + AuthUtils.getJWTToken().toString());
//         logger.d("<-- END HTTP");

//         // prefs = await _prefs;
//         // var timeNow = DateTime.now().millisecondsSinceEpoch;
//         // var lastHitApi = prefs!.getInt("lastApiHit");
//         // prefs!.setInt("lastApiHit", timeNow);
//         // if (lastHitApi != null) {
//         //   var delay = timeNow - lastHitApi;

//         //   if (delay > int.parse(prefs!.getString("timeout")!)) {
//         //     Utility.logout();
//         //     navigatorKey.currentState!.pushNamedAndRemoveUntil(
//         //         '/login', (Route<dynamic> route) => false);
//         //   }
//         // }

//         return handler.next(options);
//       }, onResponse: (response, handler) {
//         logger.d(
//             "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
//         if (response.statusCode == 401) {
//           Get.toNamed('/login');
//         }
//         String responseAsString = response.data.toString();
//         if (responseAsString.length > maxCharactersPerLine) {
//           int iterations =
//               (responseAsString.length / maxCharactersPerLine).floor();
//           for (int i = 0; i <= iterations; i++) {
//             int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
//             if (endingIndex > responseAsString.length) {
//               endingIndex = responseAsString.length;
//             }
//             logger.d(responseAsString.substring(
//                 i * maxCharactersPerLine, endingIndex));
//           }
//         } else {
//           logger.d(response.data);
//         }
//         logger.d("<-- END HTTP");
//         return handler.next(response);
//       }, onError: (DioError e, handler) {
//         logger.d(e);
//       }),
//     );
//   }

//   dynamic updateLocation(var data) async {
//     // var requestPayload = {};

//     // requestPayload["trucker_id"] = 20;
//     // requestPayload["client_id"] = "client.user.id.1";
//     // requestPayload["latitude"] = data["latitude"];
//     // requestPayload["longitude"] = data["longitude"];
//     var uri = _host + "/update-location";
//     // // ignore: avoid_print
//     logger.d("update-location uri: " + uri);
//     // logger.d(json.encode(requestPayload));
//     // final response = await _dio!.post(uri, data: json.encode(requestPayload));
//     // return response;
//   }

//   dynamic login(var data) async {
//     var requestPayload = {};

//     requestPayload["email"] = data["email"];
//     requestPayload["password"] = data["password"];
//     var uri = _host + "public/user/login_trucker";
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.post(uri, data: json.encode(requestPayload));
//     return response;
//   }

//   dynamic getLoadRequest(int truckId, dynamic biddingStatus) async {
//     var requestPayload = {};
//     requestPayload["truckId"] = truckId;
//     var uri =
//         _host + "/get_load_requests_by_trucker_id/$truckId/" + biddingStatus;
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.get(uri);
//     // if (response.statusCode == 200) {
//     //   return response.data;
//     // } else {
//     //   logger.d(response.statusMessage);
//     //   return response.data;
//     // }
//     return response;
//   }

//   dynamic getUpcomingTrip(int truckId) async {
//     var requestPayload = {};
//     requestPayload["truckId"] = truckId;
//     var uri = _host + "/upcoming_trip/$truckId";

//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.get(uri);
//     return response;
//   }

//   dynamic startVerification(var data) async {
//     var requestPayload = {};

//     // requestPayload["user_number"] = "+1"+ data["user_number"];
//     requestPayload["user_number"] =
//         "+923089216362"; //923408294115 923162129689 923352132463 923089216362
//     requestPayload["fk_trucker"] = data["fk_trucker"];
//     requestPayload["app_hash"] = data["app_hash"];

//     var uri = _host + "/comms/start-verification";
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.post(uri, data: json.encode(requestPayload));
//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic checkVerification(var data) async {
//     var requestPayload = {};

//     // requestPayload["user_number"] = "+1"+data["user_number"];
//     requestPayload["user_number"] = "+923352132463";
//     requestPayload["code"] = data["code"];
//     requestPayload["fk_trucker"] = data["fk_trucker"];
//     var uri = _host + "/comms/check-verification";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.post(uri, data: json.encode(requestPayload));
//     return response.data;
//   }

//   dynamic truckerUploadLicense(var data) async {
//     var requestPayload = {};
//     var fileExtension = data["fileExtension"];
//     var image = data["image"];
//     logger.d("data $data");
//     requestPayload["image"] = "data:image/$fileExtension;base64," + image;
//     var uri = _host + "/trucker_upload_image";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.put(uri, data: json.encode(requestPayload));
//     if (response.statusCode == 202) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic uploadBOLImage(var data) async {
//     var requestPayload = {};
//     var fileExtension = data["fileExtension"];
//     var biddingId = data["biddingId"];

//     // requestPayload["user_number"] = data["user_number"];
//     requestPayload["image"] =
//         "data:image/$fileExtension;base64," + data["image"];
//     requestPayload["stop_number"] = data["stop_number"];

//     var uri = _host + "/add-bol-url/$biddingId";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.put(uri, data: json.encode(requestPayload));
//     // if (response.statusCode == 202) {
//     //   return response.data;
//     // } else {
//     //   logger.d(response.statusMessage);
//     //   return response.data;
//     // }
//     return response;
//   }

//   dynamic uploadPODImage(var data) async {
//     var requestPayload = {};
//     var fileExtension = data["fileExtension"];
//     var biddingId = data["biddingId"];
//     // requestPayload["user_number"] = data["user_number"];
//     requestPayload["image"] =
//         "data:image/$fileExtension;base64," + data["image"];
//     requestPayload["stop_number"] = data["stop_number"];

//     var uri = _host + "/add-pod-url/$biddingId";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.put(uri, data: json.encode(requestPayload));
//     if (response.statusCode == 202) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic requestLumper(var data) async {
//     var requestPayload = {};
//     var fileExtension = data["fileExtension"];
//     var biddingId = data["biddingId"];

//     requestPayload["amount"] = data["amount"];
//     requestPayload["load_bidding_id"] = data["load_bidding_id"];
//     requestPayload["stop_number"] = data["stop_number"];
//     requestPayload["receipt_base64"] =
//         "data:image/$fileExtension;base64," + data["receipt_base64"];

//     var uri = _host + "/lumper";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.post(uri, data: json.encode(requestPayload));
//     if (response.statusCode == 202) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic uploadMapImage(var data) async {
//     var requestPayload = {};
//     var fileExtension = data["fileExtension"];
//     var biddingId = data["biddingId"];
//     requestPayload["image"] =
//         "data:image/$fileExtension;base64," + data["image"];
//     requestPayload["stop_number"] = data["stop_number"];
//     var uri = _host + "/add-map-url/$biddingId";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.put(uri, data: json.encode(requestPayload));
//     if (response.statusCode == 202) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic activity(var data) async {
//     var requestPayload = {};

//     requestPayload["title"] = data["title"];
//     requestPayload["bidding_id"] = data["bidding_id"];
//     requestPayload["identifier"] = data["identifier"];
//     requestPayload["stop_number"] = data["stop_number"];

//     var uri = _host + "/biddings/activity";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.post(uri, data: json.encode(requestPayload));
//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic updateBiddingStatus(var data) async {
//     var requestPayload = {};

//     requestPayload["bidding_id"] = data["bidding_id"];
//     requestPayload["status"] = data["LoadBiddingStatus"];
//     requestPayload["stop_number"] = data["stop_number"];

//     var uri = _host + "/update";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.put(uri, data: json.encode(requestPayload));
//     if (response.statusCode == 202) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic userProfileImage(var data) async {
//     var requestPayload = {};
//     var fileExtension = data["fileExtension"];
//     var image = data["image"];
//     var userId = data["userId"];
//     logger.d("data $data");
//     requestPayload["image"] = "data:image/$fileExtension;base64," + image;
//     var uri = _host + "/add-user-image/$userId";
//     // ignore: avoid_print
//     logger.d(uri);
//     logger.d(json.encode(requestPayload));
//     final response = await _dio!.put(uri, data: json.encode(requestPayload));
//     if (response.statusCode == 202) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic getTasks(dynamic taskId) async {
//     var driverId = AuthUtils.getDriverId();
//     var uri = _host + "/get_all_documents_from_trucker/$driverId/$taskId";
//     logger.d(uri);
//     final response = await _dio!.get(uri);
//     if (response.statusCode == 200) {
//       return response;
//     } else {
//       logger.d(response.statusMessage);
//       return response;
//     }
//   }

//   dynamic getApprovedLoadBiddings() async {
//     var userId = AuthUtils.getUserId();
//     var uri = _host + "/get_all_approved_loadbiddings/$userId";
//     logger.d(uri);
//     final response = await _dio!.get(uri);
//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic getChat(dynamic roomId) async {
//     var uri = _host + "/chat/get_all_messages_by_room_id/$roomId";
//     logger.d(uri);
//     final response = await _dio!.get(uri);
//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       logger.d(response.statusMessage);
//       return response.data;
//     }
//   }

//   dynamic getCompanyUsers() async {
//     var uri = _host + "/get-company-users";
//     logger.d(uri);
//     final response = await _dio!.get(uri);
//     return response;
//   }

//   dynamic updateFcmToken(String fcmToken) async {
//     var uri = _host + "/users/update_fcm_token";
//     var requestPayload = {};
//     requestPayload["fcm_token"] = fcmToken;
//     logger.d(json.encode(requestPayload));
//     logger.d(uri);
//     final response = await _dio!.put(uri, data: json.encode(requestPayload));
//     return response;
//   }

//   dynamic getNotifications() async {
//     var userId = AuthUtils.getUserId()!;
//     var uri = _host + "/get-notifications/$userId";
//     logger.d(uri);
//     final response = await _dio!.get(uri);
//     return response;
//   }

//   dynamic markNotifications() async {
//     var userId = AuthUtils.getUserId()!;
//     var uri = _host + "/mark-notification/$userId";
//     // ignore: avoid_print
//     logger.d(uri);
//     final response = await _dio!.put(uri);
//     return response;
//   }

//   dynamic getTotalUnreadMsg() async {
//     var uri = _host + "/chat/get_unread_messages_count";
//     logger.d(uri);
//     final response = await _dio!.get(uri);
//     return response;
//   }
// }
