import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCP Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Simwerx Guardian Twin Section
          _buildSettingsSection(
            icon: Icons.analytics,
            title: 'Simwerx Guardian Twin',
            description: 'Provides real-time insights by combining live data and predictive analytics, '
                'empowering medics to make fast, informed decisions on the battlefield.',
            bullets: ['Individual Twins', 'Simulation Engine', 'Predictive Analytics'],
          ),
          SizedBox(height: 20),

          // Simwerx RealX Section
          _buildSettingsSection(
            icon: Icons.auto_graph,
            title: 'Simwerx RealX',
            description: 'Delivers standardized simulations ensuring consistent training for prolonged casualty_list care environments.',
            bullets: ['Dynamic Physiology Engine', 'Scenario Library', 'Performance Evaluation'],
          ),
          SizedBox(height: 20),

          // Integration Section
          _buildSettingsSection(
            icon: Icons.integration_instructions,
            title: 'Integration',
            description: 'Enables Data Integration with 3rd Parties',
            bullets: ['Simwerx', 'BATDOK', 'BlueStaq'],
          ),
          SizedBox(height: 20),

          // Triage Section
          _buildSettingsSectionWithIconOnly(
            icon: Icons.add_box,
            title: 'Triage',
            bullets: ['Triage Algos', 'Themes'],
          ),
          SizedBox(height: 20),

          // Knowledge Base Section
          _buildSettingsSectionWithIconOnly(
            icon: Icons.info_outline,
            title: 'Knowledge Base',
            bullets: ['Protocols', 'Decision Support', 'Best Practice'],
          ),
          SizedBox(height: 20),

          // Beta Features Section
          _buildSettingsSectionWithIconOnly(
            icon: Icons.access_alarm,
            title: 'Beta Features',
            bullets: ['Telemedicine', 'Digital Blanket'],
          ),
        ],
      ),
    );
  }

  // A method to create a settings section with title, description, bullets, and icon
  Widget _buildSettingsSection({
    required IconData icon,
    required String title,
    required String description,
    required List<String> bullets,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 30),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        SizedBox(height: 10),
        for (String bullet in bullets)
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              bullet,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
          ),
      ],
    );
  }

  // A method to create a settings section with only bullets and title
  Widget _buildSettingsSectionWithIconOnly({
    required IconData icon,
    required String title,
    required List<String> bullets,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 30),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        for (String bullet in bullets)
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              bullet,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
          ),
      ],
    );
  }
}
