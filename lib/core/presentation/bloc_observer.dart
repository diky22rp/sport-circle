import 'package:bloc/bloc.dart';
import 'package:sport_circle/core/utils/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    Logger.info('Bloc Event: ${bloc.runtimeType} -> $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    Logger.info('Bloc Change: ${bloc.runtimeType} -> $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Logger.info('Bloc Transition: ${bloc.runtimeType} -> $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger.error(
      'Bloc Error: ${bloc.runtimeType} -> $error',
      error,
      stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
