import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tcsgoalnest/ui/screens/person_singleton_db_insert_screen.dart';

import '../../ui/screens/display_common_widgets_screen.dart';
import '../../ui/screens/key_value_store_screen.dart';
import '../../ui/screens/splash_screen.dart';
import '../../ui/screens/stream_example_screen.dart';
import '../../ui/screens/home_screen.dart';
import '../../ui/screens/person_singleton_db_insert_screen.dart';
import '../../ui/screens/person_singleton_db_read_screen.dart';
import '../../ui/screens/bottom_sheet_navigation_screen.dart';
import '../../ui/screens/features_screen.dart';
import '../../ui/screens/track_screen.dart';


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
        page: PersonSingletonDbInsertRoute.page,
        path: "/personInsert"
    ),
    AutoRoute(
        page: PersonSingletonDbReadRoute.page,
        path: "/personRead"
    ),
    AutoRoute(
        page: BottomSheetNavigationRoute.page,
        path: '/bottomsheetpage',
        children: [
          AutoRoute(
            page: FeaturesRoute.page,
            path: "features"
          ),
          AutoRoute(
              page: HomeRoute.page,
              path: "home"
          ),
          AutoRoute(
              page: TrackRoute.page,
              path: "tracker"
          ),
        ]
    )
  ];
}
