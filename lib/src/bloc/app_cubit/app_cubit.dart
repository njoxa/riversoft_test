import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  Future<void> startLoading() async {
    emit(state.copyWith(initializationStatus: InitializationStatus.loading));
  }

  Future<void> init() async {
    if (state.isInitialized) return;

    await startLoading();

    // Mock initialization for demo
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(initializationStatus: InitializationStatus.initialized));
  }
}
