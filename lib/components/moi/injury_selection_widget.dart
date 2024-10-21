import 'package:flutter/material.dart';

class InjurySelectionWidget extends StatefulWidget {
  @override
  _InjurySelectionWidgetState createState() => _InjurySelectionWidgetState();
}

class _InjurySelectionWidgetState extends State<InjurySelectionWidget> {
  final List<String> moiOptions = ['Burn', 'Crush', 'GSW', 'Stab', 'Blast'];
  final List<String> injuryTypes = ['Amputation', 'Burn', 'Deformity', 'Impaled'];

  // Correctly defined bodyParts with left/right distinctions where appropriate
  final List<Map<String, String>> bodyParts = [
    {'label': 'Head', 'value': 'Head'},
    {'label': 'Neck', 'value': 'Neck'},
    {'label': 'Chest', 'value': 'Chest'},
    {'label': 'Stomach', 'value': 'Stomach'},
    {'label': 'Left Arm', 'value': 'Left Arm'},
    {'label': 'Right Arm', 'value': 'Right Arm'},
    {'label': 'Left Leg', 'value': 'Left Leg'},
    {'label': 'Right Leg', 'value': 'Right Leg'},
    {'label': 'Left Foot', 'value': 'Left Foot'},
    {'label': 'Right Foot', 'value': 'Right Foot'},
  ];

  List<String> selectedMOIs = [];
  String? selectedInjuryType;
  String? selectedBodyPart;

  List<Map<String, String>> injuries = [];

  void _addInjury() {
    if (selectedInjuryType != null && selectedBodyPart != null) {
      setState(() {
        injuries.add({
          'InjuryType': selectedInjuryType!,
          'BodyPart': selectedBodyPart!,
        });
        selectedInjuryType = null;
        selectedBodyPart = null;
      });
    }
  }

  void _toggleMOISelection(String moi) {
    setState(() {
      if (selectedMOIs.contains(moi)) {
        selectedMOIs.remove(moi);
      } else {
        selectedMOIs.add(moi);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Methods of Injury:'),
            Wrap(
              spacing: 10.0,
              children: moiOptions.map((moi) {
                return FilterChip(
                  label: Text(moi),
                  selected: selectedMOIs.contains(moi),
                  onSelected: (selected) {
                    _toggleMOISelection(moi);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedInjuryType,
              items: injuryTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedInjuryType = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Injury Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('Select Body Part:'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two columns for body parts
                childAspectRatio: 4.0, // Adjust height-to-width ratio of each tile
                children: bodyParts.map((part) {
                  return RadioListTile<String>(
                    title: Text(part['label']!),
                    value: part['value']!, // Forcefully asserting non-nullable value
                    groupValue: selectedBodyPart,
                    onChanged: (value) {
                      setState(() {
                        selectedBodyPart = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addInjury,
              child: Text('Add Injury'),
            ),
            SizedBox(height: 16),
            Text('Injury List:'),
            Expanded(
              child: ListView.builder(
                itemCount: injuries.length,
                itemBuilder: (context, index) {
                  final injury = injuries[index];
                  return ListTile(
                    title: Text(
                        'Injury: ${injury['InjuryType']}, Location: ${injury['BodyPart']}'),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}


