import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';

class WebsocketRepo {
  late final IOWebSocketChannel channel;
  // final String _cluseterID;
  // final String _apiKey;
  // final String _apiSecret;

  WebsocketRepo(String url) {
    print("123");
    channel = IOWebSocketChannel.connect(url);
  }

  // //endpoint
  // final String _url =
  //     'wss://$_cluseterID.piesocket.com/v3/$_roomId?api_key=$_apiKey';
  //group-chat
  // final String _roomId = '1';
  // //uuid
  // final String _getUserId = Uuid().v4();
  // //notify
  // final int _getNotifySelf = 1;
  // //presence
  // final int _getPresence = 1;
  //authen - token
  // String jwt = '';

  // //endpoint-noti
  // final String _urlWithNoti =
  //     '$_url&notify_self=$_getNotifySelf&presence=$_getPresence';
  // //endpoint-auth
  // final String _urlWithAuth = '$_url&jwt=$jwt';
  // //endpoint-uuid
  // final String _urlWithUserID = '$_url&user=$_getUserId';

  void addData(dynamic data) {
    print("add message");
    channel.sink.add(data);
  }

  void connectWebsocket() {
    print("connect WS");
    channel.sink.add("156");

    //connect
    try {
      channel.stream.asBroadcastStream().listen(
            (message) {
              print(message);
            },
            cancelOnError: true,
            onError: (error) {
              print(error);
            },
            onDone: () {},
          );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
