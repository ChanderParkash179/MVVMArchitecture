import 'package:mvvm/Data/Exception/AppException.dart';

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
      : super(message, 'UnAuthorized Request!');
}
