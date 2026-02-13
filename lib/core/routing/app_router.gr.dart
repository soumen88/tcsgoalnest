// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BottomSheetNavigationScreen]
class BottomSheetNavigationRoute extends PageRouteInfo<void> {
  const BottomSheetNavigationRoute({List<PageRouteInfo>? children})
    : super(BottomSheetNavigationRoute.name, initialChildren: children);

  static const String name = 'BottomSheetNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return BottomSheetNavigationScreen();
    },
  );
}

/// generated route for
/// [DisplayCommonWidgetsScreen]
class DisplayCommonWidgetsRoute extends PageRouteInfo<void> {
  const DisplayCommonWidgetsRoute({List<PageRouteInfo>? children})
    : super(DisplayCommonWidgetsRoute.name, initialChildren: children);

  static const String name = 'DisplayCommonWidgetsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return DisplayCommonWidgetsScreen();
    },
  );
}

/// generated route for
/// [ExamplesScreen]
class ExamplesRoute extends PageRouteInfo<void> {
  const ExamplesRoute({List<PageRouteInfo>? children})
    : super(ExamplesRoute.name, initialChildren: children);

  static const String name = 'ExamplesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExamplesScreen();
    },
  );
}

/// generated route for
/// [FeaturesScreen]
class FeaturesRoute extends PageRouteInfo<void> {
  const FeaturesRoute({List<PageRouteInfo>? children})
    : super(FeaturesRoute.name, initialChildren: children);

  static const String name = 'FeaturesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return FeaturesScreen();
    },
  );
}

/// generated route for
/// [GoalTrackerScreen]
class GoalTrackerRoute extends PageRouteInfo<void> {
  const GoalTrackerRoute({List<PageRouteInfo>? children})
    : super(GoalTrackerRoute.name, initialChildren: children);

  static const String name = 'GoalTrackerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return GoalTrackerScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return HomeScreen();
    },
  );
}

/// generated route for
/// [MethodChannelScreen]
class MethodChannelRoute extends PageRouteInfo<void> {
  const MethodChannelRoute({List<PageRouteInfo>? children})
    : super(MethodChannelRoute.name, initialChildren: children);

  static const String name = 'MethodChannelRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MethodChannelScreen();
    },
  );
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnBoardingScreen();
    },
  );
}

/// generated route for
/// [PersonSingletonDbInsertScreen]
class PersonSingletonDbInsertRoute extends PageRouteInfo<void> {
  const PersonSingletonDbInsertRoute({List<PageRouteInfo>? children})
    : super(PersonSingletonDbInsertRoute.name, initialChildren: children);

  static const String name = 'PersonSingletonDbInsertRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return PersonSingletonDbInsertScreen();
    },
  );
}

/// generated route for
/// [PersonSingletonDbReadScreen]
class PersonSingletonDbReadRoute extends PageRouteInfo<void> {
  const PersonSingletonDbReadRoute({List<PageRouteInfo>? children})
    : super(PersonSingletonDbReadRoute.name, initialChildren: children);

  static const String name = 'PersonSingletonDbReadRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return PersonSingletonDbReadScreen();
    },
  );
}

/// generated route for
/// [ProductDescriptionScreen]
class ProductDescriptionRoute
    extends PageRouteInfo<ProductDescriptionRouteArgs> {
  ProductDescriptionRoute({
    Key? key,
    required ProductDataModel productDataModel,
    List<PageRouteInfo>? children,
  }) : super(
         ProductDescriptionRoute.name,
         args: ProductDescriptionRouteArgs(
           key: key,
           productDataModel: productDataModel,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductDescriptionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDescriptionRouteArgs>();
      return ProductDescriptionScreen(
        key: args.key,
        productDataModel: args.productDataModel,
      );
    },
  );
}

class ProductDescriptionRouteArgs {
  const ProductDescriptionRouteArgs({this.key, required this.productDataModel});

  final Key? key;

  final ProductDataModel productDataModel;

  @override
  String toString() {
    return 'ProductDescriptionRouteArgs{key: $key, productDataModel: $productDataModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDescriptionRouteArgs) return false;
    return key == other.key && productDataModel == other.productDataModel;
  }

  @override
  int get hashCode => key.hashCode ^ productDataModel.hashCode;
}

/// generated route for
/// [ProductListHomeScreen]
class ProductListHomeRoute extends PageRouteInfo<ProductListHomeRouteArgs> {
  ProductListHomeRoute({
    required OnBoardingEnum onBoardType,
    List<PageRouteInfo>? children,
  }) : super(
         ProductListHomeRoute.name,
         args: ProductListHomeRouteArgs(onBoardType: onBoardType),
         initialChildren: children,
       );

  static const String name = 'ProductListHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductListHomeRouteArgs>();
      return ProductListHomeScreen(onBoardType: args.onBoardType);
    },
  );
}

class ProductListHomeRouteArgs {
  const ProductListHomeRouteArgs({required this.onBoardType});

  final OnBoardingEnum onBoardType;

  @override
  String toString() {
    return 'ProductListHomeRouteArgs{onBoardType: $onBoardType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductListHomeRouteArgs) return false;
    return onBoardType == other.onBoardType;
  }

  @override
  int get hashCode => onBoardType.hashCode;
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [StreamExampleScreen]
class StreamExampleRoute extends PageRouteInfo<void> {
  const StreamExampleRoute({List<PageRouteInfo>? children})
    : super(StreamExampleRoute.name, initialChildren: children);

  static const String name = 'StreamExampleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return StreamExampleScreen();
    },
  );
}

/// generated route for
/// [TrackGoalsScreen]
class TrackGoalsRoute extends PageRouteInfo<void> {
  const TrackGoalsRoute({List<PageRouteInfo>? children})
    : super(TrackGoalsRoute.name, initialChildren: children);

  static const String name = 'TrackGoalsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return TrackGoalsScreen();
    },
  );
}
