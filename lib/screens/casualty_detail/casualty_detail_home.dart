import 'package:flutter/material.dart';

import 'casualty_detail_screen.dart';

class CasualtyDetailHome extends StatefulWidget {

  final String casualtyId;

  CasualtyDetailHome({required this.casualtyId});

  @override
  _CasualtyDetailHomeState createState() => _CasualtyDetailHomeState();
}

class _CasualtyDetailHomeState extends State<CasualtyDetailHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Example badge counts for each tab
  Map<String, int> badgeCounts = {
    'Details': 0,
    'MOI': 0,
    'Vitals': 5,
    'Treatments': 0,
    'Complications': 1,
    'Events': 0,
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildTabWithBadge(String tabName) {
    int badgeCount = badgeCounts[tabName] ?? 0;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0), // Add space for the badge
          child: Tab(text: tabName),
        ),
        if (badgeCount > 0)
          Positioned(
            right: 0,
            top: 8, // Adjust vertical position
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                '$badgeCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Casualty Details'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: isLandscape
              ? TabBar(
            controller: _tabController,
            isScrollable: false, // Use full width in landscape mode
            tabs: [
              buildTabWithBadge('General'),
              buildTabWithBadge('Injury'),
              buildTabWithBadge('Vitals'),
              buildTabWithBadge('Treatments'),
              buildTabWithBadge('Complications'),
              buildTabWithBadge('Events'),
            ],
          )
              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: TabBar(
              controller: _tabController,
              isScrollable: true, // Scrollable in portrait mode
              tabs: [
                buildTabWithBadge('General'),
                buildTabWithBadge('Injury'),
                buildTabWithBadge('Vitals'),
                buildTabWithBadge('Treatments'),
                buildTabWithBadge('Complications'),
                buildTabWithBadge('Events'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CasualtyDetailScreen(casualtyId: widget.casualtyId),
          // PlaceholderTabScreen(tabName: 'Details'),
          PlaceholderTabScreen(tabName: 'MOI'),
          PlaceholderTabScreen(tabName: 'Vitals'),
          PlaceholderTabScreen(tabName: 'Treatments'),
          PlaceholderTabScreen(tabName: 'Complications'),
          PlaceholderTabScreen(tabName: 'Events'),
        ],
      ),
    );
  }
}

class PlaceholderTabScreen extends StatelessWidget {
  final String tabName;

  PlaceholderTabScreen({required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        tabName,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
