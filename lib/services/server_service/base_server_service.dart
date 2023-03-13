import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseServerService {

  static const int STATUS_CODE_OK_200 = 200;
  static const int STATUS_CODE_ERROR = 404;
  static const int STATUS_CODE_TIMEOUT = 408;

  static const int _TIME_OUT_IN_SECONDS = 15;

  static const String BASE_URL = "https://swapi.dev/api/";
  static const String STAR_WARS_API_CALL_PLANETS = "planets/";
  static const String STAR_WARS_API_CALL_FILMS = "films/";
  static const String STAR_WARS_API_CALL_PEOPLE = "people/";
  static const String STAR_WARS_API_CALL_SPECIES = "species/";
  static const String STAR_WARS_API_CALL_STARSHIPS = "starships/";
  static const String STAR_WARS_API_CALL_VEHICLES = "vehicles/";

  FutureOr<http.Response> _onTimeout() {
    return http.Response(
      json.encode({"message": "request timeout"}), STATUS_CODE_TIMEOUT
    );
  }

  Future<http.Response> getRequest(String apiCall) async {
    return await http.get(
      Uri.parse("$BASE_URL/$apiCall"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    ).timeout(
      const Duration(seconds: _TIME_OUT_IN_SECONDS),
      onTimeout: () => _onTimeout()
    );
  }

  Future<http.Response> getRequestFromUrl(String url) async {
    return await http.get(
      Uri.parse("$url"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    ).timeout(
      const Duration(seconds: _TIME_OUT_IN_SECONDS),
      onTimeout: () => _onTimeout()
    );
  }


  safetyPrint(http.Response response) {
    print("Request: ${response.request}");
    print("Status code: ${response.statusCode}");
    print("Response phrase: ${response.reasonPhrase}");
    print("Headers: ${response.headers}");
    print("Body: ${response.body}");
  }

}