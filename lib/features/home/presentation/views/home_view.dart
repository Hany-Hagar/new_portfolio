import '../widgets/home_body.dart';
import '../widgets/home_avatar.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';
import '../../data/database/home_data.dart';
import '../../../../core/enums/font_type.dart';
import '../../../../core/enums/device_type.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_view.dart';
import '../../../../core/widgets/custom_divider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.deviceType == DeviceType.mobile;
    return CustomView(
      body: isMobile
          ? const Column(spacing: 40, children: [HomeBody(), HomeAvatar()])
          : const Row(
              spacing: 40,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 11, child: HomeBody()),
                Expanded(flex: 9, child: HomeAvatar()),
              ],
            ),
      bottom: const _HomeBanner(),
    );
  }
}

class _HomeBanner extends StatelessWidget {
  const _HomeBanner();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: _Techs(techs: homeData.techBanner),
        ),
      ],
    );
  }
}

class _Techs extends StatelessWidget {
  final List<String> techs;
  const _Techs({required this.techs});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 30,
      child: Marqueer.builder(
        pps: 60,
        interaction: false,
        itemCount: null,
        separatorBuilder: (_, _) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: CustomText(size: 22, text: '✦', color: scheme.primary),
        ),
        itemBuilder: (_, i) => CustomText(
          size: 22,
          type: FontType.medium,
          text: techs[i % techs.length],
          color: scheme.onSurfaceVariant,
          fontFamily: FontFamily.spaceGrotesk.value,
        ),
      ),
    );
  }
}
