class AppValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Jangan Lupa isi emailnya!';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Format emailnya salah nih!';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Passwordnya diisi dulu ya!';
    }

    if (value.length < 8) {
      return 'Passwordnya minimal 8 karakter, biar aman!';
    }

    bool hasLetter = value.contains(RegExp(r'[a-zA-Z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));

    if (!hasLetter || !hasDigit) {
      return 'Passwordnya harus ada huruf dan angkanya, biar kuat!';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi ya!';
    }
    if (value.length < 3) {
      return 'Nama harus minimal 3 karakter!';
    }
    return null;
  }
}
