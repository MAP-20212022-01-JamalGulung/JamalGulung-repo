import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:qidgym_management_system/ui/screens/home/home.dart';
import 'package:qidgym_management_system/ui/screens/booking/booking.dart';
import 'package:qidgym_management_system/ui/screens/membership/membership.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class MainInterfaces extends StatelessWidget {
  const MainInterfaces({Key? key,required User? user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color.fromRGBO(40, 40, 41, 1),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: const Color.fromRGBO(40, 40, 41, 1),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }
}

List<Widget> _buildScreens() {
  return [const Home(), const Membership(), const Booking(), const Profile()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const FaIcon(
        FontAwesomeIcons.homeAlt,
        size: 20,
      ),
      title: ("Home"),
      activeColorPrimary: const Color.fromRGBO(238, 29, 82, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const FaIcon(
        FontAwesomeIcons.idCard,
        size: 20,
      ),
      title: ("Home"),
      activeColorPrimary: const Color.fromRGBO(238, 29, 82, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const FaIcon(
        FontAwesomeIcons.calendarCheck,
        size: 20,
      ),
      title: ("Home"),
      activeColorPrimary: const Color.fromRGBO(238, 29, 82, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const FaIcon(
        FontAwesomeIcons.userAlt,
        size: 20,
      ),
      title: ("Settings"),
      activeColorPrimary: const Color.fromRGBO(238, 29, 82, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
