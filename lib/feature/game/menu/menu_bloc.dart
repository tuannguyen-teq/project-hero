// import 'dart:io';

// import 'package:bloc/bloc.dart';

// import 'package:domain/repositories/graphql_repository.dart';
// import 'package:domain/repositories/local_data_repository.dart';
// import 'package:injectable/injectable.dart';
// import 'menu_event.dart';
// import 'menu_state.dart';

// @injectable
// class MenuBloc extends TBloc<MenuState> {
//   final GraphqlRepository graphqlRepository;
//   final LocalDataRepository localDataRepository;
//   final TrackingService trackingService;

//   MenuBloc(this.graphqlRepository, this.localDataRepository, this.trackingService)
//       : super(const MenuState()) {
//     on<ConnectStravaEvent>((event, emit) async {
//       emit(state.copyWith(isLoading: true));
//       final resultConnect = await graphqlRepository.syncStrava(event.code);
//       if (resultConnect.result == 'Success') {
//         final userStravaConnection = localDataRepository.user.copyWith(stravaConnection: true);

//         localDataRepository.saveUser(userStravaConnection);
//         emit(state.copyWith(isConnectStrava: true, isShowToast: true));
//       } else {
//         emit(state.error);
//       }
//     });

//     on<GetCurrentLocationEvent>((event, emit) async {
//       final isReady = await trackingService.forceEnablePermission(() {
//         emit(state.copyWith(showSettingLocation: true));
//       });
//       if (isReady) {
//         bool isPreciseLocation =
//             Platform.isAndroid ? await trackingService.enablePreciseLocation() : true;
//         if (isPreciseLocation) {
//           await trackingService.configureMapSetting();
//           emit(state.copyWith(isLoading: true));
//           await trackingService.getCurrentLocation();
//           emit(state.copyWith());
//           emit(state.copyWith(navigateToRecord: true));
//         } else {
//           emit(state.copyWith(showPreciseLocation: true));
//         }
//       }
//       emit(state.copyWith());
//     });

//     on<CheckConnectStravaMenuEvent>((event, emit) {
//       emit(state.copyWith(isConnectStrava: event.value, isShowToast: false));
//     });
//   }

//   @override
//   void onAddInitialEvent(InitialEvent event, Emitter<MenuState> emit) async {
//     await syncAllActivities();
//     emit(state.copyWith(isConnectStrava: localDataRepository.user.stravaConnection));
//   }

//   @override
//   void onAddErrorEvent(ErrorEvent event, Emitter<MenuState> emit) {
//     emit(state.copyWith(error: event.error));
//   }

//   Future<void> syncAllActivities() async {
//     final activityRequests = localDataRepository.activityRequests;
//     for (int i = activityRequests.length - 1; i >= 0; i--) {
//       var request = activityRequests[i];
//       await graphqlRepository.createActivity(
//           request.activity,
//           request.images ?? [],
//           {
//             'device': request.deviceName,
//             'start_time': '${request.activity.parseToUtcTime()}',
//             'data': request.record
//           },
//           request.exportToStrava);
//       activityRequests.removeAt(i);
//       localDataRepository.saveActivityRequests(activityRequests);
//     }
//   }
// }
