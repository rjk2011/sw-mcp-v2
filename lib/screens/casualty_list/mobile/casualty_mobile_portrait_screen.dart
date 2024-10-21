import 'package:flutter/material.dart';
import '../../../components/severitycard_widget.dart';
import '../../../components/casualtysummarycard_widget.dart';
import '../../../dao/casualty_mock_dao.dart';
import '../../../dto/casualty_dto.dart';
import '../../casualty_detail/casualty_detail_home.dart';

class CasualtyMobilePortraitScreen extends StatefulWidget {
  @override
  _CasualtyMobilePortraitScreenState createState() => _CasualtyMobilePortraitScreenState();
}

class _CasualtyMobilePortraitScreenState extends State<CasualtyMobilePortraitScreen> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Casualties'),
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
        child: _buildPortraitLayout(casualties),
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
              return GestureDetector(
                onTap: () {
                  // Navigate to the CasualtyDetailHome screen with the casualtyId
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CasualtyDetailHome(casualtyId: casualty.casualtyId),
                    ),
                  );
                },
                child: CasualtySummaryCard(
                  name: casualty.name,
                  lastUpdated: casualty.lastUpdated,
                  vitals: casualty.vitals,
                  insights: casualty.insights,
                  severity: casualty.severity,
                ),
              );
            },
          ),
        ),
      ],
    );
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
