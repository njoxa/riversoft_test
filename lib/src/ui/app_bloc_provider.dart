import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riversoft_test/src/bloc/bloc.dart';

class AppBlocProvider extends StatefulWidget {
  const AppBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  State<AppBlocProvider> createState() => _AppBlocProviderState();
}

class _AppBlocProviderState extends State<AppBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AppCubit())],
      child: Builder(
        builder: (context) {
          return widget.child;
        },
      ),
    );
  }
}
