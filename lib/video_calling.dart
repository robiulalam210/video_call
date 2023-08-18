


import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCalling extends StatefulWidget {
  const VideoCalling({Key? key}) : super(key: key);

  @override
  State<VideoCalling> createState() => _VideoCallingState();
}

final String localUserID = math.Random().nextInt(10000).toString();

class _VideoCallingState extends State<VideoCalling> {
  final callIDTextCtrl = TextEditingController(text: "call_id");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIDTextCtrl,
                  decoration:
                  const InputDecoration(labelText: "join a call by id"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CallPage(callID: callIDTextCtrl.text);
                    }),
                  );
                },
                child: const Text("join"),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class CallPage extends StatelessWidget {
  final String callID;

  const CallPage({
    Key? key,
    required this.callID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: 321185953,
        appSign: '451b3abc39ced14da423f9f0c498ca4c4d366fd4c379760ee25f00aef40889de',
        userID: localUserID,
        userName: "user_$localUserID",
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) {
            Navigator.of(context).pop();
          },
      ),
    );
  }
}