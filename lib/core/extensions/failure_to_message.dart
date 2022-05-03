import 'package:billy/core/exceptions/failure.dart';

extension FailureToMessage on Failure {
  String get toMessage {
    switch (runtimeType) {
      default:
        return "unknownFailure";
    }
  }
}