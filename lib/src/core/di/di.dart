import 'di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final sl = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() => sl.init();
