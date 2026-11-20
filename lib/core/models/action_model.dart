import 'package:flutter/material.dart';

class ActionModel {
  final int id;
  final String name;
  final IconData? icon;
  ActionModel({required this.id, required this.name, this.icon});
}

List<ActionModel> actions = [
  ActionModel(id: 1, name: "Experience"),
  ActionModel(id: 2, name: "Projects"),
  ActionModel(id: 3, name: "Skills"),
  ActionModel(id: 4, name: "Contact"),
];
