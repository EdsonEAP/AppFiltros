import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class FileService {
  Future fileService({
    required File file,
    required String tipoProcesado,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://jairomendozawithedsonalvarado.pythonanywhere.com/procesar_imagen"),
    );

    var fileStream = file.openRead();
    var length = await file.length();

    request.files.add(
      http.MultipartFile(
        'imagen',
        fileStream.cast(),
        length,
        filename: file.path.split('/').last,
      ),
    );

    request.fields['filtro'] = tipoProcesado;

    var response = await request.send();
    String responseString;
    print(response);
    if (response.statusCode == 200) {
      responseString = await response.stream.bytesToString();
      print("Response: $responseString");
    } else {
      print("Error en la solicitud HTTP: ${response.statusCode}");
      throw Exception('Error en la solicitud HTTP');
    }

    return response;
  }
}
