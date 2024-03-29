import 'package:ultrasenses_fitboard/data/exercise_data.dart';
import 'package:ultrasenses_fitboard/data/workout_tag_data.dart';

class WorkoutData {
  final String title;
  final String exercices;
  final String minutes;
  final int currentProgress;
  final int progress;
  final String image;
  final List<ExerciseData> exerciseDataList;
  final List<WorkoutTagData> tagsList;

  WorkoutData({
    required this.title,
    required this.exercices,
    required this.minutes,
    required this.currentProgress,
    required this.progress,
    required this.image,
    required this.exerciseDataList,
    required this.tagsList,
  });

  @override
  String toString() {
    return 'WorkoutData(title: $title, exercices: $exercices, minutes: $minutes, currentProgress: $currentProgress, progress: $progress, image: $image, exerciseDataList: $exerciseDataList, tagsList: $tagsList)';
  }
}
