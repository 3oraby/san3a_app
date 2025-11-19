import 'package:san3a_app/core/constants/locale_keys.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class CustomException extends Failure {
  const CustomException({
    String message = LocaleKeys.messagesFailuresUnexpectedError,
  }) : super(message);
}

class ConnectionException extends Failure {
  const ConnectionException({
    String message =
        "No internet connection. Please check your connection and try again.",
  }) : super(message);
}
