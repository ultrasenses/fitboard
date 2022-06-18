import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc() : super(RoomsInitial());

  @override
  Stream<RoomsState> mapEventToState(
    RoomsEvent event,
  ) async* {
    if (event is ReloadImageEvent) {
      yield ReloadImageState();
    }
  }
}
