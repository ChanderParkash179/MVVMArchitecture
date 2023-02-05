import 'package:mvvm/Data/Exception/AppException.dart';

class InvalidInputExcepion extends AppExceptions {
  InvalidInputExcepion([String? message])
      : super(message, 'Invalid Input Request!');
}
