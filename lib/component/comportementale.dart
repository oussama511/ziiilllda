import 'package:flutter/material.dart';

const numColumns = 12;
const numRows = 1;

class ComportementalePage extends StatefulWidget {
  @override
  _ComportementalePageState createState() => _ComportementalePageState();
}

class _ComportementalePageState extends State<ComportementalePage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> cellControllers = [];
  List<Map<String, dynamic>> rows = List.generate(
    numRows,
    (_) => {
      'Ponctualité': '',
      'Présence': '',
      'Responsabilité': '',
      'Relation avec les collègues': '',
      'Organisation du poste de travail': '',
      'Initiative et réactivité': '',
      'Respect et application de règles de travail': '',
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
        title: Text('Comportementale Page'),
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
                DataColumn(label: Text('Ponctualité')),
                DataColumn(label: Text('Présence')),
                DataColumn(label: Text('Responsabilité')),
                DataColumn(label: Text('Relation avec les collègues')),
                DataColumn(label: Text('Organisation du poste de travail')),
                DataColumn(label: Text('Initiative et réactivité')),
                DataColumn(
                    label: Text('Respect et application de règles de travail')),
                DataColumn(label: Text('Column 8')),
                DataColumn(label: Text('Column 9')),
                DataColumn(label: Text('Column 10')),
                DataColumn(label: Text('Column 11')),
                DataColumn(label: Text('Column 12')),
              ],
              rows: rows.map((row) {
                return DataRow(
                  cells: [
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[rows.indexOf(row) * numColumns]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 1]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 2]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 3]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 4]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 5]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 6]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 7]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 8]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 9]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 10]
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: cellControllers.isNotEmpty
                            ? cellControllers[
                                rows.indexOf(row) * numColumns + 11]
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
