import 'package:firebase_dart/firebase_dart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

class download {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
/*
  Future<bool> downloadURLExample(BuildContext context, String filePath) async {
    File file = File(filePath); //Archivo a guardar
    final String fileName = basename(filePath);
    try {
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('medicamento/$fileName')
          .getDownloadURL();
      Image.network(downloadURL);
      return true;
    } on firebase_storage.FirebaseException catch (e) {
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;
      // Within your widgets:
    }
  }*/
}
