import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';

bool isWeb = (defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android);

class CustomImageView extends StatefulWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomImageView({Key key, this.url, this.width, this.height, this.fit})
      : super(key: key);

  @override
  _CustomImageViewState createState() => _CustomImageViewState();
}

class _CustomImageViewState extends State<CustomImageView> {
  @override
  Widget build(BuildContext context) {
    Widget widgetView;
    Widget libraryView;
    bool urlIsEmpty = ((widget.url == null) || (widget.url == ''));
    String url = urlIsEmpty ? 'url' : widget.url;
    if (!isWeb) {
      libraryView = CachedNetworkImage(
          fit: widget.fit,
          imageUrl: url,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error));
    } else {
      libraryView = Image(
        image: new NetworkImage(url),
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
      );
    }

    if (widget.url.contains("://")) {
      widgetView = libraryView;
    } else if (widget.url.contains("assets")) {
      widgetView = Image.asset(widget.url);
    } else if(widget.url.contains("data:image/png;base64")){
      var prefix = "data:image/png;base64,";
      var bStr = widget.url.substring(prefix.length);
      Uint8List bytes = Base64Decoder().convert(bStr);
      widgetView = Image.memory(
        bytes,
        fit: widget.fit,
      );

    } else{
      widgetView = Image.file(
        File(widget.url),
        fit: widget.fit,
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: widgetView,
    );
  }
}
