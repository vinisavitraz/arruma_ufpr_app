import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {

  final double? height;
  final double width;
  final BoxFit fit;
  final int? fileMetadataId;

  const CustomNetworkImage({
    Key? key,
    required this.height,
    required this.width,
    required this.fit,
    required this.fileMetadataId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fileMetadataId != null ? Image.network(
      '${AppHttpClient.remoteHost}/file/$fileMetadataId',
      fit: fit,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox.shrink();
      },
    ) :
    const SizedBox.shrink();
  }
}