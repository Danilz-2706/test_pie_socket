import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:test_pie_socket/model/message.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';

class WebsocketRepo {
  late final IOWebSocketChannel _channel;
  final String _cluseterID = 'free.blr2';
  final String _apiKey = '5lpozJyOa8smL79mkfrCArzp9i5z3cWYRu4PyjfX';
  final String _apiSecret = 'isXVT8s4Y4AMyeIgGGM2V4WXpfYphzwd';
  final String _user1Id = const Uuid().v4(); // Unique user ID or username
  final String _user2Id = const Uuid().v4(); // Unique user ID or username
  //notify
  final int _getNotifySelf = 1;
  //presence
  final int _getPresence = 1;
  // authen - token
  String jwt = '';

  late final String _privateChannelName = 'private_chat_${_user1Id}_$_user2Id';
  late final String _url =
      'wss://$_cluseterID.piesocket.com/v3/$_privateChannelName?api_key=$_apiKey';

  //endpoint-noti
  late final String _urlWithNoti =
      '$_url&notify_self=$_getNotifySelf&presence=$_getPresence';
  //endpoint-auth
  late final String _urlWithAuth = '$_url&jwt=$jwt';

  //constructor
  WebsocketRepo() {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final String signature =
        generateSignature(_cluseterID, _privateChannelName, timestamp);
    _channel = IOWebSocketChannel.connect(Uri.parse("$_url&uuid=$_user1Id"));
  }

  void addMessage(Message message) {
    final Map<String, dynamic> data = {
      'event': 'message',
      'data': {'sender': _user1Id, 'text': "123"},
    };
    _channel.sink.add(json.decode(data.toString()));
  }

  String generateSignature(
      String clusterId, String channelName, int timestamp) {
    final String message = '$clusterId:$channelName:$timestamp:$_apiSecret';
    final List<int> bytes = utf8.encode(message);
    final String signature = sha1.convert(bytes).toString();
    return signature;
  }

  void connectWebsocket() {
    print("connect WS");
    _channel.sink.add('connect');

    //connect
    try {
      _channel.stream.asBroadcastStream().listen(
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
