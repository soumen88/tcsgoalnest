import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';

class AppLinksHandler {
  static final AppLinks _appLinks = AppLinks();
  static StreamSubscription<Uri>? _linkSubscription;
  /// Initialize deep link handling
  /// Call this once when your app starts
  static Future<void> init(BuildContext context) async {
    // Handle the link that opened the app (cold start)
    try {
      final initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        _handleDeepLink(context, initialLink);
      }
    } catch (e) {
      debugPrint('Error getting initial link: $e');
    }
    // Handle links while the app is running (warm start / foreground)
    _linkSubscription = _appLinks.uriLinkStream.listen(
          (Uri uri) {
        _handleDeepLink(context, uri);
      },
      onError: (error) {
        debugPrint('Error listening to link stream: $error');
      },
    );
  }
  /// Parse and route the deep link to the appropriate screen
  static void _handleDeepLink(BuildContext context, Uri uri) {
    debugPrint('Received deep link: $uri');
    // Extract the path and query parameters
    final path = uri.path;
    final queryParams = uri.queryParameters;
    // Route based on the path
    if (path == '/profile') {
      // Navigate to profile screen
      Navigator.pushNamed(context, '/profile');

    } else if (path.startsWith('/product/')) {
      // Extract product ID from path
      final productId = path.replaceFirst('/product/', '');
      Navigator.pushNamed(
        context,
        '/product',
        arguments: {'id': productId},
      );

    } else if (path == '/promo') {
      // Handle promo links with query parameters
      final promoCode = queryParams['code'];
      if (promoCode != null) {
        Navigator.pushNamed(
          context,
          '/promo',
          arguments: {'code': promoCode},
        );
      }

    } else {
      // Unknown link, navigate to home
      Navigator.pushNamed(context, '/');
    }
  }
  /// Clean up when the app is disposed
  static void dispose() {
    _linkSubscription?.cancel();
  }
}