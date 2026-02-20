class ApiConstants {
  ApiConstants._();

  static const String baseUrl =
      'https://sport-reservation-api-bootcamp.do.dibimbing.id';

  // Auth
  static const String login = '/api/v1/login';
  static const String register = '/api/v1/register';
  static const String me = '/api/v1/me';

  // Sport Categories
  static const String getSportCategory = '/api/v1/sport-categories';
  static const String createSportCategory = '/api/v1/sport-categories/create';
  static const String updateSportCategory = '/api/v1/sport-categories/update';
  static const String deleteSportCategory = '/api/v1/sport-categories/delete';
}
