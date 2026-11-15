import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle textStyle100(BuildContext context) =>
      _baseStyle(context, FontWeight.w100);
  static TextStyle textStyle200(BuildContext context) =>
      _baseStyle(context, FontWeight.w200);
  static TextStyle textStyle300(BuildContext context) =>
      _baseStyle(context, FontWeight.w300);
  static TextStyle textStyle400(BuildContext context) =>
      _baseStyle(context, FontWeight.w400);
  static TextStyle textStyle500(BuildContext context) =>
      _baseStyle(context, FontWeight.w500);
  static TextStyle textStyle600(BuildContext context) =>
      _baseStyle(context, FontWeight.w600);
  static TextStyle textStyle700(BuildContext context) =>
      _baseStyle(context, FontWeight.w700);
  static TextStyle textStyle800(BuildContext context) =>
      _baseStyle(context, FontWeight.w800);
  static TextStyle textStyle900(BuildContext context) =>
      _baseStyle(context, FontWeight.w900);
  static TextStyle textStyleBold(BuildContext context) =>
      _baseStyle(context, FontWeight.bold);

  static TextStyle _baseStyle(BuildContext context, FontWeight weight) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      fontWeight: weight,
      overflow: TextOverflow.ellipsis,
      color: theme.colorScheme.onSurface,
    );
  }
}
