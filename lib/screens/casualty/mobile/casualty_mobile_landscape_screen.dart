import 'package:flutter/material.dart';
import '../../../components/severitycard_widget.dart';
import '../../../components/casualtysummarycard_widget.dart';
import '../../../dao/casualty_mock_dao.dart';
import '../../../dto/casualty_dto.dart';

class CasualtyMobileLandscapeScreen extends StatefulWidget {
  @override
  _CasualtyMobileLandscapeScreenState createState() => _CasualtyMobileLandscapeScreenState();
}

class _CasualtyMobileLandscapeScreenState extends State<CasualtyMobileLandscapeScreen> {

  // Instantiate the CasualtyDAO
  final CasualtyDAO casualtyDAO = CasualtyDAO();

  bool _sortAscending = true;
  // Variable to track the sorting column
  String _sortColumn = 'name';

  @override
  Widget build(BuildContext context) {

    // Fetch the list of casualties
    List<CasualtySummary> casualties = casualtyDAO.getCasualtyVitalsInsightCountSummary();

    // Check if the device is in portrait or landscape mode
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simwerx Guardian Twin 2'),
        actions: [

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildLandscapeLayout(casualties), // Display landscape table
      ),
    );
  }


  // Function to build the landscape layout (Table)
  Widget _buildLandscapeLayout(List<CasualtySummary> casualties) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortAscending: _sortAscending,
        sortColumnIndex: _getColumnIndex(),
        columns: [
          DataColumn(
            label: Text('Name'),
            onSort: (columnIndex, _) {
              setState(() {
                _sortColumn = 'name';
                _sortAscending = !_sortAscending;
              });
            },
          ),
          DataColumn(
            label: Text('Last Updated'),
            onSort: (columnIndex, _) {
              setState(() {
                _sortColumn = 'lastUpdated';
                _sortAscending = !_sortAscending;
              });
            },
          ),
          DataColumn(
            label: Text('Severity'),
            onSort: (columnIndex, _) {
              setState(() {
                _sortColumn = 'severity';
                _sortAscending = !_sortAscending;
              });
            },
          ),
          DataColumn(
            label: Text('Vitals'),
            onSort: (columnIndex, _) {
              setState(() {
                _sortColumn = 'vitals';
                _sortAscending = !_sortAscending;
              });
            },
          ),
          DataColumn(
            label: Text('Insights'),
            onSort: (columnIndex, _) {
              setState(() {
                _sortColumn = 'insights';
                _sortAscending = !_sortAscending;
              });
            },
          ),
        ],
        rows: casualties.map((casualty) {
          return DataRow(
            cells: [
              DataCell(Text(casualty.name)),
              DataCell(Text(casualty.lastUpdated)),
              DataCell(Text(casualty.severity.toString())),
              DataCell(Text(casualty.vitals.toString())),
              DataCell(Text(casualty.insights.toString())),
            ],
          );
        }).toList(),
      ),
    );
  }

  // Helper to get the sort column index based on the _sortColumn variable
  int? _getColumnIndex() {
    switch (_sortColumn) {
      case 'name':
        return 0;
      case 'lastUpdated':
        return 1;
      case 'severity':
        return 2;
      case 'vitals':
        return 3;
      case 'insights':
        return 4;
      default:
        return null;
    }
  }

  // Function to show the sort bottom sheet
  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Most Recent First'),
                onTap: () {
                  setState(() {
                    _sortColumn = 'lastUpdated';
                    _sortAscending = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Most Recent Last'),
                onTap: () {
                  setState(() {
                    _sortColumn = 'lastUpdated';
                    _sortAscending = true;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Severity Desc'),
                onTap: () {
                  setState(() {
                    _sortColumn = 'severity';
                    _sortAscending = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Severity Asc'),
                onTap: () {
                  setState(() {
                    _sortColumn = 'severity';
                    _sortAscending = true;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Number of Insights'),
                onTap: () {
                  setState(() {
                    _sortColumn = 'insights';
                    _sortAscending = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Number of Vitals'),
                onTap: () {
                  setState(() {
                    _sortColumn = 'vitals';
                    _sortAscending = false;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
