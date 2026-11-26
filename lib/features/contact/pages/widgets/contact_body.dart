import 'contact_item.dart';
import 'contact_start.dart';

import 'package:flutter/material.dart';

import '../../data/models/contact_model.dart';
import '../../data/database/contact_data.dart';
import '../../../../core/enums/device_type.dart';
import '../../../../core/utils/url_service.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({super.key});

  @override
  Widget build(BuildContext context) {
    var data = myContact;
    var isMobile = context.isMobile;
    if (isMobile) return _Mobile(data: data);
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ContactStart(contact: data)),
        Expanded(child: _Items(contact: data)),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  final ContactModel data;
  const _Mobile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactStart(contact: data),
        _Items(contact: data),
      ],
    );
  }
}

class _Items extends StatelessWidget {
  final ContactModel contact;
  const _Items({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactItem(
          title: "email",
          value: contact.email,
          onTap: () => UrlService.sendEmail(context, to: contact.email),
        ),
        ContactItem(
          title: "phone",
          value: contact.phone,
          onTap: () => UrlService.openWhatsapp(context, contact.phone),
        ),
        ContactItem(title: "location", value: contact.location),
        ContactItem(
          title: "linkedIn",
          value: "Connect",
          onTap: () => UrlService.openUrl(context, contact.linkedIn),
        ),
        ContactItem(
          isLast: true,
          title: "github",
          value: "See my code",
          onTap: () => UrlService.openUrl(context, contact.github),
        ),
      ],
    );
  }
}
