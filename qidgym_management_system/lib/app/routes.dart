import 'package:flutter/material.dart';

import '../ui/screens/booking/booking_moderator_screen.dart';

class Routes {
  static const String bookingModerator = '/booking_moderator';

  static Route<dynamic>? createRoute(settings) {
    switch (settings.name) {
      case bookingModerator:
        return BookingModeratorScreen.route();
    }
    return null;
  }
}
