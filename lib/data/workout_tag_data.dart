import 'dart:ui';

class WorkoutTagData {
  final String title;
  final Color color;

  WorkoutTagData({
    required this.title,
    required this.color,
  });

  @override
  String toString() {
    return 'WorkoutTagData(title: $title, color: $color)';
  }
}
