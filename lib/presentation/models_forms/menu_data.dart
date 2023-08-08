import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MenuData extends Equatable {
  final String label;
  final IconData? icon;
  final IconData? iconSelected;

  const MenuData({
    required this.label,
    this.icon,
    this.iconSelected,
  });

  @override
  List<Object?> get props => [label, icon, iconSelected];
}
