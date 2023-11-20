import 'package:data/net_work/htttp_error.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HttpError)
class AppHttpError extends HttpError {
  @override
  void handleError(error) {
    // TODO: implement handleError
    super.handleError(error);
  }
}
