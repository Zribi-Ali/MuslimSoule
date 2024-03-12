import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QrWidget extends StatefulWidget {
  const QrWidget({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  State<QrWidget> createState() => _QrWidgetState();
}

class _QrWidgetState extends State<QrWidget> {
  late GlobalKey globalKey;

  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.data.isNotEmpty ? true : false,
      child: Column(
        children: [
          RepaintBoundary(
            key: globalKey,
            child: QrImageView(
              data: widget.data,
              version: QrVersions.auto,
              size: 320,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                captureAndSharePng();
              },
              child: Text("Save"))
        ],
      ),
    );
  }

  Future<void> captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext!
          .findRenderObject()! as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      await Share.shareFiles(['${tempDir.path}/image.png'],
          text: 'QR Code Image');
    } catch (e) {
      print(e.toString());
    }
  }
}

/* QrImage QrWidgetD(data){
  return QrImage(
   data
  );
} */