import 'package:flutter_test/flutter_test.dart';
import 'package:auth/data/data.dart';

import '../../helpers/default_models.dart';

void main() {
  const entity = UserEntity(
    id: "id",
    email: "john.doe@example.com",
    firstName: "John",
    lastName: "Doe",
  );

  group('object serialization and deserialization', () {
    test('fromJson, should correctly initialize from JSON', () {
      // Arrange
      final jsonMap = DefaultModels.userEntityJsonMap;

      // Act
      final result = UserEntity.fromJson(jsonMap);

      // Assert
      expect(result, equals(entity));
    });

    test('toJson, should return a json map containing proper data', () {
      /// act
      final result = entity.toJson();

      /// arrange
      final exceptedJson = DefaultModels.userEntityJsonMap;

      /// assert
      expect(result, equals(exceptedJson));
    });
  });
}
