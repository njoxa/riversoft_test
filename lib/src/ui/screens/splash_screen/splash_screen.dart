import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riversoft_test/src/bloc/bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:riversoft_test/src/utils/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String path = '/';
  static const String name = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();

    // Setup for the pulsating animation
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _init();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _init() async {
    await context.read<LocalStorage>().init();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    if (!mounted) return;

    await context.read<AppCubit>().init();

    if (!mounted) return;
  }

  void _navigateToHome() {
    if (!mounted) return;

    Navigator.of(context).pushReplacementNamed('/match-list');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (BuildContext context, AppState state) {
        if (state.initializationStatus != InitializationStatus.initialized) return;

        _navigateToHome();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              ScaleTransition(
                scale: _scaleAnimation,
                child: Icon(Icons.sports_soccer, size: 200, color: context.colorScheme.primary),
              ),
              const Spacer(),
              const CircularProgressIndicator(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
