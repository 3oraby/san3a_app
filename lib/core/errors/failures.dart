abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class CustomException extends Failure {
  const CustomException({String message = LocaleKeys.messagesFailuresUnexpectedError})
    : super(message);
}
