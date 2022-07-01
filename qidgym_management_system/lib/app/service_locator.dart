import 'package:map_mvvm/service_locator.dart';
import 'package:qidgym_management_system/services/booking/booking_service.dart';
import 'package:qidgym_management_system/services/booking/booking_service_firebase.dart';
import 'package:qidgym_management_system/services/operation_hour/operationHour_service.dart';
import 'package:qidgym_management_system/services/operation_hour/operationHour_service_firebase.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';
import 'package:qidgym_management_system/services/profile/user_services.dart';
import 'package:qidgym_management_system/services/room/room_service.dart';
import 'package:qidgym_management_system/services/room/room_service_firebase.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/booking_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/bookingform/bookingform_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/mybooking/mybooking_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/home/moderator/editschedule/editschedule_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/home/moderator/home_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/profile/profile_viewmodal.dart';
import 'package:qidgym_management_system/ui/wrapper_view_model.dart';
import '../services/booking/booking_moderator_service.dart';
import '../services/booking/booking_moderator_service_mock.dart';
import '../services/membership/membership_service.dart';
import '../services/membership/membership_service_firebase.dart';
import '../ui/screens/booking/booking_moderator_viewmodel.dart';
import '../ui/screens/membership/admin/member_list_viewmodel.dart';
import '../ui/screens/profile/profile_screen.dart';

final locator = ServiceLocator.locator;

void initializeServiceLocator() => ServiceLocator.init((locator) async {
      locator.registerLazySingleton<AuthService>(() => AuthService());
      locator.registerLazySingleton<UserCollection>(() => UserCollection());
      locator.registerLazySingleton<RoomService>(() => RoomServiceFirebase());
      locator.registerLazySingleton<BookingService>(
          () => BookingServiceFirebase());
      locator.registerLazySingleton<OperationHourService>(
          () => OperationHourServiceFirebase());
      locator.registerLazySingleton<ProfileViewModel>(() => ProfileViewModel());
      locator.registerLazySingleton<WrapperViewmodel>(() => WrapperViewmodel());
      locator.registerLazySingleton<BookingViewModel>(() => BookingViewModel());
      locator.registerLazySingleton<MyBookingViewModel>(
          () => MyBookingViewModel());
      locator.registerLazySingleton<BookingFormViewModel>(
          () => BookingFormViewModel());
      locator.registerLazySingleton<EditScheduleViewModel>(
          () => EditScheduleViewModel());
      locator.registerLazySingleton<HomeModeratorViewModel>(
          () => HomeModeratorViewModel());
      locator.registerLazySingleton<Profile>(() => const Profile());
      locator.registerFactory<MemberListViewModel>(() => MemberListViewModel());
      locator.registerLazySingleton<BookingModeratorService>(
          () => BookingModeratorServiceMock());
      locator.registerLazySingleton<BookingModeratorViewModel>(
          () => BookingModeratorViewModel());
      locator.registerLazySingleton<MembershipService>(
          () => MembershipServiceFirebase());
    });
