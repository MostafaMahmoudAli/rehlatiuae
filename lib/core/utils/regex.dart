abstract class AppValidator {
  static const emailRegex =
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
  static const phoneRegex = r'^[0-9,--+-]+$';
  static const numberRegex = r'^[0-9]+$';
  static const passwordRegex8CharactersInLength = r'^.{8,}';
  static const nameRegex = r'^[\u0600-\u06FFa-zA-Z\s]+$';

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(emailRegex).hasMatch(value)) {
      return 'The email is not valid';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (!RegExp(nameRegex).hasMatch(value)) {
      return 'Name is not valid';
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(numberRegex).hasMatch(value)) {
      return "it isn't number";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(phoneRegex).hasMatch(value)) {
      return "it isn't phone number";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!RegExp(passwordRegex8CharactersInLength).hasMatch(value)) {
      return 'It should be at least 8 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? pass) {
    if (value == null || value.isEmpty) {
      return 'Password confirmation is required';
    } else if (value != pass) {
      return 'There is no match';
    }
    return null;
  }

  static bool startsWithEnglishChar(String value) {
    RegExp englishCharRegex = RegExp(r'^[a-zA-Z0-9٠-٩]');
    return englishCharRegex.hasMatch(value);
  }

  static bool isOnlySpaces(String value) {
    return value.trim().isEmpty;
  }
}
