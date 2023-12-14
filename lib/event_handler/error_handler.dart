import 'package:trivia_goat/event_handler/server_event_handler.dart';
import 'package:trivia_goat/global/common/toast.dart';

class ErrorHandler extends ServerEventHandler {
  final String details;

  ErrorHandler(this.details);

  @override
  bool execute() {
    print('Llego un error con detalles: $details');
    showToast(message: details);
    return true;
  }
}
