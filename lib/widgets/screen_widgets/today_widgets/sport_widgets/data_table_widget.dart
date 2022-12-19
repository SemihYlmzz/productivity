import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataTableWidget extends StatelessWidget {
  final String exercise1;
  final String exercise1Reps;
  final String exercise1Set;
  final String exercise1Dif;
  final bool exercise1Done;

  final String? exercise2;
  final String? exercise2Reps;
  final String? exercise2Set;
  final String? exercise2Dif;
  final bool exercise2Done;

  const DataTableWidget(
      {Key? key,
      required this.exercise1,
      required this.exercise1Reps,
      required this.exercise2,
      required this.exercise2Reps,
      required this.exercise1Done,
      required this.exercise2Done,
      required this.exercise1Set,
      required this.exercise2Set,
      required this.exercise1Dif,
      this.exercise2Dif = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataTextStyle: dataCellTextStyle(),
      headingTextStyle: headingCellsTextStyle(),
      decoration: buildBoxDecoration(),
      border: buildTableBorder(),
      columns: [
        const DataColumn(
          label: Text(''),
        ),
        DataColumn(
          label: Text(exercise1),
        ),
        DataColumn(
          label: Text(exercise2 != null ? exercise2! : ''),
        ),
      ],
      rows: [
        tableRows('Rep', exercise1Reps, exercise2Reps),
        tableRows('Set', exercise1Set, exercise2Set),
        tableRows('Dif', exercise1Dif, exercise2Dif),
      ],
    );
  }

  TextStyle headingCellsTextStyle() {
    return GoogleFonts.dosis(
      color: Colors.white,
      fontSize: 24,
      shadows: [
        const Shadow(
          color: Colors.black,
          offset: Offset(0, 0),
          blurRadius: 20,
        ),
      ],
    );
  }

  DataRow tableRows(String cell1, String? cell2, String? cell3) {
    return DataRow(
      cells: [
        DataCell(
          Center(
            child: Text(
              cell1,
              style: dataCellTextStyle(),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              cell2 ?? '',
              style: dataCellTextStyle(),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              cell3 ?? '',
              style: dataCellTextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle dataCellTextStyle() {
    return GoogleFonts.dosis(
      fontSize: 18,
      color: exercise1Done ? Colors.greenAccent : Colors.white,
      shadows: const [
        Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 20)
      ],
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(
        16,
      ),
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Colors.deepOrange,
          Colors.deepPurple.shade900,
        ],
      ),
    );
  }

  TableBorder buildTableBorder() {
    return TableBorder(
      borderRadius: BorderRadius.circular(
        16,
      ),
      top: const BorderSide(
        color: Colors.white,
      ),
      bottom: const BorderSide(
        color: Colors.white,
      ),
      left: const BorderSide(
        color: Colors.white,
      ),
      right: const BorderSide(
        color: Colors.white,
      ),
      horizontalInside: const BorderSide(
        color: Colors.white,
      ),
      verticalInside: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
