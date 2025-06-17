import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:ai_kits/ai_kits.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class VoiceAIService {
  static final VoiceAIService _instance = VoiceAIService._internal();
  VoiceAIService._internal();
  factory VoiceAIService() => _instance;

  late VoiceConfig _config;

  void init(VoiceConfig config) {
    _config = config;
    DailyCountingManager().setUpLimitation(_config.dailyLimitation);
  }

  Future<VoiceModelList> getModels({
    required int page,
    String? search,
    String? filer,
    bool community = true,
  }) async {
    try {
      dev.log('getModels: $filer - $community');
      String host;
      if (_config.renderApiConfig.headers.containsKey("getAllModels_url")) {
        host = _config.renderApiConfig.headers["getAllModels_url"];
      } else {
        host =
            "https://www.voicify.ai/api/model/getAllModels?page=$page&search=&limit=24&community=$community";
        if (filer != null) {
          host = "$host&filter=$filer";
        }
        if (search != null) {
          host = host.replaceAll(
              "search=", "search=${search.replaceAll(" ", "+")}");
        }
      }
      final response = await Dio().get(
        host,
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
        ),
      );
      AIKits().analysisMixin.sendEvent("success_getModels");
      final models = VoiceModelList.fromJson(response.data);
      dev.log(
          name: "VoiceAIService",
          models.models.map((e) => e.artistName).toList().join(','));
      return models;
    } catch (e) {
      dev.log(e.toString());
      AIKits().analysisMixin.sendEvent("error_getModels");
      // Get defaults
      String response =
          await rootBundle.loadString('assets/json/remote_config.json');
      final Map<String, dynamic> data = json.decode(response);
      return VoiceModelList.fromJson(data);
    }
  }

  Future<VoiceResult> convertMusic({
    required String model,
    required String youtubeAuthor,
    required String youtubeTitle,
    required String youtubeUrl,
    required bool isPremium,
    required String modelId,
    String? firebaseMessagingToken,
    required String idToken,
  }) async {
    try {
      dev.log('convertMusic: $model - $youtubeUrl');

      final requestId = _generateRandomUUID();
      final response = await Dio().post(
        "${_config.renderApiConfig.hostUrl}/create",
        data: {
          "firebase_messaging_token": firebaseMessagingToken,
          "is_premium": isPremium,
          "model_id": modelId,
          "request_id": requestId,
          "key": "audio/${_generateRandomUUID()}.wav",
          "model": model,
          "url": youtubeUrl,
          "youtube_title": youtubeTitle,
          "youtube_author": youtubeAuthor,
        },
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers
            ..addAll({"id_token": idToken}),
        ),
      );
      if (response.statusCode == 200) {
        AIKits().analysisMixin.sendEvent("success_convertMusic");
        return VoiceResult(requestId: requestId);
      } else if (response.statusCode == 429) {
        throw (Exception(
            "You are creating to fast, please try again after a few minutes"));
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      dev.log(e.toString());
      AIKits().analysisMixin.sendEvent("error_convertMusic");
      rethrow;
    }
  }

  Future<String?> getInstrumentalUrl({
    required shortid,
  }) async {
    try {
      dev.log('getInstrumentalUrl: $shortid');

      final response = await Dio().post(
        "${_config.renderApiConfig.hostUrl}/instrumentalUrl",
        data: {"shortid": shortid},
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers,
        ),
      );
      if (response.statusCode == 200) {
        final result = response.data["instrumentalUrl"];
        dev.log(result.toString());
        AIKits().analysisMixin.sendEvent("success_getInstrumentalUrl");
        return result;
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      dev.log(e.toString());
      AIKits().analysisMixin.sendEvent("error_getInstrumentalUrl");
      return null;
    }
  }

  Future<String?> getConvertedUrl({
    required shortid,
  }) async {
    try {
      dev.log('getConvertedUrl: $shortid');

      final response = await Dio().post(
        "${_config.renderApiConfig.hostUrl}/convertedUrl",
        data: {"shortid": shortid},
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers,
        ),
      );
      if (response.statusCode == 200) {
        final result = response.data["convertedUrl"];
        dev.log(result.toString());
        AIKits().analysisMixin.sendEvent("success_getConvertedUrl");
        return result;
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      dev.log(e.toString());
      AIKits().analysisMixin.sendEvent("error_getConvertedUrl");
      return null;
    }
  }

  Future<VoiceResult?> getMusic({
    required VoiceResult initialData,
  }) async {
    try {
      dev.log('getMusic: ${initialData.requestId}');

      final response = await Dio().post(
        "${_config.renderApiConfig.hostUrl}/info",
        data: {
          "request_id": initialData.requestId,
        },
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers,
        ),
      );
      if (response.statusCode == 200) {
        final result = VoiceResult.fromJson(response.data);
        dev.log(result.toJson().toString());
        AIKits().analysisMixin.sendEvent("success_getMusic");
        final updatedResult = initialData.copyWith(
          resultUrl: result.resultUrl,
          hasError: result.hasError,
          isCompleted: result.isCompleted,
          isConverted: result.isConverted,
          shortid: result.shortid,
        );
        return updatedResult;
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      dev.log(e.toString());
      AIKits().analysisMixin.sendEvent("error_getMusic");
      return null;
    }
  }

  Future<List<VoiceResult>> getNewMusicList({
    int offset = 0,
    int limit = 10,
  }) async {
    try {
      dev.log('getNewMusicList');

      final response = await Dio().get(
        "${_config.renderApiConfig.hostUrl}/new?offset=$offset&limit=$limit",
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers,
        ),
      );
      if (response.statusCode == 200) {
        final result = (response.data as List)
            .map((e) => VoiceResult.fromJson(e))
            .toList();
        AIKits().analysisMixin.sendEvent("success_getNewMusicList");
        return result;
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      dev.log(e.toString());
      return [];
    }
  }

  Future<int?> getAcapellaQueue() async {
    try {
      dev.log('getNewMusicList');

      final response = await Dio().get(
        "${_config.renderApiConfig.hostUrl}/getAcapellaQueue",
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers,
        ),
      );
      if (response.statusCode == 200) {
        final result = response.data["count"] as int;
        AIKits().analysisMixin.sendEvent("success_getAcapellaQueue");
        return result;
      }
      return null;
    } catch (e) {
      dev.log(e.toString());
      return null;
    }
  }

  Future<List<VoiceResult>> getAcapellaFeed({
    int offset = 0,
    int limit = 10,
  }) async {
    try {
      dev.log('getAcapellaFeed');

      final response = await Dio().get(
        "${_config.renderApiConfig.hostUrl}/feedAcapella?offset=$offset&limit=$limit",
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers,
        ),
      );
      if (response.statusCode == 200) {
        final result = (response.data as List)
            .map((e) => VoiceResult.fromJson(e))
            .toList();
        AIKits().analysisMixin.sendEvent("success_getAcapellaFeed");
        return result;
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      dev.log(e.toString());
      return [];
    }
  }

  Future<List<VoiceResult>> searchAcapella({
    int offset = 0,
    int limit = 10,
    required String search,
  }) async {
    try {
      dev.log('searchAcapella');

      final response = await Dio().get(
        "${_config.renderApiConfig.hostUrl}/searchAcapella?offset=$offset&limit=$limit&search=$search",
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers,
        ),
      );
      if (response.statusCode == 200) {
        final result = (response.data as List)
            .map((e) => VoiceResult.fromJson(e))
            .toList();
        AIKits().analysisMixin.sendEvent("success_searchAcapella");
        return result;
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      dev.log(e.toString());
      return [];
    }
  }

  Future<VoiceResult> createAcapellaRequest({
    required String youtubeAuthor,
    required String youtubeTitle,
    required String youtubeUrl,
    required String? youtubeThumbnail,
    required bool isPremium,
    String? firebaseMessagingToken,
    required String idToken,
  }) async {
    try {
      dev.log('createAcapellaRequest: $youtubeUrl');

      final requestId = _generateRandomUUID();
      final response = await Dio().post(
        "${_config.renderApiConfig.hostUrl}/createAcapella",
        data: {
          "firebase_messaging_token": firebaseMessagingToken,
          "is_premium": isPremium,
          "request_id": requestId,
          "key": "audio/${_generateRandomUUID()}.wav",
          "model": "acapella",
          "url": youtubeUrl,
          "youtube_title": youtubeTitle,
          "youtube_author": youtubeAuthor,
          "youtube_thumbnail": youtubeThumbnail,
        },
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers
            ..addAll({"id_token": idToken}),
        ),
      );
      if (response.statusCode == 200) {
        AIKits().analysisMixin.sendEvent("success_createAcapellaRequest");
        return VoiceResult(requestId: requestId);
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      dev.log(e.toString());
      AIKits().analysisMixin.sendEvent("error_createAcapellaRequest");
      rethrow;
    }
  }

  Future<VoiceResult?> getAcapellaResult({
    required VoiceResult initialData,
  }) async {
    try {
      dev.log('getAcapellaResult: ${initialData.requestId}');

      final response = await Dio().post(
        "${_config.renderApiConfig.hostUrl}/getAcapella",
        data: {
          "request_id": initialData.requestId,
        },
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.renderApiConfig.headers,
        ),
      );
      if (response.statusCode == 200) {
        final result = VoiceResult.fromJson(response.data);
        dev.log(result.toJson().toString());
        AIKits().analysisMixin.sendEvent("success_getAcapellaResult");
        final updatedResult = initialData.copyWith(
          resultUrl: result.resultUrl,
          hasError: result.hasError,
          isCompleted: result.isCompleted,
          isConverted: result.isConverted,
          shortid: result.shortid,
          subtitle: result.subtitle,
          hasErrorGeneratingSubtitle: result.hasErrorGeneratingSubtitle,
          lyric: result.lyric,
          likeCount: result.likeCount,
        );
        return updatedResult;
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      dev.log(e.toString());
      AIKits().analysisMixin.sendEvent("error_getAcapellaResult");
      return null;
    }
  }

  String _generateRandomUUID() {
    final random = Random.secure(); // Secure random number generator

    // Define the format of the string
    final format = [
      8, 4, 4, 4, 12 // Length of each segment in the UUID
    ];

    // Generate each segment of the UUID
    final segments = format.map((length) {
      final buffer = StringBuffer();
      for (var i = 0; i < length; i++) {
        final randInt =
            random.nextInt(16); // Generate a random hexadecimal digit (0-15)
        buffer.write(
            randInt.toRadixString(16)); // Convert to hexadecimal and append
      }
      return buffer.toString();
    });

    // Join the segments with dashes
    final uuid = segments.join('-');

    return uuid;
  }
}


