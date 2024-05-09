import 'package:flutter/material.dart';
import 'package:operator_forvia/component/AppBarActionItems.dart';
import 'package:operator_forvia/component/header.dart';
import 'package:operator_forvia/component/paymentdetailList.dart';
import 'package:operator_forvia/component/sidemenu.dart';
import 'package:operator_forvia/config/responsive.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/style/colors.dart';
import 'package:operator_forvia/style/style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Dashboard2 extends StatefulWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard2> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  // List to store operators
  List<Operator> operators = [];

  // Controller for operator name
  TextEditingController nameController = TextEditingController();

  // Controller for operator last name
  TextEditingController lastNameController = TextEditingController();

  // Controller for code RFID
  TextEditingController codeRfidController = TextEditingController();

  // Controller for matricule
  TextEditingController matriculeController = TextEditingController();

  // Gender options
  final List<String> genderOptions = ['Male', 'Female'];

  // Controller for selected gender
  String selectedGender = 'Male';

  // Experience options
  final List<String> experienceOptions = ['Débutant', 'Amateur', 'Avancée'];

  // Controller for selected experience
  String selectedExperience = 'Débutant';

  // Index of the operator being modified
  int? modifyIndex;

  // Function to add operator
  void addOperator() {
    // Check if all fields are filled out
    if (nameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        codeRfidController.text.isNotEmpty &&
        matriculeController.text.isNotEmpty) {
      setState(() {
        // Check if we're modifying an existing operator
        if (modifyIndex != null) {
          operators[modifyIndex!] = Operator(
            name: nameController.text,
            lastName: lastNameController.text,
            gender: selectedGender,
            codeRfid: codeRfidController.text,
            matricule: matriculeController.text,
            experience: selectedExperience,
          );
          modifyIndex = null; // Reset modifyIndex after modification
        } else {
          operators.add(
            Operator(
              name: nameController.text,
              lastName: lastNameController.text,
              gender: selectedGender,
              codeRfid: codeRfidController.text,
              matricule: matriculeController.text,
              experience: selectedExperience,
            ),
          );
        }
        // Clear text controllers after adding or modifying operator
        nameController.clear();
        lastNameController.clear();
        codeRfidController.clear();
        matriculeController.clear();
        // Reset selected gender and experience
        selectedGender = 'Male';
        selectedExperience = 'Débutant';
      });
    } else {
      // Show a dialog or snackbar indicating that all fields are required
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('All fields are required.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Function to delete operator
  void deleteOperator(int index) {
    setState(() {
      operators.removeAt(index);
    });
  }

  // Function to set the modifyIndex and populate the fields for modification
  void startModifyOperator(int index) {
    setState(() {
      modifyIndex = index;
      nameController.text = operators[index].name;
      lastNameController.text = operators[index].lastName;
      selectedGender = operators[index].gender;
      codeRfidController.text = operators[index].codeRfid;
      matriculeController.text = operators[index].matricule;
      selectedExperience = operators[index].experience;
    });
  }

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
                      // Operator management section
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Operator Management',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(labelText: 'Last Name'),
                      ),
                      TextField(
                        controller: codeRfidController,
                        decoration: InputDecoration(labelText: 'Code RFID'),
                      ),
                      TextField(
                        controller: matriculeController,
                        decoration: InputDecoration(labelText: 'Matricule'),
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue!;
                          });
                        },
                        items: genderOptions.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        decoration: InputDecoration(labelText: 'Gender'),
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedExperience,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedExperience = newValue!;
                          });
                        },
                        items: experienceOptions.map((String experience) {
                          return DropdownMenuItem<String>(
                            value: experience,
                            child: Text(experience),
                          );
                        }).toList(),
                        decoration: InputDecoration(labelText: 'Experience'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          addOperator();
                        },
                        child: Text('Add Operator'),
                      ),
                      SizedBox(height: 20),
                      // End of operator management section

                      // Operator tables
                      if (operators.isNotEmpty)
                        Column(
                          children: List.generate(
                            (operators.length / 3).ceil(),
                            (index) {
                              return Row(
                                children: List.generate(
                                  3,
                                  (idx) {
                                    final currentIndex = index * 3 + idx;
                                    return Expanded(
                                      child: currentIndex < operators.length
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: OperatorTable(
                                                operator:
                                                    operators[currentIndex],
                                                onDelete: () {
                                                  deleteOperator(currentIndex);
                                                },
                                                onModify: () {
                                                  startModifyOperator(
                                                      currentIndex);
                                                },
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
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

class Operator {
  final String name;
  final String lastName;
  final String gender;
  final String codeRfid;
  final String matricule;
  final String experience;

  Operator({
    required this.name,
    required this.lastName,
    required this.gender,
    required this.codeRfid,
    required this.matricule,
    required this.experience,
  });
}

class OperatorTable extends StatelessWidget {
  final Operator operator;
  final VoidCallback onDelete;
  final VoidCallback onModify;

  const OperatorTable({
    required this.operator,
    required this.onDelete,
    required this.onModify,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Operator Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              DataTable(
                columns: [
                  DataColumn(
                      label:
                          SizedBox.shrink()), // Empty column to remove labels
                  DataColumn(
                      label:
                          SizedBox.shrink()), // Empty column to remove labels
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Name')),
                    DataCell(Text(operator.name)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Last Name')),
                    DataCell(Text(operator.lastName)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gender')),
                    DataCell(Text(operator.gender)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Code RFID')),
                    DataCell(Text(operator.codeRfid)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Matricule')),
                    DataCell(Text(operator.matricule)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Experience')),
                    DataCell(Text(operator.experience)),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      ElevatedButton(
                        onPressed: onDelete,
                        child: Text('Delete'),
                      ),
                    ),
                    DataCell(
                      ElevatedButton(
                        onPressed: onModify,
                        child: Text('Modify'),
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
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
