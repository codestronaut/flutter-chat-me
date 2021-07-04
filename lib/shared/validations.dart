class Validations {
  static String? validatePassword(String password) {
    String number = r'^(?=.*?[0-9]+.*)';
    String alphabet = r'(?=.*?[a-zA-Z]+.*)';
    String character = r'(?=.*?[!@#\$&*~]+.*)';
    RegExp regex = new RegExp(number);

    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    } else {
      if (!regex.hasMatch(password)) {
        return 'Password must contain numbers';
      } else {
        regex = new RegExp(alphabet);
        if (!regex.hasMatch(password)) {
          return 'Password must contain alphabets';
        } else {
          regex = new RegExp(character);
          if (!regex.hasMatch(password)) {
            return 'Password must contain special character';
          }
          return null;
        }
      }
    }
  }

  static String? validateNotEmpty(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }
}
