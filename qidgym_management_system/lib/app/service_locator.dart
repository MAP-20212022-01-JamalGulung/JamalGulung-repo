import 'package:map_mvvm/service_locator.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_viewmodal.dart';

import '../services/profile/current_user.dart';
import '../services/profile/user.dart';
import '../ui/screens/profile/profile_screen.dart';
// import '../ui/screens/profile/profile_viewmodal.dart';

final locator = ServiceLocator.locator;

void initializeServiceLocator() => ServiceLocator.init((locator) async {
      locator.registerLazySingleton<AuthService>(() => AuthService());
      locator.registerLazySingleton<UserCollection>(() => UserCollection());
      locator.registerLazySingleton<ProfileViewModel>(() => ProfileViewModel());
      locator.registerLazySingleton<Profile>(() => const Profile());
    });
