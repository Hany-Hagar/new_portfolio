import '../widgets/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlService {
  static Future<void> openUrl(BuildContext context, String url) async {
    await _openUri(context, Uri.parse(url), 'Unable to open link');
  }

  static Future<void> openEmail(BuildContext context, String email) async {
    await _openUri(
      context,
      Uri(scheme: 'mailto', path: email),
      'Unable to open email',
    );
  }

  static Future<void> _openUri(
    BuildContext context,
    Uri uri,
    String failureMessage,
  ) async {
    final didOpen = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!didOpen && context.mounted) {
      _showBar(context, failureMessage);
    }
  }

  static void _showBar(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: CustomText(text: message)));
  }
}
