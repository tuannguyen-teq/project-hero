// import 'package:flame/cache.dart';
// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame_rive/flame_rive.dart';
// import 'package:rive/rive.dart';
// import 'package:teq_flutter_core/teq_flutter_core.dart';

// class Building extends SpriteComponent with Tappable {
//   Building({
//     required this.name,
//     required Vector2 size,
//     required Vector2 position,
//     required this.onTap,
//   }) : super(
//           size: size,
//           position: Vector2(
//             position.x + (size.x / 2),
//             position.y + (size.y / 2),
//           ),
//         ) {
//     // debugMode = true;
//     anchor = Anchor.center;
//   }

//   static const String home = 'home';
//   static const String office = 'office';
//   static const String store = 'store';

//   String name;
//   Function(String name) onTap;

//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();
//     add(RectangleHitbox());
//     final ratio = ScreenUtil.pixelRatio.round();
//     final imagePath = ScreenUtil.pixelRatio > 1
//         ? 'assets/images/${ratio > 3 ? 3 : ScreenUtil.pixelRatio.round()}.0x/': 'assets/images/';
//     sprite = Sprite(await Images(prefix: imagePath).load('img_$name.png'));
//   }

//   @override
//   bool onTapDown(TapDownInfo info) {
//     scale = Vector2(1.1, 1.1);
//     return true;
//   }

//   @override
//   bool onTapUp(TapUpInfo info) {
//     scale = Vector2(0.9, 0.9);
//     onTap(name);
//     return true;
//   }

//   @override
//   bool onTapCancel() {
//     scale = Vector2(0.9, 0.9);
//     return true;
//   }
// }

// class BuildingMarker extends RiveComponent {
//   BuildingMarker({
//     required super.artboard,
//     required super.position,
//     required super.size
//   }){
//     anchor = Anchor.bottomCenter;
//   }

//   @override
//   Future<void>? onLoad() {
//     final controller = SimpleAnimation('Animation 1');
//     artboard.addController(controller);
//     controller.isActive = true;
//     return super.onLoad();
//   }
// }
