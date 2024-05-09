import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:operator_forvia/component/AppBarActionItems.dart';
import 'package:operator_forvia/component/header.dart';
import 'package:operator_forvia/component/paymentdetailList.dart';
import 'package:operator_forvia/component/sidemenu.dart';
import 'package:operator_forvia/config/responsive.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/style/colors.dart';
import 'package:operator_forvia/style/style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Dashboard3 extends StatefulWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard3> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(
        width: 100,
        child: SideMenu(
          screenHeight: screenHeight,
        ),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: AppColors.black,
                ),
              ),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              child: SizedBox(),
              preferredSize: Size.zero,
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(screenHeight: screenHeight),
              ),
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                height: screenHeight,
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          runSpacing: 20.0,
                          spacing: 20.0,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            // Removed InfoCard widgets
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      // Historytable() removed
                      if (!Responsive.isDesktop(context)) PaymentDetailList()
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: screenHeight,
                  color: AppColors.secondaryBg,
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [AppBarActionItems(), PaymentDetailList()],
                    ),
                  ),
                ),
              ),
          ],
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
      ), // Use SfPdfViewer.asset to load PDF from asset
    );
  }
}
