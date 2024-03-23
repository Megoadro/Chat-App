import 'package:cahtty/constants.dart';

class Messege {
  final String messege;
  final String id;
  Messege(this.id, this.messege);

  factory Messege.fromjson(jsonData) {
    return Messege(jsonData['id'], jsonData[kMessege]);
  }
}
