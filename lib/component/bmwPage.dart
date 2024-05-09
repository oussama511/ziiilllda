import 'package:flutter/material.dart';
import 'package:operator_forvia/style/style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BMWPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMW Page'),
      ),
      body: Center(
        child: PDFViewerPage(
          pdfPath: 'pdf/bmw_manual.pdf',
          pageTitle: 'BMW Manual',
        ),
      ),
    );
  }
}

class PDFViewerPage extends StatelessWidget {
  final String pdfPath;
  final String pageTitle;

  const PDFViewerPage({
    required this.pdfPath,
    required this.pageTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: SfPdfViewer.asset(
        pdfPath,
        pageLayoutMode: PdfPageLayoutMode.single,
      ),
    );
  }
}
