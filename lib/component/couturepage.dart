import 'package:flutter/material.dart';

class Couturepage extends StatefulWidget {
  @override
  _CouturepageState createState() => _CouturepageState();
}

class _CouturepageState extends State<Couturepage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> cellControllers = [];
  List<Map<String, dynamic>> rows = List.generate(
    1,
    (_) => {
      'column 1': '',
      'Column 2': '',
      'Column 3': '',
      'Column 4': '',
      'Column 5': '',
      'Column 6': '',
      'Column 7': '',
      'Column 8': '',
      'Column 9': '',
      'Column 10': '',
      'Column 11': '',
      'Column 12': '',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Couture Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 30.0,
              columns: [
                DataColumn(label: Text('')),
                DataColumn(label: Text('Couture')),
                for (var i = 2; i <= 12; i++)
                  DataColumn(label: Text('Column $i')),
              ],
              rows: rows.map((row) {
                return DataRow(
                  cells: [
                    DataCell(Text('ponctualité')),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[rows.indexOf(row)]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    for (var i = 2; i <= 12; i++)
                      DataCell(
                        TextFormField(
                          controller: cellControllers.isNotEmpty
                              ? cellControllers[rows.indexOf(row) * 12 + i - 2]
                              : null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