// {
//     "s3URL": "https://imagecdn.voicify.ai/audio/4ff9db59-45d1-42ee-85c4-9f911dcb8380.wav",
//     "key": "audio/4ff9db59-45d1-42ee-85c4-9f911dcb8380.wav",
//     "free": false
// }


// {
//     "message": "Conversion retrieved successfully",
//     "conversion": {
//         "_id": "6516c39aa226dc75354c01bb",
//         "userid": "Ar8yXjTwlxdiYocu73aKe6AIaJJ3",
//         "status": "pending",
//         "info": {
//             "acapella": "extracting",
//             "model": "waiting"
//         },
//         "public": true,
//         "shortid": "arianagrande-NPJQZ79W",
//         "name": "",
//         "downloads": 0,
//         "toolMode": {
//             "isToolMode": false
//         },
//         "deleted": false,
//         "isFree": false,
//         "createdAt": "2023-09-29T12:31:22.594Z",
//         "user": {
//             "_id": "650db5487ffddae9dd9838b5",
//             "avatar": "https://imagecdn.voicify.ai/avatars/Ar8yXjTwlxdiYocu73aKe6AIaJJ3.png",
//             "username": "hmdduc96"
//         },
//         "model": {
//             "_id": "643a18089d08c77d6a39420c",
//             "artistname": "Ariana Grande",
//             "image": {
//                 "url": "https://imagecdn.voicify.ai/models/1e87fb74-7fd0-4eec-a16e-d5209b603759.png",
//                 "blurhash": "154, 117, 181"
//             },
//             "urlParam": "arianagrande",
//             "isCommunity": false
//         }
//     },
//     "queueLength": null
// }