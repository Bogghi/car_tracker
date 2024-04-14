import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DataRepository {
  bool permissionGranted = false;

  Future getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      permissionGranted = true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      permissionGranted = false;
    }
  }
}