import 'package:ultrasenses_fitboard/core/const/color_constants.dart';
import 'package:ultrasenses_fitboard/core/const/data_constants.dart';
import 'package:ultrasenses_fitboard/data/workout_data.dart';
import 'package:ultrasenses_fitboard/screens/workouts/widget/workout_card.dart';
import 'package:flutter/material.dart';

class WorkoutContent extends StatelessWidget {
  const WorkoutContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.darkModeBackgroundColor,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [_createHomeBody(context), _editWorkoutButton()],
      ),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('My training',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.textWhite)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: DataConstants.workouts
                  .map(
                    (e) => _createWorkoutCard(e),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _editWorkoutButton() {
    return Positioned(
        top: 64,
        right: 12,
        child: TextButton(
            onPressed: () async {},
            style: TextButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: ColorConstants.primaryColor.withOpacity(0.16)),
            child: const Icon(Icons.edit, color: ColorConstants.primaryColor)));
  }

  Widget _createWorkoutCard(WorkoutData workoutData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: WorkoutCard(workout: workoutData),
    );
  }
}
