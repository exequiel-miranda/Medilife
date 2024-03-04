import 'package:firebase_dart/firebase_dart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

class comprasimageprovider {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  //late var link = '';
/*
  Future<bool> subirImagen(BuildContext context, String filePath) async {
    File file = File(filePath); //Archivo a guardar
    final String fileName = basename(
        filePath); //Nombre del archivo con su extensión, ej: imagen.png
    try {
      //Subida del archivo
      final subida = await firebase_storage.FirebaseStorage.instance
          .ref('medicamento/$fileName')
          .putFile(file);
      var imageUrl = await(await subida).ref.getDownloadURL();
      link = imageUrl.toString();
      print(link);
      //Si la subida salió bien se retorna 'true'
      return true;
    } on firebase_storage.FirebaseException catch (e) {
      //Si hubo error en la subida se retorna 'false'
      print(e);
      return false;
    }
  }

  Future<void> downloadURLExample(BuildContext context, String filePath) async {
    File file = File(filePath); //Archivo a guardar
    final String fileName = basename(filePath);
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('medicamento/$fileName')
        .getDownloadURL();

    // Within your widgets:
    Image.network(downloadURL);
  }*/
  /* Mostrar archivos en app
  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult result = await storage.ref('medicamento').listAll();

    result.items.forEach((firebase_storage.Reference ref) {
      print('Objeto encontrado: $ref');
     });
     return result;
  }*/
}
