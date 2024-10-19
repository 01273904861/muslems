import 'package:muslems_app/constants/app_assets.dart';
import 'package:muslems_app/constants/app_strings.dart';
import 'package:muslems_app/models/zkr_category_model.dart';
import 'package:muslems_app/widgets/zkr_body.dart';
import 'package:muslems_app/widgets/zekr_category_item_name.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  List<ZkrCategoryModel> lisTItems = [
    ZkrCategoryModel(
        image: AppAssets.assetsImagesSunrise, name: AppStrings.azkarElsapah),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesCloudyNight,
        name: AppStrings.azkarElmassaa),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesManCalling,
        name: AppStrings.callingForPray),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesPrayer, name: AppStrings.prayForSad),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesSleeping,
        name: AppStrings.prayForSleeping),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesWakeUp, name: AppStrings.wakeUpAdkar),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesMosque, name: AppStrings.goToMosque),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesRuku, name: AppStrings.praying),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesSuit, name: AppStrings.wearingNewClothes),
    ZkrCategoryModel(
        image: AppAssets.assetsImagesWearing, name: AppStrings.wearingClothes),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: GridView.builder(
          clipBehavior: Clip.none, //cutting
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //give the form of grid view
              crossAxisCount: 2,
              // childAspectRatio: 6 / 9,
              //ratio of  width / height
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: lisTItems.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ZkrBody(dkrName: lisTItems[i].name);
                }));
              },
              child: ZekrCategoryItemName(item: lisTItems[i]),
            );
          }),
    );
  }
}
