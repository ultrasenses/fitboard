import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultrasenses_fitboard/screens/rooms/bloc/rooms_bloc.dart';
import 'package:ultrasenses_fitboard/screens/rooms/widgets/rooms_list.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  BlocProvider<RoomsBloc> _buildContext(BuildContext context) {
    return BlocProvider<RoomsBloc>(
      create: (BuildContext context) => RoomsBloc(),
      child: BlocConsumer<RoomsBloc, RoomsState>(
        buildWhen: (_, currState) => currState is RoomsInitial,
        builder: (context, state) {
          return RoomsList();
        },
        listenWhen: (_, currState) => true,
        listener: (context, state) {},
      ),
    );
  }
}
