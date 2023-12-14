import 'package:frases_argentinas/event_handler/server_event_handler.dart';
import 'package:frases_argentinas/global/common/toast.dart';

class ErrorHandler extends ServerEventHandler {
  final String details;

  ErrorHandler(this.details);

  @override
  bool execute() {
    print('Llego un error con detaller: $details');
    showToast(message: details);
    return true;
  }
}
