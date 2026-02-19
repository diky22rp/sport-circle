class Validators {
  static String? validateNotEmpty(String value, String fieldName) {
    if (value.trim().isEmpty) {
      return '$fieldName harus diisi';
    }
    return null;
  }

  static String? validateEmail(String value) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Email tidak valid';
    }
    return null;
  }

  static String? validatePasswordMatch(
    String password,
    String confirmPassword,
  ) {
    if (password != confirmPassword) {
      return 'Password dan konfirmasi password tidak sama';
    }
    return null;
  }
}
