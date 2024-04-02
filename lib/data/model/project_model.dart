import 'package:chen_chou_project/data/model/enum/project_type.dart';
import 'package:chen_chou_project/data/model/enum/tech_stack.dart';
import 'package:flutter/material.dart';

@immutable
class ProjectModel {
  final String name;
  final String subtitle;
  final Map<String, int> imageMeta;
  final ProjectType type;
  final String description;
  final List<String>? features;
  final List<TechStack> techStack;
  final TextStyle textStyle;
  final String? demoUrl;
  final Color bgColor;
  final bool? isDarkTheme;

  const ProjectModel({
    required this.name,
    required this.subtitle,
    required this.imageMeta,
    required this.type,
    required this.description,
    this.features,
    required this.techStack,
    required this.textStyle,
    this.demoUrl,
    required this.bgColor,
    this.isDarkTheme = false,
  });
}
