import 'package:ultrasenses_fitboard/core/const/color_constants.dart';
import 'package:ultrasenses_fitboard/core/const/path_constants.dart';
import 'package:ultrasenses_fitboard/data/workout_data.dart';
import 'package:ultrasenses_fitboard/screens/workout_details_screen/bloc/workoutdetails_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailsBody extends StatelessWidget {
  final WorkoutData workout;
  const WorkoutDetailsBody({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstants.darkModeBackgroundColor,
      child: Stack(
        children: [
          _createImage(),
          _createBackButton(context),
          _editWorkoutButton()
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<WorkoutDetailsBloc>(context);
    return Positioned(
      left: 20,
      top: 14,
      child: SafeArea(
        child: BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
          builder: (context, state) {
            return GestureDetector(
              child: const SizedBox(
                width: 30,
                height: 30,
                child: Image(
                  image: AssetImage(PathConstants.back),
                ),
              ),
              onTap: () {
                bloc.add(BackTappedEvent());
              },
            );
          },
        ),
      ),
    );
  }

  Widget _editWorkoutButton() {
    return Positioned(
      right: 20,
      top: 6,
      child: SafeArea(
        child: BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
          builder: (context, state) {
            return TextButton(
                onPressed: () async {},
                style: TextButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor:
                        ColorConstants.primaryColor.withOpacity(0.16)),
                child:
                    const Icon(Icons.edit, color: ColorConstants.primaryColor));
          },
        ),
      ),
    );
  }

  Widget _createImage() {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Image(
        image: AssetImage(workout.image),
        fit: BoxFit.cover,
      ),
    );
  }
}
