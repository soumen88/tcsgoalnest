// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:objectbox/objectbox.dart' as _i1034;

import '../../objectbox.g.dart' as _i424;
import '../table/activity_store_manager.dart' as _i506;
import '../table/goal_store_manager.dart' as _i711;
import '../table/key_value_store_manager.dart' as _i722;
import '../table/person_store_manager.dart' as _i574;
import '../utils/logger_util.dart' as _i539;
import '../utils/pretty_logger_util.dart' as _i1008;
import 'database_module.dart' as _i384;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final databaseModule = _$DatabaseModule();
  await gh.singletonAsync<_i1034.Store>(
    () => databaseModule.openDbStore(),
    preResolve: true,
  );
  gh.singleton<_i539.LoggerUtil>(() => _i539.LoggerUtil());
  gh.singleton<_i1008.PrettyLoggerUtil>(() => _i1008.PrettyLoggerUtil());
  gh.lazySingleton<_i711.GoalStoreManager>(
    () => _i711.GoalStoreManager(gh<_i424.Store>()),
  );
  gh.lazySingleton<_i722.KeyValueStoreManager>(
    () => _i722.KeyValueStoreManager(gh<_i424.Store>()),
  );
  gh.lazySingleton<_i574.PersonStoreManager>(
    () => _i574.PersonStoreManager(gh<_i424.Store>()),
  );
  gh.lazySingleton<_i506.ActivityStoreManager>(
    () => _i506.ActivityStoreManager(gh<_i424.Store>()),
  );
  return getIt;
}

class _$DatabaseModule extends _i384.DatabaseModule {}
