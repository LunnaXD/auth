import 'button_status.dart';

enum FormStatus {
  /// The form has not been touched.
  pure,

  /// The form has been completely validated.
  valid,

  /// The form contains one or more invalid inputs.
  invalid,

  /// The form is in the process of being submitted.
  submissionInProgress,

  /// The form has been submitted successfully.
  submissionSuccess,

  /// The form submission failed.
  submissionFailure,

  /// The form submission has been canceled.
  submissionCanceled
}

extension FormStatusExtension on FormStatus {
  bool get isPure => this == FormStatus.pure;

  bool get isValid => this == FormStatus.valid;

  bool get isInvalid => this == FormStatus.invalid;

  bool get isSubmissionInProgress => this == FormStatus.submissionInProgress;

  bool get isSubmissionSuccess => this == FormStatus.submissionSuccess;

  bool get isSubmissionFailure => this == FormStatus.submissionFailure;

  bool get isSubmissionCanceled => this == FormStatus.submissionCanceled;

  bool get formEnabled => !isSubmissionInProgress && !isSubmissionSuccess;

  ButtonStatus get toButtonStatus {
    switch (this) {
      case FormStatus.pure:
      case FormStatus.valid:
      case FormStatus.invalid:
        return ButtonStatus.enabled;
      case FormStatus.submissionInProgress:
        return ButtonStatus.inProgress;
      case FormStatus.submissionSuccess:
        return ButtonStatus.success;
      case FormStatus.submissionFailure:
      case FormStatus.submissionCanceled:
        return ButtonStatus.enabled;
    }
  }
}
