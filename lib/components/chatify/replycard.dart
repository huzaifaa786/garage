import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:photo_view/photo_view.dart';

class ReplyMessageCard extends StatefulWidget {
  const ReplyMessageCard({
    Key? key,
    required this.msg,
    this.Time,
    this.sender = true,
    this.fileExist = false,
    this.location = '',
    this.fileName = '',
    this.fileTitle = '',
    this.fileType = '',
  }) : super(key: key);

  final String msg;
  final sender;
  final Time;
  final fileName;
  final fileTitle;
  final fileType;
  final fileExist;
  final location;

  @override
  State<ReplyMessageCard> createState() => _ReplyMessageCardState();
}

class _ReplyMessageCardState extends State<ReplyMessageCard> {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {

    double? lat;
    double? lng;

    // Split location into lat and lng
    if (widget.location.isNotEmpty || widget.location != null) {
      List<String> latLng = widget.location.split(',');
      if (latLng.length == 2) {
        lat = double.tryParse(latLng[0].trim());
        lng = double.tryParse(latLng[1].trim());
      }
    }
    return Align(
      alignment:
          widget.sender == true ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 65,
        ),
        child: widget.fileName == '' || widget.fileName == null
            ? Column(
                crossAxisAlignment: widget.sender == true
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  widget.msg == '' || widget.msg == null
                      ? Column(
                         crossAxisAlignment: widget.sender == true
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async {
                                Get.toNamed(AppRoutes.vmap, parameters: {
                                  'lat': lat.toString(),
                                  'lng': lng.toString()
                                });
                              },
                              // child: Container(
                              //   height: 150,
                              //   width: 150,
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(40),
                              //       color: Colors.transparent,
                              //       image: DecorationImage(
                              //           image: AssetImage(
                              //               'assets/images/map_image.png'),
                              //           fit: BoxFit.cover)),
                              // ),
                            child:  Image.asset('assets/images/map_image.png')
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                widget.Time.toString(),
                                style: TextStyle(
                                  color: AppColors.greybg,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: widget.sender == true
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                          children: [
                            Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8))),
                              color: widget.sender == true
                                  ? Colors.black.withOpacity(0.8)
                                  : AppColors.darkprimary,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Text(
                                  widget.msg,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: widget.sender == true
                                          ? Colors.white
                                          : Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                widget.Time.toString(),
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                ],
              )
            : Column(
                children: [
                  widget.fileType == 'image'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              )),
                              color: widget.sender == true
                                  ? Colors.white
                                  : AppColors.darkprimary,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    child: FullScreenWidget(
                                      backgroundColor: Colors.white,
                                      disposeLevel: DisposeLevel.High,
                                      child: Hero(
                                        transitionOnUserGestures: true,
                                        tag: widget.fileName,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: PhotoView(
                                              imageProvider:
                                                  CachedNetworkImageProvider(
                                                      Msg_Storage_Url +
                                                          widget.fileName,
                                                      maxHeight: 10000,
                                                      maxWidth: 10000,
                                                      scale: 1),
                                            )),
                                      ),
                                    ),
                                  ),
                                  widget.msg != ''
                                      ? Container(
                                          width: 151,
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            widget.msg,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: widget.sender == true
                                                    ? Colors.black
                                                    : Colors.white),
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                widget.Time.toString(),
                                style: TextStyle(
                                    color: AppColors.greybg,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              color: widget.sender == true
                                  ? Colors.white
                                  : AppColors.green_color,
                              child: InkWell(
                                onTap: () {
                                  // String ext = widget.fileName.split('.').last;
                                  // if (ext == 'pdf') {
                                  //   Get.to(() => PdfView(
                                  //       file:
                                  //           Msg_Storage_Url + widget.fileName));
                                  // } else {
                                  //   Get.snackbar('Invalid File fromat!',
                                  //       "Download this and view from your device download folder.",
                                  //       snackPosition: SnackPosition.BOTTOM,
                                  //       backgroundColor: Colors.red,
                                  //       colorText: Colors.white);
                                  // }
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: AppColors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/map_image.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                widget.Time.toString(),
                                style: TextStyle(
                                  color: AppColors.greybg,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                ],
              ),
      ),
    );
  }
}
// Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Card(
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 15, vertical: 5),
//                               color: widget.sender == true
//                                   ? Colors.white
//                                   : AppColors.green_color,
//                               child: InkWell(
//                                 onTap: () {
//                                   String ext = widget.fileName.split('.').last;
//                                   if (ext == 'pdf') {
//                                     Get.to(() => PdfView(
//                                         file:
//                                             Msg_Storage_Url + widget.fileName));
//                                   } else {
//                                     Get.snackbar('Invalid File fromat!',
//                                         "Download this and view from your device download folder.",
//                                         snackPosition: SnackPosition.BOTTOM,
//                                         backgroundColor: Colors.red,
//                                         colorText: Colors.white);
//                                   }
//                                 },
//                                 child: ListTile(
//                                   title: Text(
//                                     widget.fileTitle,
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: widget.sender == true
//                                             ? Colors.black
//                                             : Colors.white),
//                                   ),
//                                   trailing: IconButton(
//                                     icon: Icon(
//                                       widget.fileExist
//                                           ? Icons.download_done
//                                           : Icons.download,
//                                       color: widget.sender == true
//                                           ? Colors.black
//                                           : Colors.white,
//                                     ),
//                                     onPressed: () async {
//                                       FileDownloader.downloadFile(
//                                           url:
//                                               Msg_Storage_Url + widget.fileName,
//                                           name: widget.fileTitle,
//                                           onProgress: (fileName, progress) {
//                                             Get.snackbar(
//                                                 'Downloading ' + fileName!,
//                                                 'Downloaded ' +
//                                                     progress.toString() +
//                                                     '%',
//                                                 snackPosition:
//                                                     SnackPosition.BOTTOM,
//                                                 backgroundColor: Colors.green,
//                                                 colorText: Colors.white);
//                                           },
//                                           onDownloadCompleted: (path) async {
//                                             Get.snackbar(
//                                                 'Downloading Successfully.',
//                                                 'Downloaded at device path ' +
//                                                     path.toString(),
//                                                 snackPosition:
//                                                     SnackPosition.BOTTOM,
//                                                 backgroundColor: Colors.green,
//                                                 colorText: Colors.white);
//                                           });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.symmetric(horizontal: 15),
//                               child: Text(
//                                 widget.Time.toString(),
//                                 style: TextStyle(
//                                   color: AppColors.greybg,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),