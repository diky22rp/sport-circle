import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';
import 'package:sport_circle/features/authentication/domain/usecases/check_token_usecase.dart';
import 'package:sport_circle/features/authentication/domain/usecases/get_me_usecase.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_event.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_state.dart';

class MockGetMeUseCase extends Mock implements GetMeUseCase {}

class MockCheckTokenUseCase extends Mock implements CheckTokenUseCase {}

void main() {
  late MockGetMeUseCase mockGetMeUseCase;
  late MockCheckTokenUseCase mockCheckTokenUseCase;
  late AuthenticationBloc bloc;

  const tUser = UserEntity(
    id: '310',
    name: 'Diky',
    email: 'drp@drp.com',
    role: 'user',
    token: 'abc123',
  );

  setUp(() {
    mockGetMeUseCase = MockGetMeUseCase();
    mockCheckTokenUseCase = MockCheckTokenUseCase();
    bloc = AuthenticationBloc(mockGetMeUseCase, mockCheckTokenUseCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is AuthenticationInitial', () {
    expect(bloc.state, isA<AuthenticationState>());
  });

  test(
    'emits [AuthenticationLoading, AuthenticationLoaded] when getMe returns Right',
    () async {
      when(
        () => mockGetMeUseCase(),
      ).thenAnswer((_) async => const Right(tUser));
      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<AuthenticationState>(), isA<AuthenticationState>()]),
      );
      bloc.add(const AuthenticationEvent.fetchUser());
      await future;
    },
  );

  test(
    'emits [AuthenticationLoading, AuthenticationFailure] when getMe returns Left',
    () async {
      when(
        () => mockGetMeUseCase(),
      ).thenAnswer((_) async => const Left(ServerFailure('Unauthorized')));
      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<AuthenticationState>(), isA<AuthenticationState>()]),
      );
      bloc.add(const AuthenticationEvent.fetchUser());
      await future;
    },
  );

  test(
    'emits [AuthenticationLoading, AuthenticationAuthenticated] when token exists',
    () async {
      when(() => mockCheckTokenUseCase()).thenAnswer((_) async => true);
      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<AuthenticationState>(), isA<AuthenticationState>()]),
      );
      bloc.add(const AuthenticationEvent.checkToken());
      await future;
    },
  );

  test(
    'emits [AuthenticationLoading, AuthenticationUnauthenticated] when token does not exist',
    () async {
      when(() => mockCheckTokenUseCase()).thenAnswer((_) async => false);
      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<AuthenticationState>(), isA<AuthenticationState>()]),
      );
      bloc.add(const AuthenticationEvent.checkToken());
      await future;
    },
  );

  test('emits [AuthenticationLoggedOut] when logout is triggered', () async {
    final future = expectLater(
      bloc.stream,
      emitsInOrder([isA<AuthenticationState>()]),
    );
    bloc.add(const AuthenticationEvent.logout());
    await future;
  });
}
