import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/di/di_setup.config.dart';

/// GetIt instance
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)

/// Configure dependencies
Future<void> configureDependencies({String env = Environment.dev}) async =>
    init(getIt, environment: env);
