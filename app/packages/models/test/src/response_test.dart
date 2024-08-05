import 'dart:convert' as convert;

import 'package:flutter_test/flutter_test.dart';
import 'package:models/models.dart';

void main() {
  group('Response', () {
    const responseData = {
      "statusCode": 200,
      "success": true,
    };

    const responseFailure = {
      "statusCode": 404,
      "success": false,
      "message": "failed",
    };

    test('initializes correctly from Map', () {
      final success = Response.fromMap(responseData);
      final failure = Response.fromMap(responseFailure);

      expect(success, isNotNull);
      expect(failure, isNotNull);
    });

    test('initializes correctly from json', () {
      final success = Response.fromJson(convert.jsonEncode(responseData));
      final failure = Response.fromJson(convert.jsonEncode(responseFailure));

      expect(success, isNotNull);
      expect(failure, isNotNull);
    });

    test('initializes correct subclass', () {
      final success = Response.fromJson(convert.jsonEncode(responseData));
      final failure = Response.fromJson(convert.jsonEncode(responseFailure));

      expect(success, isA<ResponseSuccess>());
      expect(failure, isA<ResponseFailure>());
    });
  });

  group('ResponseSuccess', () {});

  group('ResponseFailure', () {});
}
