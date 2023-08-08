extension ExtensionString on String {
  T toEnum<T>(List<T> enumValues) {
    for (T enumValue in enumValues) {
      if (enumValue.toString() == this) {
        return enumValue;
      }
    }
    throw Exception('Invalid enum value: $this');
  }
}
