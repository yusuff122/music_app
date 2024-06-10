
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> file_share(BuildContext context, String path) async {
     
     XFile files = XFile(path);
     await Share.shareXFiles([files],text: 'mp3' );
} 
