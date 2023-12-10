// import 'package:common/resources/resources.dart';
// import 'package:common/enums.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:teq_flutter_core/teq_flutter_core.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// import '../../../../components/bounce.dart';
// import '../../../../components/error_mixin.dart';
// import '../../../../components/highlight.dart';
// import '../../../../components/loading_mixin.dart';
// import '../../../../components/popup_notify_user.dart';
// import '../../../../components/app_snack_bar.dart';
// import '../../../../components/base_image.dart';
// import '../../../activities/activities_widget.dart';
// import '../../../record/record_widget.dart';
// import '../../connect_strava/connect_strava_widget.dart';
// import '../teq_hero_game.dart';
// import 'menu_bloc.dart';
// import 'menu_event.dart';
// import 'menu_state.dart';

// class MenuWidget extends StatefulWidget {
//   const MenuWidget(TeqHeroGame game, {Key? key}) : super(key: key);
//   static const name = 'menu';

//   @override
//   State<MenuWidget> createState() => _MenuWidgetState();
// }

// class _MenuWidgetState extends TeqWidgetState<MenuBloc, MenuWidget> with LoadingMixin, ErrorMixin {
//   @override
//   MenuBloc? getBloc() => context.read<MenuBloc>();

//   @override
//   void disposeBloc() {}

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<MenuBloc, MenuState>(
//           listenWhen: (prev, curr) =>
//               prev.isConnectStrava != curr.isConnectStrava && curr.isShowToast == true,
//           listener: (context, state) {
//             showTopSnackBar(
//               context,
//               AppSnackBar(
//                 message: state.isConnectStrava
//                     ? AppStrings.connectionSuccess
//                     : AppStrings.connectionFailed,
//               ),
//               reverseAnimationDuration: const Duration(microseconds: 300),
//               displayDuration: const Duration(milliseconds: 1000),
//             );
//           },
//         ),
//         BlocListener<MenuBloc, MenuState>(
//           listenWhen: (prev, curr) {
//             return curr.navigateToRecord == true;
//           },
//           listener: (context, state) {
//             context.push(const RecordWidget());
//           },
//         ),
//         BlocListener<MenuBloc, MenuState>(
//           listenWhen: (prev, curr) {
//             return prev.isLoading != curr.isLoading;
//           },
//           listener: (context, state) {
//             if (state.isLoading) {
//               showLoading(barrierColor: Colors.transparent);
//             } else {
//               hideLoading();
//             }
//           },
//         ),
//         BlocListener<MenuBloc, MenuState>(
//           listenWhen: (prev, curr) {
//             return curr.error != null;
//           },
//           listener: (context, state) {
//             showError(state.error);
//           },
//         ),
//         BlocListener<MenuBloc, MenuState>(
//           listenWhen: (prev, curr) {
//             return curr.showSettingLocation == true;
//           },
//           listener: (context, state) {
//             showDialog(
//               context: context,
//               builder: (builder) {
//                 return PopupNotifyUser(
//                   onTapBack: () {
//                     openAppSettings();
//                   },
//                   txtTitle: AppStrings.updateLocationSettings,
//                   btnText: 'Go To Settings',
//                   popup: Popup.popUpPermissionLocation,
//                 );
//               },
//             );
//           },
//         ),
//         BlocListener<MenuBloc, MenuState>(
//           listenWhen: (prev, curr) {
//             return curr.showPreciseLocation == true;
//           },
//           listener: (context, state) {
//             showDialog(
//               context: context,
//               builder: (builder) {
//                 return PopupNotifyUser(
//                   onTapBack: () {
//                     openAppSettings();
//                   },
//                   txtTitle: AppStrings.updateLocationSettings,
//                   btnText: 'Go To Settings',
//                   popup: Popup.popupPreciseLocation,
//                 );
//               },
//             );
//           },
//         ),
//       ],
//       child: BlocBuilder<MenuBloc, MenuState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               state.isConnectStrava == true ? const SizedBox() : _stravaConnectWidget(context),
//               const Spacer(),
//               Row(
//                 children: [
//                   const Expanded(child: SizedBox()),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Bounce(
//                           onTap: () {
//                             showTopSnackBar(
//                               context,
//                               const AppSnackBar(message: AppStrings.comingSoon),
//                               reverseAnimationDuration: const Duration(microseconds: 300),
//                               displayDuration: const Duration(milliseconds: 1000),
//                             );
//                           },
//                           child: const AppImageWidget(
//                             url: AppImages.btnFriends,
//                           )),
//                       const SizedBox(height: 16),
//                       Bounce(
//                           onTap: () {
//                             context.push(const ActivitiesWidget(typeActivity: TypeActivity.newsfeed));
//                           },
//                           child: const AppImageWidget(
//                             url: AppImages.btnActivities,
//                           )),
//                       const SizedBox(height: 16),
//                       Bounce(
//                         onTap: () {
//                           addEvent(const GetCurrentLocationEvent());
//                         },
//                         child: const AppImageWidget(url: AppImages.btnGo),
//                       ),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//                   const SizedBox(width: 16),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _stravaConnectWidget(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 60.h),
//       child: Align(
//         alignment: Alignment.topRight,
//         child: HighLight(
//             onTap: () async {
//               final resultCode = await context.push(ConnectStravaWidget());
//               if (resultCode != null) {
//                 addEvent(ConnectStravaEvent(code: resultCode));
//               }
//             },
//             child: const AppImageWidget(url: AppImages.btnConnectStrava)),
//       ),
//     );
//   }
// }
