import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/custom_text_button.dart';
import '../../../layout/manager/layout_cubit.dart';
import '../widgets/contact_body.dart';

import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_view.dart';
import '../../../../core/widgets/custom_divider.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(bottom: const _Buttom(), body: const ContactBody());
  }
}

class _Buttom extends StatelessWidget {
  const _Buttom();

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomDivider(), const _BottomBody()]);
  }
}

class _BottomBody extends StatelessWidget {
  const _BottomBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomText(
              size: 14,
              opacity: FontOpacity.medium,
              text: "© 2026 Hany Magdy Hagar · Flutter Developer",
            ),
          ),
          CustomTextButton(
            title: "Back to top",
            itemSize: 14,
            icon: FontAwesomeIcons.arrowUp,
            onPressed: () => LayoutCubit.get(context).scrollTo(0),
          ),
        ],
      ),
    );
  }
}
