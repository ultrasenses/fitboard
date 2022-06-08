import 'package:flutter/material.dart';
import 'package:ultrasenses_fitboard/core/const/path_constants.dart';
import 'package:ultrasenses_fitboard/core/const/text_constants.dart';
import 'package:ultrasenses_fitboard/data/exercise_data.dart';
import 'package:ultrasenses_fitboard/data/workout_data.dart';
import 'package:ultrasenses_fitboard/data/workout_tag_data.dart';
import 'package:ultrasenses_fitboard/screens/onboarding/widget/onboarding_tile.dart';

class DataConstants {
  // Onboarding
  static final onboardingTiles = [
    const OnboardingTile(
      title: TextConstants.onboarding1Title,
      mainText: TextConstants.onboarding1Description,
      imagePath: PathConstants.onboarding1,
    ),
    const OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imagePath: PathConstants.onboarding2,
    ),
    const OnboardingTile(
      title: TextConstants.onboarding3Title,
      mainText: TextConstants.onboarding3Description,
      imagePath: PathConstants.onboarding3,
    ),
  ];

  // Workouts
  static final List<WorkoutData> workouts = [
    WorkoutData(
        title: TextConstants.yogaTitle,
        exercices: TextConstants.yogaExercises,
        minutes: TextConstants.yogaMinutes,
        currentProgress: 10,
        progress: 16,
        image: PathConstants.yoga,
        tagsList: [
          WorkoutTagData(title: "yoga", color: const Color(0xFF000000)),
          WorkoutTagData(title: "🔥hard!!!", color: const Color(0xFFE5412A)),
          WorkoutTagData(title: "spotify", color: const Color(0xFF00AA6D)),
        ],
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            progress: 1,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
            ],
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.3,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.99,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
        ]),
    WorkoutData(
        title: TextConstants.prometheusTitle,
        exercices: TextConstants.prometheusExercises,
        minutes: TextConstants.prometheusMinutes,
        currentProgress: 1,
        progress: 20,
        image: PathConstants.prometheus,
        tagsList: [
          WorkoutTagData(title: "workout", color: const Color(0xFF7059EB)),
          WorkoutTagData(title: "spotify", color: const Color(0xFF00AA6D)),
          WorkoutTagData(
              title: "🚀new", color: const Color.fromARGB(255, 223, 135, 123)),
        ],
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            progress: 0.1,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.1,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.0,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
        ]),
    WorkoutData(
        title: TextConstants.fullBodyTitle,
        exercices: TextConstants.fullBodyExercises,
        minutes: TextConstants.fullBodyMinutes,
        currentProgress: 12,
        progress: 14,
        image: PathConstants.fullBody,
        tagsList: [
          WorkoutTagData(
              title: "full-body", color: const Color.fromARGB(255, 24, 0, 161)),
          WorkoutTagData(title: "spotify", color: const Color(0xFF00AA6D))
        ],
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            progress: 0.99,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.6,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.8,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
        ]),
    WorkoutData(
      title: TextConstants.stretchingTitle,
      exercices: TextConstants.stretchingExercises,
      minutes: TextConstants.stretchingMinutes,
      currentProgress: 0,
      progress: 8,
      image: PathConstants.stretching,
      tagsList: [
        WorkoutTagData(title: "stretching", color: const Color(0xFF7059EB)),
        WorkoutTagData(title: "spotify", color: const Color(0xFF00AA6D))
      ],
      exerciseDataList: [
        ExerciseData(
          title: TextConstants.reclining,
          minutes: TextConstants.recliningMinutes,
          progress: 0.0,
          video: PathConstants.recliningVideo,
          description: TextConstants.warriorDescription,
          steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
        ),
        ExerciseData(
          title: TextConstants.cowPose,
          minutes: TextConstants.cowPoseMinutes,
          progress: 0.0,
          video: PathConstants.cowPoseVideo,
          description: TextConstants.warriorDescription,
          steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
        ),
        ExerciseData(
          title: TextConstants.warriorPose,
          minutes: TextConstants.warriorPoseMinutes,
          progress: 0.0,
          video: PathConstants.warriorIIVideo,
          description: TextConstants.warriorDescription,
          steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
        ),
      ],
    ),
  ];

  static final List<WorkoutData> homeWorkouts = [
    WorkoutData(
        title: TextConstants.cardioTitle,
        exercices: TextConstants.cardioExercises,
        minutes: TextConstants.cardioMinutes,
        currentProgress: 10,
        progress: 16,
        image: PathConstants.cardio,
        tagsList: [
          WorkoutTagData(title: "health", color: const Color(0xFF00AA6D)),
          WorkoutTagData(title: "cardio", color: const Color(0xFFE5412A)),
          WorkoutTagData(
              title: "15 min", color: const Color.fromARGB(255, 227, 255, 126)),
        ],
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            progress: 1,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
            ],
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.3,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.99,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
        ]),
    WorkoutData(
        title: TextConstants.armsTitle,
        exercices: TextConstants.armsExercises,
        minutes: TextConstants.armsMinutes,
        currentProgress: 1,
        progress: 20,
        image: PathConstants.arms,
        tagsList: [
          WorkoutTagData(title: "arms", color: const Color(0xFF000000))
        ],
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            progress: 0.1,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.1,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.0,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
        ]),
  ];

  // Reminder
  static List<String> reminderDays = [
    TextConstants.everyday,
    TextConstants.monday_friday,
    TextConstants.weekends,
    TextConstants.monday,
    TextConstants.tuesday,
    TextConstants.wednesday,
    TextConstants.thursday,
    TextConstants.friday,
    TextConstants.saturday,
    TextConstants.sunday,
  ];
}
