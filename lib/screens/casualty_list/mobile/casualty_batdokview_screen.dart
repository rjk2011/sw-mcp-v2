import 'package:flutter/material.dart';
import 'package:uitest/dto/casualty_dto.dart';
import '../../../dao/casualty_mock_dao.dart';
import '../../casualty_detail/casualty_detail_home.dart';

class CasualtyScreenBatdok extends StatelessWidget {
  final CasualtyDAO casualtyDAO = CasualtyDAO();

  @override
  Widget build(BuildContext context) {
    // Call the DAO method to get the list of casualties
    List<Casualty> casualties = casualtyDAO.getCasualtiesCurrentVitals();

    return Scaffold(
      appBar: AppBar(
        title: Text('Casualty Vitals'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Add filter functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.handshake),
            onPressed: () {
              // Add handoff functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Make scrolling horizontal
          child: Row(
            children: casualties.map((casualty) => buildCasualtyCard(context,casualty)).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildCasualtyCard(BuildContext context, Casualty casualty) {
    return Container(
      width: 200, // Set a fixed width for each card
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 8), // Adjust horizontal margin for spacing between cards
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjusts the card height to the content size
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                casualty.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text('${casualty.time} - ${casualty.traumaType}'),
              SizedBox(height: 10),
              buildVitalRow('HR', '${casualty.hr}'),
              buildVitalRow('SPO2', '${casualty.spo2}'),
              buildVitalRow('Resp', '${casualty.resp}'),
              buildVitalRow('BP', casualty.bp),
              buildVitalRow('ETCO2', '${casualty.etc02}'),
              buildVitalRow('IBP', casualty.ibp),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to CasualtyDetailHome and pass the casualtyId
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CasualtyDetailHome(casualtyId: casualty.casualtyId),
                    ),
                  );
                },
                child: Text('Document'),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildVitalRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}
