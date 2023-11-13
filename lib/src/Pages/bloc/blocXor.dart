///Import Flutter

import 'dart:async';
import 'dart:io';
import 'package:appxor/src/Mxins/alerts.dart';
import 'package:appxor/src/Pages/services/services.dart';
import 'package:appxor/src/Pages/xorView.dart';
import 'package:image_picker/image_picker.dart';

import 'package:appxor/src/Utils/camera.dart';
import 'package:flutter/material.dart';

class XorBloc with Alerts {
  StreamController<File> botonXorC = StreamController<File>.broadcast();
  Stream<File> get botonXorS => botonXorC.stream;

  FileService fileService = FileService();
  processImage(context, {String? tipoFiltro, required File image}) async {
    showLoadingDialog(context: context, text: "Procesando imagen");
    if (tipoFiltro == null ||
        image == null ||
        image.length == null ||
        image.length == 0 ||
        image.path.split("/cache/").length < 2 ||
        image.path.split("/cache/")[1] == null) {
      showErrorDialog(
          context: context, textContent: "Debe de agregar una imagen");

      return;
    }

    print("PATHHHHHHHHHHHHHH");
    print(image.path.split("/cache/")[1]);
    dynamic reponse =
        await fileService.fileService(file: image, tipoProcesado: tipoFiltro);
    File archivo = File(
        "https://jairomendozawithedsonalvarado.pythonanywhere.com/uploads/${tipoFiltro}.png");
    botonXorC.sink.add(archivo);
    Navigator.pop(context);
  }

  requestLogin(context) async {
    File? takephoto = await OpenCamera.getImage(source: ImageSource.camera);
    if (takephoto != null) {
      OpenCamera.file.add(takephoto);
      print("PROBANDOOOOOOOOOOOOOOO");
      print(takephoto.path);
      botonXorC.sink.add(takephoto);
    } else {
      print("Ocurrio un error con la camara");
      showErrorDialog(context: context, textContent: "Sucedio un error");
      return;
    }
  }

  galery(context) async {
    File? takephoto = await OpenCamera.getImage(source: ImageSource.gallery);

    if (takephoto != null) {
      OpenCamera.file.add(takephoto);
      print("PROBANDOOOOOOOOOOOOOOO");
      print(takephoto.path);
      botonXorC.sink.add(takephoto);
    } else {
      print("Ocurrio un error con la camara");
      showErrorDialog(context: context, textContent: "Sucedio un error");
      return;
    }
  }

  dispose() {
    botonXorC.close();
  }
}
