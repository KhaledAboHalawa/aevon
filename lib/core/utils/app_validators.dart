class AppValidators {
  static final RegExp _email = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  static final RegExp _password = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
  );

  static String? isValidName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }else if (value.length > 20) {
      return 'Name must be less than 20 characters';
    }else if(value.contains(RegExp(r'[0-9]'))){
      return 'Name must not contain numbers';
    }
    return null;
  }

  static String? isValidEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!_email.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? isValidPassword(String? value) {
    if ( value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!_password.hasMatch(value)) {
      return 'Invalid password';
    }
    return null;
  }

  static String? isValidConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    } else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
