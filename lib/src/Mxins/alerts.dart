import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

// Size size = MediaQuery.of(context).size;
mixin Alerts {
  Future showErrorDialog({required BuildContext context, String? textContent}) {
    return showDialog(
        context: context,
        builder: (context) => Center(
              child: AlertDialog(
                title: const Text(
                  'Aviso',
                ),
                content: Text(
                  textContent ?? 'Ocurrió un error, vuelva a intentarlo.',
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'Aceptar',
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
        barrierDismissible: true);
  }

  Future showLoadingDialog({required BuildContext context, String? text}) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: size.width * 0.5,
              child: AlertDialog(
                  backgroundColor: Color(0xFF05A39D),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        text ?? 'Cargando...',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                        textAlign: TextAlign.center,
                      ),
                      //_loader
                    ],
                  )),
            ),
          );
        });
  }
}
