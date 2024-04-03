import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ApiMethod {
  post_method,
  put_method,
  get_method,
  delete_method,
}

// class ApiClient {
//   ApiClient._();
//   static final instance = ApiClient._();
//   final client = HttpClient();
// }

class ApiService {
  static final ApiService _httpService = ApiService._();

  factory ApiService() => _httpService;

  ApiService._();

  Future<dynamic> postJSONRequest(
      {required String url,
      Object? requestBody,
      int? reqTimeout,
      String? jwtToken}) async {
    final String jsonRequest = json.encode(requestBody);
    final dynamic response;

    response = await fetchRequest(
        apiMethod: ApiMethod.post_method,
        url: url,
        requestBody: jsonRequest,
        reqTimeout: 60,
        jwtToken: jwtToken);

    return response.isEmpty ? response : json.decode(response);
  }

  Future<dynamic> getJSONRequestWithJWTToken(
      {required String url,
      Map<String, String>? reqHeader,
      bool? isEncryption,
      String? jwtToken}) async {
    String jwtToken = await _getToken();
    final dynamic response;

    response = await fetchRequest(
        url: url, apiMethod: ApiMethod.get_method, jwtToken: jwtToken);

    return response.isEmpty ? response : json.decode(response);
  }

  Future<dynamic> postRequestWithJWTToken({
    required String url,
    Object? requestBody,
    int? reqTimeout,
  }) async {
    String jwtToken = await _getToken();
    final String jsonRequest = json.encode(requestBody);
    final dynamic response;

    response = await fetchRequest(
        apiMethod: ApiMethod.post_method,
        url: url,
        requestBody: jsonRequest,
        reqTimeout: reqTimeout,
        jwtToken: jwtToken);

    return response.isEmpty ? response : json.decode(response);
  }

  Future<String> fetchRequest(
      {String? url,
      String? requestBody,
      apiMethod = ApiMethod.post_method,
      int? reqTimeout = 60,
      String? jwtToken}) async {
    try {
      Map<String, String>? defaultHeaders;
      defaultHeaders = {
        'Content-Type': 'application/json',
         'Accept-Encoding': 'gzip',
        // 'Content-Encoding': 'gzip',
      };

      if (jwtToken != null && jwtToken.isNotEmpty) {
        defaultHeaders['Authorization'] = 'Bearer $jwtToken';
      }

      String? request;
      request = requestBody;
      dynamic response;
      if (apiMethod == ApiMethod.get_method) {
        if (url != null && url.isNotEmpty) {
          response = await get(Uri.parse(url), headers: defaultHeaders)
              .timeout(const Duration(seconds: 60));
        }
      } else {
        if (url != null && url.isNotEmpty) {
          response = await post(
            Uri.parse(url),
            headers: defaultHeaders,
            body: requestBody,
          ).timeout(const Duration(seconds: 60));
        }
      }

      if (response.statusCode == 200) {
        final responseBody = response.body;
        return responseBody;
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('jwtToken') ?? '';
    return token;
  }
}
