import 'package:first_priority_app/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String title;
  final String url;

  const PdfViewerScreen({
    Key key,
    this.title,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: title,
      ),
      body: SfPdfViewer.network(url),
    );
  }
}
