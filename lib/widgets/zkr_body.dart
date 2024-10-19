import 'package:flutter/material.dart';
import 'package:muslems_app/constants/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:muslems_app/constants/app_functions.dart';
import 'package:muslems_app/models/dkr_model.dart';
import 'package:muslems_app/widgets/custom_shimmer.dart';
import 'package:muslems_app/widgets/zkr_widget.dart';

class ZkrBody extends StatefulWidget {
  const ZkrBody({super.key, required this.dkrName});

  final String dkrName;

  @override
  State<ZkrBody> createState() => _ZkrBodyState();
}

class _ZkrBodyState extends State<ZkrBody> with WidgetsBindingObserver {
  late Future<List<DkrModel>> adkar;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    adkar = AppFunctions().fetchAdkarBasedOnName(widget.dkrName);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _resetCounter(List<DkrModel> adkarData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < adkarData.length; i++) {
      await prefs.setInt('${adkarData[i].title}$i', 0);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      adkar.then((adkarData) {
        _resetCounter(adkarData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.defaultColor,
        elevation: 0,
        title: Text(
          widget.dkrName,
          style: const TextStyle(color: Colors.white, fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<DkrModel>>(
          future: adkar,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomShimmer();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final adkarData = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: adkarData.length,
                itemBuilder: (context, i) {
                  return ZkrWidget(
                    index: i,
                    dkr: adkarData[i],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
