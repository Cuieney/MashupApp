import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImageView extends StatefulWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomImageView(
      {Key key, this.url, this.width, this.height, this.fit})
      : super(key: key);

  @override
  _CustomImageViewState createState() => _CustomImageViewState();
}

class _CustomImageViewState extends State<CustomImageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: (widget.url == null || widget.url.length <= 0)
          ? CachedNetworkImage(
              fit: widget.fit,
              imageUrl: "null url",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error))
          : widget.url.contains("://")
              ? CachedNetworkImage(
                  fit: widget.fit,
                  imageUrl: widget.url,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error))
              : Image.file(
                  File(widget.url),
                  fit: widget.fit,
                ),
    );
  }
}
