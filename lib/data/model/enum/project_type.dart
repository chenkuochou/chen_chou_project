import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:flutter/material.dart';

enum ProjectType {
  proofOfConcept('PROOF OF CONCEPT', MyPalette.grey),
  inProgress('In Progress', MyPalette.green),
  production('Production', MyPalette.blue);

  final String displayName;
  final Color bgColor;

  const ProjectType(this.displayName, this.bgColor);
}
