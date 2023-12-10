// import 'package:flame/extensions.dart';
// import 'package:flame/game.dart';
// import 'package:flame_rive/flame_rive.dart';
// import 'package:flame_tiled/flame_tiled.dart';
// import 'package:injectable/injectable.dart';
// import 'package:rive/rive.dart';
// import 'package:teq_flutter_core/teq_flutter_core.dart';
// import 'word/building.dart';
// import 'package:tiled/tiled.dart';
// import 'package:common/resources/resources.dart';

// @singleton
// class GamePreload {
//   TiledComponent? homeMap;
//   List<BuildingMarker> buildMarkers = [];
//   List<RiveComponent> skyComponents = [];
//   List<Artboard> boardCharacters = [];

//   Future<void> load() async {
//     homeMap = await TiledComponent.load('teq_hero_map.tmx', Vector2.all(32));
//     _clearList();
//     _loadBuildings();
//     _loadHeroes();
//     _loadSkyAnimations();
//   }

//   void _clearList() {
//     buildMarkers.clear();
//     boardCharacters.clear();
//     skyComponents.clear();
//   }

//   void _loadBuildings() {
//     if (homeMap == null) return;
//     final buildingGroup = homeMap!.tileMap.getLayer<ObjectGroup>('building');
//     for (var obj in buildingGroup!.objects) {
//       final markerPath = getMarkerPath(obj.name);
//       loadArtboard(RiveFile.asset(markerPath)).then((board) {
//         buildMarkers.add(BuildingMarker(
//           artboard: board,
//           position: Vector2((obj.x + obj.width / 2 - 20), obj.y),
//           size: Vector2(board.width, board.height),
//         ));
//       });
//     }
//   }

//   void _loadHeroes() {
//     loadArtboard(RiveFile.asset(RiveResources.teqhero))
//         .then((board) => {boardCharacters.add(board)});
//   }

//   void _loadSkyAnimations() {
//     //sun
//     loadArtboard(RiveFile.asset(RiveResources.sun)).then((board) {
//       board.addController(SimpleAnimation('Animation 1'));
//       skyComponents.add(RiveComponent(
//         artboard: board,
//         position: Vector2(100, 100),
//         size: Vector2(74.w, 52.h),
//       ));
//     });
//     //pin wheels
//     loadArtboard(RiveFile.asset(RiveResources.pinWheel)).then((board) {
//       board.addController(SimpleAnimation('Animation 1'));
//       skyComponents.add(RiveComponent(
//         artboard: board,
//         position: Vector2(165, 220),
//         size: Vector2(26.w, 54.h),
//       ));

//       skyComponents.add(RiveComponent(
//         artboard: board,
//         position: Vector2(185, 225),
//         size: Vector2(26.w, 54.h),
//       ));

//       skyComponents.add(RiveComponent(
//         artboard: board,
//         position: Vector2(205, 230),
//         size: Vector2(26.w, 54.h),
//       ));
//     });

//     //balloon
//     loadArtboard(RiveFile.asset(RiveResources.hotAirBalloon)).then((board) {
//       board.addController(SimpleAnimation('Animation 1'));
//       skyComponents.add(RiveComponent(
//         artboard: board,
//         position: Vector2(300, 100),
//         size: Vector2(74.w, 52.h),
//       ));
//     });
//   }

//   String getMarkerPath(String name) {
//     switch (name) {
//       case Building.home:
//         return RiveResources.homeMarker;
//       case Building.store:
//         return RiveResources.storeMarker;
//     }
//     return RiveResources.officeMarker;
//   }
// }
