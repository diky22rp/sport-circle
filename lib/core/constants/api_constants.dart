class ApiConstants {
  ApiConstants._();

  static const String baseUrl =
      'https://sport-reservation-api-bootcamp.do.dibimbing.id';

  // Auth
  static const String login = '/api/v1/login';
  static const String register = '/api/v1/register';
  static const String me = '/api/v1/me';
  static const String updateUser = '/api/v1/update-user';

  // Sport Categories
  static const String getSportCategory = '/api/v1/sport-categories';
  static const String createSportCategory = '/api/v1/sport-categories/create';
  static const String updateSportCategory = '/api/v1/sport-categories/update';
  static const String deleteSportCategory = '/api/v1/sport-categories/delete';

  // Sport Activities
  static const String activities = '/api/v1/sport-activities';
  static const String createActivity = '/api/v1/sport-activities/create';
  static const String updateActivity = '/api/v1/sport-activities/update';
  static const String deleteActivity = '/api/v1/sport-activities/delete';

  // Transactions
  static const String createTransaction = '/api/v1/transaction/create';
  static const String getMyTransactions = '/api/v1/my-transaction';
  static const String getTransactionById = '/api/v1/transaction/{id}';
  static const String updateTransaction =
      '/api/v1/transaction/update-status/{id}';
  static const String uploadProofPayment =
      '/api/v1/transaction/update-proof-payment/{id}';
  static const String cancelTransaction = '/api/v1/transaction/cancel/{id}';
}
