import 'package:muslems_app/constants/app_colors.dart';
import 'package:muslems_app/cubit%20services/counter_cubit.dart';
import 'package:muslems_app/models/dkr_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomCircleWidget extends StatefulWidget {
  const CustomCircleWidget({
    super.key,
    required this.dkr,
    required this.index,
  });

  final DkrModel dkr;
  final int index;

  @override
  State<CustomCircleWidget> createState() => _CustomCircleWidgetState();
}

class _CustomCircleWidgetState extends State<CustomCircleWidget>
    with WidgetsBindingObserver {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCacheCounter();
  }

  Future<void> _loadCacheCounter() async {
    _counter =
        await getCounterValue(widget.dkr.title + widget.index.toString());
    // ignore: use_build_context_synchronously
    context
        .read<CounterCubit>()
        .setIintialCount(_counter); //set initial counter in cubit
    setState(() {}); // Update the UI with the loaded counter value
  }

  Future<void> saveCounterValue(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int> getCounterValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CounterCubit>().increment(widget.dkr.count);
        _counter = context.read<CounterCubit>().counter; //update counter
        saveCounterValue(widget.dkr.title + widget.index.toString(), _counter);
        setState(() {}); // Update the UI with the new counter value
      },
      child: CircleAvatar(
        backgroundColor: AppColors.defaultColor.withOpacity(.89),
        radius: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counter.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              '/${widget.dkr.count}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
