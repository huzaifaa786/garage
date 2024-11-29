import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/chatify/user_api.dart';
import 'package:mobilegarage/models/chatify/contact.dart';
import 'package:mobilegarage/models/chatify/msg.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:developer' as developer;

class VChatController extends GetxController {
  static VChatController instance = Get.find();
  double? lat;
  double? lng;

  Position? currentPosition;
  String currentAddress = '';
  RxList<Msg> massages = <Msg>[].obs;
  TextEditingController massagecontroller = TextEditingController();
  String? activeUserId;
  List<Contact> contacts = <Contact>[];
  List<Contact> scontacts = <Contact>[];
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  main() {
    var intValue = Random().nextInt(10);

    return intValue;
  }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    LoadingHelper.show();
    var url = chatbaseUrl + '/chat/auth';
    var data;
    GetStorage box = GetStorage();

    data = {
      'api_token': box.read('api_token')!,
      "socket_id": socketId,
      "channel_name": channelName,
    };

    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    return response;
  }

  initPusher(String? id) async {
    try {
      await pusher.init(
          apiKey: "a62c32373bdcbeea6aa7",
          cluster: "ap2",
          onConnectionStateChange: onConnectionStateChange,
          onError: onError,
          onSubscriptionSucceeded: onSubscriptionSucceeded,
          onEvent: onEvent,
          onSubscriptionError: onSubscriptionError,
          onDecryptionFailure: onDecryptionFailure,
          onMemberAdded: onMemberAdded,
          onMemberRemoved: onMemberRemoved,
          onAuthorizer: onAuthorizer);
      GetStorage box = GetStorage();
      String user_id = box.read('user_id').toString();

      await pusher.subscribe(channelName: "private-chatify.${user_id}");

      print(pusher.connectionState);
      await pusher.connect();
      activeUserId = id;
    } catch (e) {
      print("error in initialization: $e");
    }
    print(pusher.connectionState);
  }

  getContacts() async {
    LoadingHelper.show();
    var url = chatbaseUrl + '/getContacts';
    var data;
    GetStorage box = GetStorage();
    data = {
      'api_token': box.read('api_token')!,
    };

    var response = await Api.execute(url: url, data: data);
    contacts = <Contact>[];
    if (response['contacts'].isNotEmpty) {
      for (var contact in response['contacts']) {
        contacts.add(Contact(contact));
        update();
      }
    }
    update();
    scontacts = contacts;
    update();
    LoadingHelper.dismiss();
  }

  void searchContact(String query) {
    if (query == '') {
      scontacts = contacts;
      update();
    } else {
      scontacts = contacts
          .where((o) => o.username!
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      update();
    }
  }

  void onError(String message, int? code, dynamic e) {
    print("onError: $message code: $code exception: $e");
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    print("Connection: $currentState");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    print("onMemberRemoved: $channelName member: $member");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    print("onMemberAdded: $channelName member: $member");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    print("onSubscriptionSucceeded: $channelName data: $data");
  }

  void onSubscriptionError(String message, dynamic e) {
    print("onSubscriptionError: $message Exception: $e");
  }

  void onEvent(PusherEvent event) {
    // var response = jsonDecode(event.data);
    var response;
    if (event.data is String) {
      response = jsonDecode(event.data);
    } else if (event.data is Map) {
      response = event.data;
    } else {
      print("Unexpected data type in event: ${event.data.runtimeType}");
      return;
    }
    if (response['message'] is Map) {
      response['message']['body'] = response['message']['message'];
      response['message']['created_at'] = response['message']['created_at'];
      massages.add(Msg(response['message']));
      update();
    } else {
      print("Message key is missing or has an unexpected format.");
    }
    //
    update();
  }

  void onDecryptionFailure(String event, String reason) {
    print("onDecryptionFailure: $event reason: $reason");
  }

  ClearVariable() {
    massagecontroller.clear();

    update();
  }

  File? file;
  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'gif']);
    if (result != null) {
      file = await File(result.files.single.path!);
      await sendMassage();
    } else {}
  }

  sendMassage() async {
    var url = chatbaseUrl + '/sendMessage';
    var data;
    GetStorage box = GetStorage();

    String fileName = file?.path.split('/').last ?? '';
    String location = lat.toString() + ',' + lng.toString();
    developer.log(location);
    data = dio.FormData.fromMap({
      'api_token': box.read('api_token')!,
      // if (lat != null)
       'message': massagecontroller.text.toString(),
      'type': 'user',
      'temporaryMsgId': main(),
      'id': activeUserId,
      'location': lat.toString() + ',' + lng.toString()
    });
    developer.log(data.toString());
    if (file != null) {
      data.files.add(
        MapEntry(
          'file',
          await dio.MultipartFile.fromFile(file!.path, filename: fileName),
        ),
      );
    }
    ClearVariable();
    if (file != null) {
      file = null;
    }
    if (lat != null) {
      lat = null;
      lng = null;
      location = '';
    }
    update();

    var response = await Api.execute(url: url, data: data, image: file != null);

    response['message']['body'] = response['message']['message'];
    response['message']['created_at'] = response['message']['created_at'];

    massages.add(Msg(response['message']));

    developer.log(massages.toString());
    update();
    ClearVariable();
    lat = null;
    lng = null;
  }

  fetchmassage(id) async {
    LoadingHelper.show();
    var url = chatbaseUrl + '/fetchMessages';
    var data;
    GetStorage box = GetStorage();

    data = {
      'api_token': box.read('api_token')!,
      'id': id,
    };
developer.log(data.toString());
    var response = await Api.execute(url: url, data: data);
    massages = <Msg>[].obs;
    for (var van in response['messages']) {
      String location = van['location'] ?? ''; // Ensure location exists
      double? lat;
      double? lng;
      // Split location into lat and lng
      if (location.isNotEmpty) {
        List<String> latLng = location.split(',');
        if (latLng.length == 2) {
          lat = double.tryParse(latLng[0].trim());
          lng = double.tryParse(latLng[1].trim());
        }
      }
      massages.add(Msg(van, lat: lat, lng: lng));
      update();
    }
    LoadingHelper.dismiss();
  }

  makeseen(id) async {
    LoadingHelper.show();
    var url = chatbaseUrl + '/makeSeen';
    var data;
    GetStorage box = GetStorage();
    data = {
      'api_token': box.read('api_token')!,
      'id': id,
    };
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
  }

  String? unseen;
  unseenchat() async {
    LoadingHelper.show();
    var url = chatbaseUrl + '/unseen/all';
    var data;
    GetStorage box = GetStorage();
    data = {
      'api_token': box.read('api_token')!,
    };
    var response = await Api.execute(url: url, data: data);
    unseen = response['unseen'].toString();
    update();
    LoadingHelper.dismiss();
  }
}
