// import 'package:flame/components.dart';
// import 'package:flame/input.dart';
// import 'package:flame_rive/flame_rive.dart';
// import 'package:rive/rive.dart';

// class HeroCharacter extends RiveComponent with Tappable {
//   HeroCharacter(Artboard artboard, Vector2 position)
//       : super(
//     artboard: artboard,
//     size: Vector2(artboard.width, artboard.height),
//     position: position,
//   );


//   @override
//   Future<void>? onLoad() {
//     final controller = SimpleAnimation('idle');
//     artboard.addController(controller);
//     controller.isActive = true;
//     return super.onLoad();
//   }

//   @override
//   bool onTapDown(TapDownInfo info) {

//     return true;
//   }
// }