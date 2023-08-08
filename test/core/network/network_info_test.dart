import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:auth/core/core.dart';

import '../../helpers/test_mock.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockConnectionChecker;

  setUp(() {
    //initializes the variables
    mockConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockConnectionChecker);
  });

  group("isConnected", () {
    // Mock data
    test("should forward the call to InternetConnectionChecker.hasConnection",
        () async {
      final tHasConnectionFuture = await Future.value(true);

      // Arrange
      when(mockConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, tHasConnectionFuture);
      verify(mockConnectionChecker.hasConnection);
      verifyNoMoreInteractions(mockConnectionChecker);
    });
  });
}
