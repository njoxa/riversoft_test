part of 'app_cubit.dart';

enum InitializationStatus { initial, loading, initialized }

@freezed
sealed class AppState with _$AppState {
  const AppState._();

  const factory AppState({
    @Default(InitializationStatus.initial) InitializationStatus initializationStatus,
  }) = _AppState;

  bool get isInitialized =>
      initializationStatus == InitializationStatus.initialized;

  bool get isNotInitialized =>
      initializationStatus == InitializationStatus.initial ||
      initializationStatus == InitializationStatus.loading;
}
