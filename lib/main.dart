import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:izhar_test/app.dart';
import 'package:izhar_test/di/injection.dart';
import 'package:izhar_test/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.instance.init();
  injectDependencies();
  runApp(const App());
}