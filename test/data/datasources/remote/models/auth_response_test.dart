import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:auth/data/data.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';

void main() {
  const authResponse = AuthResponse(idToken: 'QpwL5tke4Pnpja7X4');

  group('AuthResponse', () {
    test('fromJson, should correctly initialize from JSON', () {
      // Arrange
      final jsonMap = json.decode(jsonReader(successLoginPath));

      // Act
      final result = AuthResponse.fromJson(jsonMap);

      // Assert
      expect(result, equals(authResponse));
    });

    test('toJson, should return a json map containing proper data', () {
      /// act
      final result = authResponse.toJson();

      /// arrange
      final exceptedJson = json.decode(jsonReader(successLoginPath));

      /// assert
      expect(result, equals(exceptedJson));
    });
  });
}
