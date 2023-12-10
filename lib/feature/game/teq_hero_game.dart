// import 'package:flame/game.dart';
// import 'package:flame_tiled/flame_tiled.dart';
// import 'package:flutter/widgets.dart';
// import 'game_preload.dart';
// import 'menu/menu_widget.dart';
// import 'word/building.dart';
// import 'word/hero_character.dart';
// import 'package:tiled/tiled.dart';

// class TeqHeroGame extends FlameGame with HasTappables {
//   late TiledComponent homeMap;
//   final GamePreload gamePreload;
//   final Function(String name) onTapBuilding;

//   TeqHeroGame({required this.onTapBuilding, required this.gamePreload});

//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();
//     homeMap = gamePreload.homeMap ?? await TiledComponent.load('teq_hero_map.tmx', Vector2.all(32));
//     await _loadMap();
//     _addBuildings();
//     _addSkyAnimations();
//     _addCharacter();

//     overlays.add(MenuWidget.name);
//   }

//   Future<void> _loadMap() async {
//     add(homeMap);
//     camera.zoom = size.y / mapHeight;
//     if (!WidgetsBinding.instance.sendFramesToEngine) {
//      await Future.delayed(const Duration(milliseconds: 300));
//       WidgetsBinding.instance.allowFirstFrame();
//     }
//   }

//   void _addBuildings() {
//     final buildingGroup = homeMap.tileMap.getLayer<ObjectGroup>('building');
//     for (var obj in buildingGroup!.objects) {
//       add(Building(
//           name: obj.name,
//           size: Vector2(obj.width, obj.height),
//           position: Vector2(obj.x, obj.y),
//           onTap: onTapBuilding));
//     }

//     addAll(gamePreload.buildMarkers);
//   }

//   Future<void> _addCharacter() async {
//     for (var item in gamePreload.boardCharacters) {
//       add(HeroCharacter(item, Vector2(200, size.y / 1.6)));
//     }
//   }

//   double get mapHeight => homeMap.tileMap.map.height * 32;

//   void _addSkyAnimations() async {
//     addAll(gamePreload.skyComponents);
//   }

// }
