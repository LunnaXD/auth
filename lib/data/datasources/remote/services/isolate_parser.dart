import 'dart:isolate';

import 'dio_client.dart';

/// La clase IsolateParser se utiliza cuando se necesita realizar operaciones
/// de análisis de manera asíncrona en un proceso de aislamiento separado.
/// Esto puede ser útil en casos donde el análisis de datos es una tarea
/// intensiva que puede bloquear el hilo principal y afectar la capacidad
/// de respuesta de la aplicación.
class IsolateParser<T> {
  final Map<String, dynamic> json;

  ResponseConverter<T> converter;

  IsolateParser(this.json, this.converter);

  Future<T> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn(_parseListOfJson, port.sendPort);

    final result = await port.first;
    return result as T;
  }

  Future<void> _parseListOfJson(SendPort sendPort) async {
    final result = converter(json);
    Isolate.exit(sendPort, result);
  }
}
