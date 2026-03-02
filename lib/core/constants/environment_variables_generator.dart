import 'package:envied/envied.dart';

part 'environment_variables_generator.g.dart';

@Envied()
abstract class EnvironmentVariablesGenerator {
  @EnviedField(varName: 'OSM_KEY')
  static const String osmkey = _EnvironmentVariablesGenerator.osmkey;

  @EnviedField(varName: 'EMAIL_JS_PUBLIC_KEY')
  static const String emailJsPublicKey = _EnvironmentVariablesGenerator.emailJsPublicKey;

  @EnviedField(varName: 'EMAIL_JS_PRIVATE_KEY')
  static const String emailJsPrivateKey = _EnvironmentVariablesGenerator.emailJsPrivateKey;

  @EnviedField(varName: 'EMAIL_JS_SERVICE_KEY')
  static const String emailJsServiceKey = _EnvironmentVariablesGenerator.emailJsServiceKey;

  @EnviedField(varName: 'EMAIL_JS_TEMPLATE_KEY')
  static const String emailJsTemplateKey = _EnvironmentVariablesGenerator.emailJsTemplateKey;
}