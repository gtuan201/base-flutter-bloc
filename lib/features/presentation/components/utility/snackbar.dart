import 'package:clean_architect/features/presentation/components/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dimensions.dart';

extension ShowSnackbarGlobalKeyScaffoldStateExtension
on GlobalKey<ScaffoldState> {
  void showSnackBar(
      String message, [
        Duration duration = const Duration(seconds: 2),
      ]) {
  }
}

extension ShowSnackBarBuildContextExtension on BuildContext {
  void showSnackBar(
      String message, [
        Duration duration = const Duration(seconds: 2),
      ]) {
  }
}

void showCustomSnackBar(String message, {bool isError = true,int? duration}) {
  if(message.isNotEmpty) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.horizontal,
      margin: const EdgeInsets.only(
        right: Dimensions.PADDING_SIZE_SMALL,
        top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL, left: Dimensions.PADDING_SIZE_SMALL,
      ),
      duration: Duration(seconds: duration ?? 3),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
      content: Text(message, style: robotoMedium.copyWith(color: Colors.white)),
    ));
  }
}
