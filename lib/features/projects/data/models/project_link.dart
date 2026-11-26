import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef Type = ({String label, String url, FaIconData icon});

enum ProjectLink {
  github('GitHub', FontAwesomeIcons.github),
  appStore('App Store', FontAwesomeIcons.appStoreIos),
  googlePlay('Google Play', FontAwesomeIcons.googlePlay);

  final String label;
  final FaIconData icon;
  const ProjectLink(this.label, this.icon);

  Type call(String url, {String? label}) =>
      (label: label ?? this.label, url: url, icon: icon);
}
