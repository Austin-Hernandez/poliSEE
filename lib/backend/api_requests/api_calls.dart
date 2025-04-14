import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GoogleCivicAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Civic API',
      apiUrl:
          'https://www.googleapis.com/civicinfo/v2/elections?key=AIzaSyCVPEM7AV3JafkCxGMSkSLI3kpZR0Uu3Zg',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetElectionsCall {
  static Future<ApiCallResponse> call({
    List<String>? keyList,
  }) async {
    final key = _serializeList(keyList);

    return ApiManager.instance.makeApiCall(
      callName: 'GetElections',
      apiUrl:
          'https://www.googleapis.com/civicinfo/v2/elections?key=AIzaSyCVPEM7AV3JafkCxGMSkSLI3kpZR0Uu3Zg',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? electionName(dynamic response) => (getJsonField(
        response,
        r'''$.elections[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? electionDay(dynamic response) => (getJsonField(
        response,
        r'''$.elections[:].electionDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? odcDivisionID(dynamic response) => (getJsonField(
        response,
        r'''$.elections[:].ocdDivisionId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RepresentativeInfoByDivisionCall {
  static Future<ApiCallResponse> call({
    List<String>? keyList,
    List<String>? ocdIdList,
  }) async {
    final key = _serializeList(keyList);
    final ocdId = _serializeList(ocdIdList);

    return ApiManager.instance.makeApiCall(
      callName: 'representativeInfoByDivision',
      apiUrl:
          'https://www.googleapis.com/civicinfo/v2/representatives?address=Providence,RI&key=AIzaSyCVPEM7AV3JafkCxGMSkSLI3kpZR0Uu3Zg',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? officialName(dynamic response) => (getJsonField(
        response,
        r'''$.officials[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RepresentativeInfoByDivisionCopyCall {
  static Future<ApiCallResponse> call({
    List<String>? keyList,
    List<String>? ocdIdList,
  }) async {
    final key = _serializeList(keyList);
    final ocdId = _serializeList(ocdIdList);

    return ApiManager.instance.makeApiCall(
      callName: 'representativeInfoByDivision Copy',
      apiUrl:
          'https://www.googleapis.com/civicinfo/v2/representatives?address=RI&key=AIzaSyCVPEM7AV3JafkCxGMSkSLI3kpZR0Uu3Zg',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GNewsCall {
  static Future<ApiCallResponse> call({
    String? q = 'Obama',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GNews',
      apiUrl:
          'https://gnews.io/api/v4/search?q=example&apikey=f1204ce3d1810f65d74b231098a6862b',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
        'lang': "en",
        'country': "us",
        'max': "5",
        'in': "title, description",
        'nullable': "none",
        'sortBy': "publishedAt",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? articles(dynamic response) => (getJsonField(
        response,
        r'''$.articles[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
