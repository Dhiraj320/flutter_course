import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission(Permission permission) async {
 
  if (await permission.request().isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
  }
  return false;
}
