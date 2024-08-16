import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/chat/chat_controller.dart';
import 'package:mobilegarage/vendor_app/app/chat/component/chat_card.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class VChatView extends StatefulWidget {
  const VChatView({super.key});

  @override
  State<VChatView> createState() => _VChatViewState();
}

class _VChatViewState extends State<VChatView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VChatController>(
        autoRemove: false,
        builder: (controller) => AppLayout(
              appBarTitle: 'Chat',
              hasBgColor: true,
              child: Column(
                children: [
                  ChatCard(
                    name: 'sdsdfd',
                  ),
                   ChatCard(
                    name: 'sdsdfd',
                  ),
                   ChatCard(
                    name: 'sdsdfd',
                  ),
                ],
              ),
            ));
  }
}
