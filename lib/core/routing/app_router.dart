import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../ui/screens/display_common_widgets_screen.dart';
import '../../ui/screens/key_value_store_screen.dart';
import '../../ui/screens/person_crud_screen.dart';
import '../../ui/screens/splash_screen.dart';
import '../../ui/screens/stream_example_screen.dart';
import '../../ui/screens/home_screen.dart';


part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: SplashRoute.page,
        path: "/splash",
        initial: true
    ),
    AutoRoute(
        page: DisplayCommonWidgetsRoute.page,
        path: "/commonwidgets",

    ),
    AutoRoute(
        page: KeyValueStoreRoute.page,
        path: "/keyvaluestore",

    ),
    AutoRoute(
        page: StreamExampleRoute.page,
        path: "/streamexample"
    ),
    AutoRoute(
        page: HomeRoute.page,
        path: "/home"
    ),
    AutoRoute(
        page: PersonCrudRoute.page,
        path: "/person"
    ),
  ];
}
