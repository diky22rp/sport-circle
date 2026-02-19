import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';
import 'package:sport_circle/features/authentication/domain/usecases/login_usecase.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/login/login_event.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/login/login_state.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginBloc bloc;

  const tUser = UserEntity(
    id: '1',
    name: 'Test',
    email: 'a@a.com',
    token: 'abc',
  );

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    bloc = LoginBloc(mockLoginUseCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is LoginInitial', () {
    expect(bloc.state, isA<LoginInitial>());
  });

  test('emits [LoginFailure] when email is empty', () async {
    final future = expectLater(
      bloc.stream,
      emitsInOrder([isA<LoginFailure>()]),
    );

    bloc.add(const LoginSubmitted(email: '', password: 'pw'));
    await future;
  });

  test(
    'emits [LoginLoading, LoginSuccess] when usecase returns Right',
    () async {
      when(
        () => mockLoginUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => const Right(tUser));

      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<LoginLoading>(), isA<LoginSuccess>()]),
      );

      bloc.add(const LoginSubmitted(email: 'a@a.com', password: 'pw'));
      await future;
    },
  );

  test(
    'emits [LoginLoading, LoginFailure] when usecase returns Left',
    () async {
      when(
        () => mockLoginUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => const Left(ServerFailure('Invalid credentials')),
      );

      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<LoginLoading>(), isA<LoginFailure>()]),
      );

      bloc.add(const LoginSubmitted(email: 'a@a.com', password: 'wrong'));
      await future;
    },
  );
}
