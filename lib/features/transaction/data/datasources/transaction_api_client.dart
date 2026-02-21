import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sport_circle/core/constants/api_constants.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/transaction/data/models/transaction_model.dart';

part 'transaction_api_client.g.dart';

// TransactionApiClient defines transaction-related API endpoints.
@RestApi()
abstract class TransactionApiClient {
  // Factory required by Retrofit for code generation.
  factory TransactionApiClient(Dio dio, {String baseUrl}) =
      _TransactionApiClient;

  //create transaction /api/v1/transaction/create
  @POST(ApiConstants.createTransaction)
  Future<ApiResponseModel<dynamic>> createTransaction({
    @Header('Authorization') required String token,
    @Body() required Map<String, dynamic> body,
  });

  //get my transactions my-transaction
  @GET(ApiConstants.getMyTransactions)
  Future<ApiResponseModel<dynamic>> getMyTransactions({
    @Header('Authorization') required String token,
    @Query('is_paginate') bool isPaginate = true,
    @Query('per_page') int perPage = 10,
    @Query('page') int page = 1,
  });

  //get transaction by id /api/v1/transaction/{id}
  @GET(ApiConstants.getTransactionById)
  Future<ApiResponseModel<TransactionModel>> getTransactionById({
    @Header('Authorization') required String token,
    @Path('id') required int id,
  });

  //update transaction /api/v1/transaction/update-status/13
  @POST(ApiConstants.updateTransaction)
  Future<ApiResponseModel> updateTransaction({
    @Header('Authorization') required String token,
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  //upload proof payment /api/v1/transaction/update-proof-payment/13
  @POST(ApiConstants.uploadProofPayment)
  Future<ApiResponseModel> uploadProofPayment({
    @Header('Authorization') required String token,
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  //cancel transaction /api/v1/transaction/cancel/14
  @POST(ApiConstants.cancelTransaction)
  Future<ApiResponseModel> cancelTransaction({
    @Header('Authorization') required String token,
    @Path('id') required int id,
  });
}
