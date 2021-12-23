import 'package:flutter/foundation.dart';

class ErrorInfo {
  final String? message;
  final int? code;
  final String? description;

  ErrorInfo({this.message = '', this.code, this.description = ''});
}
