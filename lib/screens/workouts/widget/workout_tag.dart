import 'package:ultrasenses_fitboard/core/const/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:ultrasenses_fitboard/data/workout_tag_data.dart';

class WorkoutTag extends StatelessWidget {
  final WorkoutTagData tagData;

  const WorkoutTag({required this.tagData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: tagData.color,
      ),
      child: Row(
        children: [
          Text(tagData.title, style: const TextStyle(color: ColorConstants.textWhite, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
