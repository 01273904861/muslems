import 'package:muslems_app/cubit%20services/counter_cubit.dart';
import 'package:muslems_app/cubit%20services/counter_states.dart';
import 'package:muslems_app/models/dkr_model.dart';
import 'package:muslems_app/widgets/custom_circule_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZkrWidget extends StatelessWidget {
  const ZkrWidget({
    super.key,
    required this.dkr,
    required this.index,
  });
  final DkrModel dkr;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      constraints: const BoxConstraints(minHeight: 200),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 5, // How wide the shadow should be
              blurRadius: 10, // How soft the shadow should be
              offset:
                  const Offset(0, 6), // Offset of the shadow from the container
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dkr.zekr,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'ScheherazadeNew',
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 13,
          ),
          if (dkr.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                dkr.description,
                style: const TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 102, 101, 101)),
                textAlign: TextAlign.right,
              ),
            ),
          BlocProvider(
            create: (context) => CounterCubit(),
            child: BlocBuilder<CounterCubit, CounterStates>(
              builder: (context, state) {
                if(state is CounterLoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: CustomCircleWidget(
                    index: index,
                    dkr: dkr,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
