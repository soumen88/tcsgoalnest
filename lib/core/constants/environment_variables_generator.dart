import 'package:envied/envied.dart';

part 'environment_variables_generator.g.dart';

@Envied()
abstract class EnvironmentVariablesGenerator {
  @EnviedField(varName: 'OSM_KEY')
  static const String osmkey = _EnvironmentVariablesGenerator.osmkey;
}