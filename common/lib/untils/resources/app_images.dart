import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImages {
  AppImages._();
  static const imagesFolder = 'assets/images';

  static const String background1 = 'background_1.png';
  static const String bgLogin = 'bg_login.png';
  static const String bgMap1 = 'bg_map_1.png';
  static const String bgMapFull = 'bg_map_full.png';
  static const String bgOpacity = 'bg_opacity.png';
  static const String bgOptionRun = 'bg_option_run.png';
  static const String bgRequestLocation = 'bg_request_location.png';
  static const String bgSplashScreen = 'bg_splash_screen.png';
  static const String bgTimerRecord = 'bg_timer_record.png';
  static const String btnActivities = 'btn_activities.png';
  static const String btnComment = 'btn_comment.png';
  static const String btnConnectStrava = 'btn_connect_strava.png';
  static const String btnFinish = 'btn_finish.png';
  static const String btnFriends = 'btn_friends.png';
  static const String btnGo = 'btn_go.png';
  static const String btnLogin = 'btn_login.png';
  static const String btnNextDetail = 'btn_next_detail.svg';
  static const String btnPause = 'btn_pause.png';
  static const String btnResume = 'btn_resume.png';
  static const String btnStart = 'btn_start.png';
  static const String icArrowRight = 'ic_arrow_right.png';
  static const String icCheck = 'ic_check.svg';
  static const String icClose = 'ic_close.svg';
  static const String icFollow = 'ic_follow.svg';
  static const String icOnlyMe = 'ic_only_me.svg';
  static const String icPublic = 'ic_public.svg';
  static const String icTarget = 'ic_target.png';
  static const String icTimerDisable = 'ic_timer_disable.png';
  static const String icTimerEnable = 'ic_timer_enable.png';
  static const String icWarning = 'ic_warning.png';
  static const String iconBack = 'icon_back.svg';
  static const String iconBackHome = 'icon_back_home.svg';
  static const String iconCoin = 'icon_coin.png';
  static const String iconCurrentLocation = 'icon_current_location.png';
  static const String iconDelete = 'icon_delete.svg';
  static const String iconDeleted = 'icon_deleted.png';
  static const String iconDrop = 'icon_drop.svg';
  static const String iconEdit = 'icon_edit.svg';
  static const String iconMarker = 'icon_marker.png';
  static const String iconRenameUser = 'icon_rename_user.svg';
  static const String iconSetting = 'icon_setting.svg';
  static const String icStarRank = 'ic_star_rank.png';
  static const String iconShowStrava = 'icon_show_strava.svg';
  static const String iconStart = 'icon_start.svg';
  static const String iconStrava = 'icon_strava.png';
  static const String iconUserHero = 'icon_user_hero.png';
  static const String imgAlbum = 'img_album.png';
  static const String imgAppBar = 'img_app_bar.png';
  static const String imgBgDialog = 'img_bg_dialog.png';
  static const String imgBuilding = 'img_building.svg';
  static const String imgBush = 'img_bush.png';
}

class AppImageWiget extends StatelessWidget {
  final String path;
  final Color? color;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final FilterQuality filterQuality;

  const AppImageWiget(
    this.path, {
    Key? key,
    this.color,
    this.fit,
    this.height,
    this.width,
    FilterQuality? filterQuality,
  })  : filterQuality = filterQuality ?? FilterQuality.low,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        '${AppImages.imagesFolder}/$path',
        colorFilter: ColorFilter.mode(color ?? Colors.transparent, BlendMode.color),
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      );
    }
    return Image.asset(
      '${AppImages.imagesFolder}/$path',
      color: color,
      height: height,
      width: width,
      fit: fit ?? BoxFit.fitHeight,
      filterQuality: filterQuality,
    );
  }
}
