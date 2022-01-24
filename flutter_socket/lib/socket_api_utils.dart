import 'package:flutter_pusher_client/flutter_pusher.dart';
import 'package:laravel_echo/laravel_echo.dart';

class SocketApiUtils {
  // static buildSocket() {
  //   PusherOptions options = PusherOptions(
  //     // host: '192.168.1.22',
  //     host: 'http://192.168.100.195',
  //     wsPort: 6001,
  //     cluster: 'mt1',
  //     encrypted: false,
  //   );
  //   PusherClient client = PusherClient('KEN1234567890', options);
  //   client.connect();
  //   client.onConnectionStateChange((state) {
  //     print(state?.currentState);
  //   });
  // }

// PusherOptions options = PusherOptions(
//   // host: '192.168.1.22',
//   host: '192.168.100.195',
//   port: 6001,
//   cluster: 'mt1',
//   encrypted: false,
// );

// //KEN1234567890
// //PAK0987654321
// FlutterPusher pusher =
//     FlutterPusher('KEN1234567890', options, enableLogging: true);
// return Echo({
//   'broadcaster': 'pusher',
//   'client': pusher,
// });
  static buildSocket() {
    PusherOptions options = PusherOptions(
      // host: '192.168.1.22',
      host: '192.168.100.195',
      // host: '192.168.43.163',
      port: 6001,
      cluster: 'mt1',
      encrypted: false,
    );
    FlutterPusher pusher = FlutterPusher('KEN1234567890', options);

    Echo echo = Echo({
      'broadcaster': 'pusher',
      'client': pusher,
    });
    // with pusher only
    pusher.connect(onConnectionStateChange: (p0) {
      print(p0.currentState);
      String id = pusher.getSocketId();
      print('Socket ID : $id');
    });

    // pusher.subscribe('send_message').bind('SendMessage', (response) {
    //   print(response);
    //   setState(() {
    //     message.add(Message(response['message'].toString()));
    //   });
    // });

    echo.channel('send_message').listen('.SendMessage', (event) {
      print('this is event text ' + event['message'].toString());
    });
  }
}
