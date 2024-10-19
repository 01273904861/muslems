import 'package:dio/dio.dart';
import 'package:muslems_app/constants/app_strings.dart';
import 'package:muslems_app/models/dkr_model.dart';
import 'package:muslems_app/models/hadith_model.dart';
import 'package:muslems_app/services/adkar_service.dart';
import 'package:muslems_app/services/hadith_services%20.dart';

class AppFunctions {
  Future<List<DkrModel>> fetchAdkarBasedOnName(String name) {
    switch (name) {
      case AppStrings.azkarElsapah:
        return AdkarServices().fetchAdkarElsapah();
      case AppStrings.azkarElmassaa:
        return AdkarServices().fechAdkarElmasaa();
      case AppStrings.wakeUpAdkar:
        return AdkarServices().fetchWakeUpAdkar();
      case AppStrings.callingForPray:
        return AdkarServices().fetchCallingForPray();
      case AppStrings.wearingClothes:
        return AdkarServices().fetchWearingClothes();
      case AppStrings.praying:
        return AdkarServices().fetchPraying();
      case AppStrings.wearingNewClothes:
        return AdkarServices().fetchWearingNewClothes();
      case AppStrings.goToMosque:
        return AdkarServices().fetchGoToMosque();
      case AppStrings.prayForSad:
        return AdkarServices().fetchPrayForSad();
      case AppStrings.prayForSleeping:
        return AdkarServices().fetchPrayForSleeping();
      default:
        return Future.value([]); // Default empty list
    }
  }

  Future<List<HadithModel>> fetchAhadith(String bookNameArab) async {
    final String bookName;
    switch (bookNameArab) {
      case AppStrings.alSilsilaSahihaArab:
        bookName = AppStrings.alSilsilaSahiha;
        break;
      case AppStrings.jamiAlTirmidhiArab:
        bookName = AppStrings.jamiAlTirmidhi;
        break;
      case AppStrings.mishkatAlMasabihArab:
        bookName = AppStrings.mishkatAlMasabih;
        break;
      case AppStrings.musnadAhmadArab:
        bookName = AppStrings.musnadAhmad;
        break;
      case AppStrings.sahihMuslimArab:
        bookName = AppStrings.sahihMuslim;
        break;
      case AppStrings.sunanAbuDawoodArab:
        bookName = AppStrings.sunanAbuDawood;
        break;
      case AppStrings.sunanAnNasaiArab:
        bookName = AppStrings.sunanAnNasai;
        break;
      case AppStrings.sunanIbnEMajahArab:
        bookName = AppStrings.sunanIbnEMajah;
        break;
      case AppStrings.sahihBukhariArab:
        bookName = AppStrings.sahihBukhari;
        break;
      default:
        throw Exception('Invalid book name');
    }
    List<HadithModel> ahadith =
        await HadithServices(dio: Dio()).fetchHadith(bookName);

    return ahadith;
  }
}
