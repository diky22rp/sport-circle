class Logger {
  static void info(String message) {
    // Simple wrapper - change to use logging package if needed.
    // ignore: avoid_print
    print('[INFO] $message');
  }

  static void warn(String message) {
    // ignore: avoid_print
    print('[WARN] $message');
  }

  static void error(String message, [Object? error, StackTrace? st]) {
    // ignore: avoid_print
    print('[ERROR] $message');
    if (error != null) print('  $error');
    if (st != null) print(st);
  }
}
