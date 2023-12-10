// import 'package:flutter/material.dart';
// import 'package:teq_flutter_core/teq_flutter_core.dart';

// @immutable
// class MenuState extends BaseState {
//   final bool isLoading;
//   final bool isConnectStrava;
//   final bool isShowToast;
//   final bool? navigateToRecord;
//   final dynamic error;
//   final bool? showSettingLocation;
//   final bool? showPreciseLocation;

//   const MenuState({
//     this.isLoading = false,
//     this.isConnectStrava = false,
//     this.isShowToast = false,
//     this.navigateToRecord,
//     this.error,
//     this.showSettingLocation,
//     this.showPreciseLocation,
//   });

//   MenuState copyWith({
//     bool? isLoading,
//     bool? isConnectStrava,
//     bool? isShowToast,
//     bool? navigateToRecord,
//     bool? showSettingLocation,
//     bool? showPreciseLocation,
//     dynamic error,
//   }) {
//     return MenuState(
//       isLoading: isLoading ?? false,
//       isConnectStrava: isConnectStrava ?? this.isConnectStrava,
//       isShowToast: isShowToast ?? this.isShowToast,
//       navigateToRecord: navigateToRecord,
//       error: error,
//       showSettingLocation: showSettingLocation,
//       showPreciseLocation: showPreciseLocation,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         isLoading,
//         isConnectStrava,
//         error,
//         navigateToRecord,
//         showSettingLocation,
//         showPreciseLocation,
//         isShowToast,
//       ];
// }
