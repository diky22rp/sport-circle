class UnauthenticatedException implements Exception {
  final String message;
  UnauthenticatedException([this.message = 'User is unauthenticated.']);

  @override
  String toString() => 'UnauthenticatedException: $message';
}
