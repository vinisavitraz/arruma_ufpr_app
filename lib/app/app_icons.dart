import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String pathIcons = 'assets/icons/';

class AppIcons {

  static const incident = '${pathIcons}incident.svg';
  static const activeIncident = '${pathIcons}active_incident.svg';

  static const profile = '${pathIcons}profile.svg';
  static const activeProfile = '${pathIcons}active_profile.svg';

  static const key = '${pathIcons}key.svg';
  static const logout = '${pathIcons}logout.svg';

}

class AppIcon extends StatelessWidget {
  final String icon;
  final Size? size;
  final Color? color;
  const AppIcon(
      this.icon, {
        Key? key,
        this.size,
        this.color,
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size?.height ?? 24,
      width: size?.width ?? 24,
      color: color,
    );
  }

}