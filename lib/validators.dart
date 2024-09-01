import 'package:flutter/widgets.dart';

class Validators {
  static FormFieldValidator<String> required(String errorMessage) {
    return (value) {
      if (value!.isEmpty) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> min(double min, String errorMessage) {
    return (value) {
      if (value == '.' || value == '-' || value == '-.') {
        value = '0';
      }
      if (value!.startsWith('.-')) return 'Invalid pattern of numberic!';
      if (value.trim().isEmpty) {
        return null;
      } else {
        final dValue = double.parse(value);
        if (dValue < min) {
          return errorMessage;
        } else {
          return null;
        }
      }
    };
  }

  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
