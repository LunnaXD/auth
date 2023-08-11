enum FieldStatus {
  /// The field has not been touched.
  pure,

  /// The field is in the process of being loaded.
  loadInProgress,

  /// The field has been loaded successfully.
  loadSuccess,

  /// The field load failed.
  loadFailure,
}

extension FieldStatusExtension on FieldStatus {
  bool get isPure => this == FieldStatus.pure;

  bool get isLoadInProgress => this == FieldStatus.loadInProgress;

  bool get isLoadSuccess => this == FieldStatus.loadSuccess;

  bool get isLoadFailure => this == FieldStatus.loadFailure;

  bool get fieldEnabled => !isLoadInProgress && !isLoadFailure;
}
