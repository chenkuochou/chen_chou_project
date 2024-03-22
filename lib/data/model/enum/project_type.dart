import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:flutter/material.dart';

enum ProjectType {
  proofOfConcept,
  inProgress,
  production;

  String get displayName => switch (this) {
        ProjectType.proofOfConcept => 'PROOF OF CONCEPT',
        ProjectType.inProgress => 'In Progress',
        ProjectType.production => 'Production',
      };

  Color get bgColor => switch (this) {
        ProjectType.proofOfConcept => MyPalette.grey,
        ProjectType.inProgress => MyPalette.green,
        ProjectType.production => MyPalette.blue,
      };
}
