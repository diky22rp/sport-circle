import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:sport_circle/features/transaction/data/datasources/remote/transaction_remote_data_source.dart';
import 'package:sport_circle/features/transaction/domain/entities/paginated_transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/repositories/transaction_repository.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  TransactionRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, PaginatedTransactionEntity>> getMyTransactions({
    bool isPaginate = true,
    int perPage = 10,
    int page = 1,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null) return Left(ServerFailure('No token'));
      final bearerToken = 'Bearer $token';
      final response = await _remoteDataSource.getTransactions(
        token: bearerToken,
        isPaginate: isPaginate,
        perPage: perPage,
        page: page,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> getTransactionById({
    required int id,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null) return Left(ServerFailure('No token'));
      final bearerToken = 'Bearer $token';
      final response = await _remoteDataSource.getTransactionById(
        token: bearerToken,
        id: id,
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> createTransaction({
    required int sportActivityId,
    required int paymentMethodId,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null) return Left(ServerFailure('No token'));
      final bearerToken = 'Bearer $token';
      final response = await _remoteDataSource.createTransaction(
        token: bearerToken,
        sportActivityId: sportActivityId,
        paymentMethodId: paymentMethodId,
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> updateTransaction({
    required int id,
    required String status,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null) return Left(ServerFailure('No token'));
      final bearerToken = 'Bearer $token';
      // TODO: Pastikan remoteDataSource.updateTransaction return TransactionModel
      final response = await _remoteDataSource.updateTransaction(
        token: bearerToken,
        id: id,
        status: status,
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> uploadProofPayment({
    required int id,
    required String proofPaymentUrl,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null) return Left(ServerFailure('No token'));
      final bearerToken = 'Bearer $token';
      await _remoteDataSource.uploadProofPayment(
        token: bearerToken,
        id: id,
        proofPaymentUrl: proofPaymentUrl,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelTransaction({required int id}) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null) return Left(ServerFailure('No token'));
      final bearerToken = 'Bearer $token';
      await _remoteDataSource.cancelTransaction(token: bearerToken, id: id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
