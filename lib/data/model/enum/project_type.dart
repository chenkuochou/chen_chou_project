import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:flutter/material.dart';

enum ProjectType {
  proofOfConcept('PROOF OF CONCEPT', MyPalette.grey),
  inProgress('IN PROGRESS', MyPalette.orange),
  production('PRODUCTION', MyPalette.black);

  final String displayName;
  final Color bgColor;

  const ProjectType(this.displayName, this.bgColor);
}
