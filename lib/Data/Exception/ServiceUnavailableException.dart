import 'package:mvvm/Data/Exception/AppException.dart';

class ServiceUnavailableException extends AppExceptions {
  ServiceUnavailableException([String? message])
      : super(message, 'Service is not Available!');
}
