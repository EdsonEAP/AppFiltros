import 'dart:io';

import 'package:appxor/src/Mxins/alerts.dart';
import 'package:appxor/src/Pages/bloc/blocXor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String tipoFiltro = "";
int animated = 1;
XorBloc xorBloc = XorBloc();
String filePath = '';
File? imageFile;
File? imageFileAnterior;
bool isChecked = false;

class XorView extends StatefulWidget with Alerts {
  static const String name = "XorView";

  const XorView({Key? key}) : super(key: key);

  @override
  _XorViewState createState() => _XorViewState();
}

class _XorViewState extends State<XorView> with Alerts {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void validacionFilter() {
    if (imageFileAnterior == null) {
      showErrorDialog(
          context: context, textContent: "Debe de agregar una imagen");

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(5, 163, 157, 1),
          title: Center(
            child: Container(
                child: Text(
              "APP DE FILTROS",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
          // Agregar un ícono de menú al AppBar
        ),
        body: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<File>(
                    initialData: null,
                    stream: xorBloc.botonXorS,
                    builder:
                        (BuildContext context, AsyncSnapshot<File> snapshot) {
                      imageFile =
                          snapshot.data ?? File(snapshot.data.toString());
                      String imagePath = snapshot.data?.path ??
                          "https://us.123rf.com/450wm/tkacchuk/tkacchuk2004/tkacchuk200400017/143745488-no-hay-icono-de-imagen-vector-de-línea-editable-no-hay-imagen-no-hay-foto-disponible-o-no-hay.jpg";

                      bool isImageUrl = imagePath.contains("https");
                      if (!isImageUrl) {
                        imageFileAnterior = imageFile;
                      }

                      return isImageUrl
                          ? Container(
                              margin: EdgeInsets.all(20),
                              height: size.height * 0.55,
                              color: Colors.white,
                              child: Image.network(imagePath),
                            )
                          : Center(
                              child: Container(
                                margin: EdgeInsets.all(20),
                                height: size.height * 0.55,
                                child: Image.file(snapshot.data ??
                                    File(
                                        "https://us.123rf.com/450wm/tkacchuk/tkacchuk2004/tkacchuk200400017/143745488-no-hay-icono-de-imagen-vector-de-línea-editable-no-hay-imagen-no-hay-foto-disponible-o-no-hay.jpg")),
                              ),
                            );
                    },
                  ),
                  Container(
                    width: size.width * 0.95,
                    child: Row(
                      children: [
                        Center(
                            child: streamBotonReactive(context,
                                texto: "TOMAR FOTO",
                                ontap: () => {
                                      xorBloc.requestLogin(context),
                                    })),
                        Expanded(child: SizedBox()),
                        Center(
                            child: streamBotonReactive(context,
                                texto: "SELECCIONAR DE GALERIA",
                                ontap: () => {
                                      xorBloc.galery(context),
                                    })),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: size.height * 0.15,
                      width: size.width * 0.9,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            cuadritosFiltros(
                                "binarizado",
                                "binarizado",
                                () => {
                                      if (imageFileAnterior == null)
                                        {
                                          showErrorDialog(
                                              context: context,
                                              textContent:
                                                  "Debe de agregar una imagen"),
                                        }
                                      else
                                        {
                                          xorBloc.processImage(context,
                                              tipoFiltro: "binarizado",
                                              image: imageFileAnterior!),
                                        }
                                    }),
                            cuadritosFiltros(
                                "escala_de_grises",
                                "escala_de_grises",
                                () => {
                                      if (imageFileAnterior == null)
                                        {
                                          showErrorDialog(
                                              context: context,
                                              textContent:
                                                  "Debe de agregar una imagen"),
                                        }
                                      else
                                        {
                                          xorBloc.processImage(context,
                                              tipoFiltro: "escala_de_grises",
                                              image: imageFileAnterior!),
                                        }
                                    }),
                            cuadritosFiltros(
                                "negativo",
                                "negativo",
                                () => {
                                      if (imageFileAnterior == null)
                                        {
                                          showErrorDialog(
                                              context: context,
                                              textContent:
                                                  "Debe de agregar una imagen"),
                                        }
                                      else
                                        {
                                          xorBloc.processImage(context,
                                              tipoFiltro: "negativo",
                                              image: imageFileAnterior!),
                                        }
                                    }),
                            cuadritosFiltros(
                                "suavizado",
                                "suavizado",
                                () => {
                                      if (imageFileAnterior == null)
                                        {
                                          showErrorDialog(
                                              context: context,
                                              textContent:
                                                  "Debe de agregar una imagen"),
                                        }
                                      else
                                        {
                                          xorBloc.processImage(context,
                                              tipoFiltro: "suavizado",
                                              image: imageFileAnterior!),
                                        }
                                    }),
                            cuadritosFiltros(
                                "binarizadoinverso",
                                "binarizadoinverso",
                                () => {
                                      if (imageFileAnterior == null)
                                        {
                                          showErrorDialog(
                                              context: context,
                                              textContent:
                                                  "Debe de agregar una imagen"),
                                        }
                                      else
                                        {
                                          xorBloc.processImage(context,
                                              tipoFiltro: "binarizadoinverso",
                                              image: imageFileAnterior!),
                                        }
                                    }),
                            // cuadritosFiltros("asdasaaaa", "binarizad2o"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget cuadritosFiltros(tipoFiltro, nombre, Function? ontap) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: ontap as void Function()?,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.2,
            height: size.height * 0.1,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/images/${nombre}.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            nombre,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

streamBotonReactive(context, {String? texto, Function? ontap}) {
  final size = MediaQuery.of(context).size;
  return InkWell(
    onTap: ontap as void Function()?,
    child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: Color(0xFF05A39D),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                texto ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        )),
  );
}
