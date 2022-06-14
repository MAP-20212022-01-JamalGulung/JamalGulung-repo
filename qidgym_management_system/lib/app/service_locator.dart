import 'package:map_mvvm/service_locator.dart';
import 'package:qidgym_management_system/services/operation_hour/operation_hour.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';
import 'package:qidgym_management_system/services/profile/user.dart';
import 'package:qidgym_management_system/ui/screens/home/moderator/home_viewmodal.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_screen.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_viewmodal.dart';
import 'package:qidgym_management_system/ui/wrapper_view_model.dart';

final locator = ServiceLocator.locator;

void initializeServiceLocator() => ServiceLocator.init((locator) async {
      locator.registerLazySingleton<AuthService>(() => AuthService());
      locator.registerLazySingleton<UserCollection>(() => UserCollection());
      locator.registerLazySingleton<OperationHour>(() => OperationHour());
      locator.registerLazySingleton<ProfileViewModel>(() => ProfileViewModel());
      locator.registerLazySingleton<WrapperViewmodel>(() => WrapperViewmodel());
      locator.registerLazySingleton<HomeModeratorViewModel>(
          () => HomeModeratorViewModel());
      locator.registerLazySingleton<Profile>(() => const Profile());
    });
