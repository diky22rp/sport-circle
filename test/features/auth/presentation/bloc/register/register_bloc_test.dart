import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/auth/domain/entities/user_entity.dart';
import 'package:sport_circle/features/auth/domain/usecases/register_usecase.dart';
import 'package:sport_circle/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:sport_circle/features/auth/presentation/bloc/register/register_event.dart';
import 'package:sport_circle/features/auth/presentation/bloc/register/register_state.dart';

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

void main() {
  late MockRegisterUseCase mockRegisterUseCase;
  late RegisterBloc bloc;

  const tUser = UserEntity(
    id: '2',
    name: 'New User',
    email: 'b@b.com',
    token: 'xyz',
  );

  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    bloc = RegisterBloc(mockRegisterUseCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is RegisterInitial', () {
    expect(bloc.state, isA<RegisterInitial>());
  });

  test('emits [RegisterFailure] when name is empty', () async {
    final future = expectLater(
      bloc.stream,
      emitsInOrder([isA<RegisterFailure>()]),
    );

    bloc.add(
      const RegisterSubmitted(
        name: '',
        email: 'b@b.com',
        password: 'pw',
        cPassword: 'pw',
      ),
    );
    await future;
  });

  test(
    'emits [RegisterLoading, RegisterSuccess] when usecase returns Right',
    () async {
      when(
        () => mockRegisterUseCase(
          name: any(named: 'name'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          cPassword: any(named: 'cPassword'),
          role: any(named: 'role'),
          phoneNumber: any(named: 'phoneNumber'),
        ),
      ).thenAnswer((_) async => const Right(tUser));

      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<RegisterLoading>(), isA<RegisterSuccess>()]),
      );

      bloc.add(
        const RegisterSubmitted(
          name: 'New User',
          email: 'b@b.com',
          password: 'pw',
          cPassword: 'pw',
        ),
      );
      await future;
    },
  );

  test(
    'emits [RegisterLoading, RegisterFailure] when usecase returns Left',
    () async {
      when(
        () => mockRegisterUseCase(
          name: any(named: 'name'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          cPassword: any(named: 'cPassword'),
          role: any(named: 'role'),
          phoneNumber: any(named: 'phoneNumber'),
        ),
      ).thenAnswer(
        (_) async => const Left(ServerFailure('Email sudah terdaftar')),
      );

      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<RegisterLoading>(), isA<RegisterFailure>()]),
      );

      bloc.add(
        const RegisterSubmitted(
          name: 'X',
          email: 'b@b.com',
          password: 'pw',
          cPassword: 'pw',
        ),
      );
      await future;
    },
  );

  test(
    'emits [RegisterFailure] when password and cPassword do not match',
    () async {
      final future = expectLater(
        bloc.stream,
        emitsInOrder([isA<RegisterFailure>()]),
      );

      bloc.add(
        const RegisterSubmitted(
          name: 'User',
          email: 'b@b.com',
          password: 'pw',
          cPassword: 'different',
        ),
      );
      await future;
    },
  );
}
