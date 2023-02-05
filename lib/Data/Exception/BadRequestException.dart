import 'package:mvvm/Data/Exception/AppException.dart';

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid Request!');
}
