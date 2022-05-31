import 'package:map_mvvm/service_locator.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';
import 'package:qidgym_management_system/services/profile/user.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_screen.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_viewmodal.dart';

final locator = ServiceLocator.locator;

void initializeServiceLocator() => ServiceLocator.init((locator) async {
      locator.registerLazySingleton<AuthService>(() => AuthService());
      locator.registerLazySingleton<UserCollection>(() => UserCollection());
      locator.registerLazySingleton<ProfileViewModel>(() => ProfileViewModel());
      locator.registerLazySingleton<Profile>(() => const Profile());
    });
