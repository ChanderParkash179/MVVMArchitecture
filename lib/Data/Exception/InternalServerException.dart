import 'package:mvvm/Data/Exception/AppException.dart';

class InternalServerException extends AppExceptions {
  InternalServerException([String? message])
      : super(message, 'Internal Server Error!');
}
