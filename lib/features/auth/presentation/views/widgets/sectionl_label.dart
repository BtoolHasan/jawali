import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(text, style: AppTextStyles.label);
}