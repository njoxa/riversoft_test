import 'package:flutter/material.dart';
import 'package:riversoft_test/src/ui/app.dart';
import 'package:riversoft_test/src/ui/app_bloc_provider.dart';
import 'package:riversoft_test/src/ui/app_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(AppProvider(child: AppBlocProvider(child: App())));
}
