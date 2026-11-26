import 'contact_start.dart';

import 'package:flutter/material.dart';

import '../../data/database/contact_data.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({super.key});

  @override
  Widget build(BuildContext context) {
    var data = myContact;
    return ContactStart(contact: data);
  }
}
