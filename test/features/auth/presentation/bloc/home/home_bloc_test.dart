import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/auth/domain/entities/user_entity.dart';
import 'package:sport_circle/features/auth/domain/usecases/get_me_usecase.dart';
import 'package:sport_circle/core/storage/token_storage.dart';
import 'package:sport_circle/features/auth/presentation/bloc/home/home_bloc.dart';
import 'package:sport_circle/features/auth/presentation/bloc/home/home_event.dart';
import 'package:sport_circle/features/auth/presentation/bloc/home/home_state.dart';

class MockGetMeUseCase extends Mock implements GetMeUseCase {}

class MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  late MockGetMeUseCase mockGetMeUseCase;
  late MockTokenStorage mockTokenStorage;
  late HomeBloc bloc;

  const tUser = UserEntity(
    id: '310',
    name: 'Diky',
    email: 'drp@drp.com',
    role: 'user',
    token: 'abc123',
  );

  setUp(() {
    mockGetMeUseCase = MockGetMeUseCase();
    mockTokenStorage = MockTokenStorage();
    bloc = HomeBloc(mockGetMeUseCase, mockTokenStorage);
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is HomeInitial', () {
    expect(bloc.state, isA<HomeInitial>());
  });

  test('emits [HomeLoading, HomeLoaded] when getMe returns Right', () async {
    when(() => mockTokenStorage.getToken()).thenAnswer((_) async => 'abc123');
    when(
      () => mockGetMeUseCase(token: any(named: 'token')),
    ).thenAnswer((_) async => const Right(tUser));

    final future = expectLater(
      bloc.stream,
      emitsInOrder([isA<HomeLoading>(), isA<HomeLoaded>()]),
    );

    bloc.add(HomeFetchUser());
    await future;
  });

  test('emits [HomeLoading, HomeFailure] when getMe returns Left', () async {
    when(() => mockTokenStorage.getToken()).thenAnswer((_) async => 'abc123');
    when(
      () => mockGetMeUseCase(token: any(named: 'token')),
    ).thenAnswer((_) async => const Left(ServerFailure('Unauthorized')));

    final future = expectLater(
      bloc.stream,
      emitsInOrder([isA<HomeLoading>(), isA<HomeFailure>()]),
    );

    bloc.add(HomeFetchUser());
    await future;
  });

  test('emits [HomeLoading, HomeFailure] when token is null', () async {
    when(() => mockTokenStorage.getToken()).thenAnswer((_) async => null);

    final future = expectLater(
      bloc.stream,
      emitsInOrder([isA<HomeLoading>(), isA<HomeFailure>()]),
    );

    bloc.add(HomeFetchUser());
    await future;
  });

  test('emits [HomeLoggedOut] when logout is triggered', () async {
    when(() => mockTokenStorage.deleteToken()).thenAnswer((_) async {});

    final future = expectLater(
      bloc.stream,
      emitsInOrder([isA<HomeLoggedOut>()]),
    );

    bloc.add(HomeLogout());
    await future;
  });
}
