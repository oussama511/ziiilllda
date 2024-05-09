import 'package:flutter/material.dart';
import 'package:operator_forvia/style/style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AudiPage extends StatelessWidget {
  final String pdfPath = 'pdf/guide-PFE_version-finale.pdf';
  final String pageTitle = 'Audi Manual';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audi Page'),
      ),
      body: Center(
        child: PDFViewerPage(
          pdfPath: pdfPath,
          pageTitle: pageTitle,
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
