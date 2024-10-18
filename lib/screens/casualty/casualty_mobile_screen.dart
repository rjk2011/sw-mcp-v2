import 'package:flutter/material.dart';
import '../../components/severitycard_widget.dart';
import '../../components/casualtysummarycard_widget.dart';
import '../../dao/casualty_mock_dao.dart';
import '../../dto/casualty_dto.dart';

class CasualtyMobileScreen extends StatefulWidget {
  @override
  _CasualtyMobileScreenState createState() => _CasualtyMobileScreenState();
}

class _CasualtyMobileScreenState extends State<CasualtyMobileScreen> {
  final int highCount = 12;
  final int medCount = 0;
  final int lowCount = 12;

  // Instantiate the CasualtyDAO
  final CasualtyDAO casualtyDAO = CasualtyDAO();

  // Variable to track the visibility of the search bar
  bool _isSearchVisible = false;

  // Sort state for each column in the table
  bool _sortAscending = true;

  // Variable to track the sorting column
  String _sortColumn = 'name';

  // Sort casualties by selected column
  void _sortCasualties(List<CasualtySummary> casualties) {
    casualties.sort((a, b) {
      switch (_sortColumn) {
        case 'name':
          return _sortAscending ? a.name.compareTo(b.name) : b.name.compareTo(a.name);
        case 'lastUpdated':
          return _sortAscending ? a.lastUpdated.compareTo(b.lastUpdated) : b.lastUpdated.compareTo(a.lastUpdated);
        case 'severity':
          return _sortAscending ? a.severity.compareTo(b.severity) : b.severity.compareTo(a.severity);
        case 'vitals':
          return _sortAscending ? a.vitals.compareTo(b.vitals) : b.vitals.compareTo(a.vitals);
        case 'insights':
          return _sortAscending ? a.insights.compareTo(b.insights) : b.insights.compareTo(a.insights);
        default:
          return 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the list of casualties
    List<CasualtySummary> casualties = casualtyDAO.getCasualtyVitalsInsightCountSummary();

    // Sort the casualties based on the selected column
    _sortCasualties(casualties);

    // Check if the device is in portrait or landscape mode
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simwerx Guardian Twin 2'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Toggle the search bar visibility
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isPortrait
            ? _buildPortraitLayout(casualties) // Display portrait layout
            : _buildLandscapeLayout(casualties), // Display landscape table
      ),
    );
  }

  // Function to build the portrait layout
  Widget _buildPortraitLayout(List<CasualtySummary> casualties) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show the search bar if _isSearchVisible is true
        if (_isSearchVisible)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        SizedBox(height: _isSearchVisible ? 10 : 0), // Only add spacing if the search bar is visible

        // Show the Casualty Severity Count Row if _isSearchVisible is true
        if (_isSearchVisible)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SeverityCardWidget(label: 'High', count: highCount, color: Colors.red),
              SeverityCardWidget(label: 'Med', count: medCount, color: Colors.orange),
              SeverityCardWidget(label: 'Low', count: lowCount, color: Colors.yellow),
            ],
          ),
        SizedBox(height: _isSearchVisible ? 10 : 0), // Only add spacing if the severity row is visible

        // Row 3: Casualty List with Sort button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Casualty List',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton(
              onPressed: () {
                // Show the sort bottom sheet
                _showSortBottomSheet(context);
              },
              child: Text('Sort'),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: casualties.length,
            itemBuilder: (context, index) {
              CasualtySummary casualty = casualties[index];
              return CasualtySummaryCard(
                name: casualty.name,
                lastUpdated: casualty.lastUpdated,
                vitals: casualty.vitals,
                insights: casualty.insights,
                severity: casualty.severity,
              );
            },
          ),
        ),
      ],
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
