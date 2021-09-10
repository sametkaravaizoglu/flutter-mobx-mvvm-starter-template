import 'dart:io';

import '../../base/model/base_model.dart';
import '../../constants/app_constants.dart';
import '../../constants/enums/preferences_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  var headers;
  NetworkManager._init() {
    headers = {
      'token': LocaleManager.instance.getString(
        PreferencesKeys.TOKEN,
      ),
    };
  }

  Future<dynamic> get<T extends IBaseModel>(String path,
      {IBaseModel model}) async {
    final response = await http.get(
      Uri.https(ApplicationConstants.BASE_URL, path),
      headers: headers,
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return response.body;
      default:
        throw response.body;
    }
  }

  Future<dynamic> post<T extends IBaseModel>(
      {String path, Map<String, dynamic> data, IBaseModel model}) async {
    final response = await http.get(
      Uri.https(ApplicationConstants.BASE_URL, path),
      headers: headers,
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return response.body;
      default:
        throw response.body;
    }
  }
}
