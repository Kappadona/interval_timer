import 'package:flutter/material.dart';
import 'package:interval_timer/bloc/bloc_provider.dart';
import 'package:interval_timer/bloc/time_bloc.dart';
import 'package:interval_timer/text_input/rounds_input_page.dart';
import 'package:interval_timer/text_input/time_input.dart';

class PauseTimeInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build -> pause time input page');
    TimeBloc timeBloc = BlocProvider.of<TimeBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Set Rest Duration',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: TimeInput(timeBloc.setPauseTime, timeBloc.pauseTime.value),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlatButton(
                    shape: CircleBorder(),
                    onPressed: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 50,
                    ),
                  ),
                  FlatButton(
                    shape: CircleBorder(),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RoundsInputPage(),
                      ),
                    ),
                    child: Icon(
                      Icons.done,
                      size: 50,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
