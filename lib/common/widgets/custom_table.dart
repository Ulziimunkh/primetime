import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<String> columnHeaders;
  final List<List<String>> rows;

  const CustomTable({
    super.key,
    required this.columnHeaders,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: columnHeaders
            .map((header) => DataColumn(
                  label: Text(
                    header,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
            .toList(),
        rows: rows
            .map((row) => DataRow(
                  cells: row
                      .map((cell) => DataCell(
                            Text(cell),
                          ))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}