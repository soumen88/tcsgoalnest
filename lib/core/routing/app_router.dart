import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tcsgoalnest/ui/screens/person_singleton_db_insert_screen.dart';

import '../../ui/screens/display_common_widgets_screen.dart';
import '../../ui/screens/splash_screen.dart';
import '../../ui/screens/stream_example_screen.dart';
import '../../ui/screens/home_screen.dart';
import '../../ui/screens/person_singleton_db_insert_screen.dart';
import '../../ui/screens/person_singleton_db_read_screen.dart';
import '../../ui/screens/bottom_sheet_navigation_screen.dart';
import '../../ui/screens/features_screen.dart';
import '../../ui/screens/track_goals_screen.dart';
import '../../ui/screens/examples_screen.dart';
import '../../ui/screens/goal_tracker_screen.dart';


part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: SplashRoute.page,
        path: "/splash",
        //initial: true
    ),
    AutoRoute(
        page: DisplayCommonWidgetsRoute.page,
        path: "/commonwidgets",

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
        page: ExamplesRoute.page,
        path: "/examples"
    ),
    AutoRoute(
        page: BottomSheetNavigationRoute.page,
        path: '/bottomsheetpage',
        initial: true,
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
              page: TrackGoalsRoute.page,
              path: "trackGoals",
          ),
        ]
    ),
    AutoRoute(
        page: GoalTrackerRoute.page,
        path: "/goaltracker",
        //initial: true
    ),
  ];
}
