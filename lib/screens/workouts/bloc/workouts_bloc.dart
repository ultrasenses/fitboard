import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultrasenses_fitboard/data/workout_data.dart';
import 'package:meta/meta.dart';

part 'workouts_event.dart';
part 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  WorkoutsBloc() : super(WorkoutsInitial());

  @override
  Stream<WorkoutsState> mapEventToState(
    WorkoutsEvent event,
  ) async* {
    if (event is CardTappedEvent) {
      yield CardTappedState(workout: event.workout);
    }
  }
}
