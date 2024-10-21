import 'package:flutter/material.dart';

class CasualtyDetailScreen extends StatefulWidget {
  final String casualtyId;  // Accept casualtyId

  CasualtyDetailScreen({required this.casualtyId});  // Update constructor

  @override
  _CasualtyDetailScreenState createState() => _CasualtyDetailScreenState();
}

class _CasualtyDetailScreenState extends State<CasualtyDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedSex;
  String? selectedBloodType;
  String weightUnit = 'KG';
  String heightUnit = 'Meters'; // Add height unit with a default value
  List<String> allergies = [];
  TextEditingController casualtyIdController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  List<String> bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  List<String> sexOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: casualtyIdController,
                decoration: InputDecoration(labelText: 'Casualty ID '),
                validator: (value) => value!.isEmpty ? 'Enter Casualty ID' : null,
              ),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) => value!.isEmpty ? 'Enter First Name' : null,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) => value!.isEmpty ? 'Enter Last Name' : null,
              ),
              DropdownButtonFormField<String>(
                value: selectedSex,
                decoration: InputDecoration(labelText: 'Sex'),
                items: sexOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedSex = newValue;
                  });
                },
                validator: (value) => value == null ? 'Select Sex' : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: weightController,
                      decoration: InputDecoration(labelText: 'Weight'),
                      keyboardType: TextInputType.number,
                      validator: (value) => value!.isEmpty ? 'Enter Weight' : null,
                    ),
                  ),
                  SizedBox(width: 16),
                  DropdownButton<String>(
                    value: weightUnit,
                    items: ['KG', 'Lbs'].map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        weightUnit = newValue!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: heightController,
                      decoration: InputDecoration(labelText: 'Height'),
                      keyboardType: TextInputType.number,
                      validator: (value) => value!.isEmpty ? 'Enter Height' : null,
                    ),
                  ),
                  SizedBox(width: 16),
                  DropdownButton<String>(
                    value: heightUnit,
                    items: ['Meters', 'Feet/Inches'].map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        heightUnit = newValue!;
                      });
                    },
                  ),
                ],
              ),
              TextFormField(
                controller: dateOfBirthController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dateOfBirthController.text = "${pickedDate.toLocal()}".split(' ')[0];
                    });
                  }
                },
                validator: (value) => value!.isEmpty ? 'Enter Date of Birth' : null,
                readOnly: true,
              ),
              DropdownButtonFormField<String>(
                value: selectedBloodType,
                decoration: InputDecoration(labelText: 'Blood Type'),
                items: bloodTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedBloodType = newValue;
                  });
                },
                validator: (value) => value == null ? 'Select Blood Type' : null,
              ),
              SizedBox(height: 16),
              Text('Allergies:'),
              ListView.builder(
                shrinkWrap: true,
                itemCount: allergies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(allergies[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          allergies.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save patient details
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
