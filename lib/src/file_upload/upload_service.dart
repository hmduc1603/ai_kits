import 'dart:io';

import 'package:ai_kits/src/file_upload/upload_config.dart';
import 'package:dio/dio.dart';

class UploadService {
  static final UploadService _instance = UploadService._internal();
  UploadService._internal();
  factory UploadService() => _instance;

  late UploadConfig _config;

  void init(UploadConfig config) {
    _config = config;
  }

  Future<String> uploadImage(
      {required File file, required String idToken}) async {
    final Response response = await Dio().post(
      "${_config.hostUrl}/image",
      options: Options(
          headers: _config.headers
            ..addAll({"id_token": idToken, "Content-Type": "image/jpeg"})),
      data: file.readAsBytesSync(),
    );
    return response.data["output"];
  }
}
