import 'package:mvvm/Data/Exception/AppException.dart';

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, 'Error During Communication!');
}
