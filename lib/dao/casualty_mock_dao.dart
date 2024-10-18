import 'package:flutter/material.dart';
import '../dto/casualty_dto.dart';

class CasualtyDAO {

  // Returns the list of casualties with current vitals aligned with the CasualtySummary
  List<Casualty> getCasualtiesCurrentVitals() {
    return [
      Casualty(
        name: 'Richard James',
        traumaType: 'Trauma',
        time: 'Oct 17, 15:34',
        hr: 64,
        spo2: 93,
        resp: 16,
        bp: '103/77',
        etc02: 24,
        ibp: '113/87',
      ),
      Casualty(
        name: 'Mack Gerhardt',
        traumaType: 'Trauma',
        time: 'Oct 17, 14:50',
        hr: 72,
        spo2: 97,
        resp: 18,
        bp: '110/80',
        etc02: 25,
        ibp: '120/82',
      ),
      Casualty(
        name: 'Charles Grey',
        traumaType: 'Trauma',
        time: 'Oct 17, 14:30',
        hr: 68,
        spo2: 95,
        resp: 15,
        bp: '108/78',
        etc02: 23,
        ibp: '118/76',
      ),
      Casualty(
        name: 'Jonas Blane',
        traumaType: 'Trauma',
        time: 'Oct 17, 13:45',
        hr: -1,  // For cases where vitals are not available
        spo2: -1,
        resp: -1,
        bp: '--/--',
        etc02: -1,
        ibp: '--/--',
      ),
      Casualty(
        name: 'John Smith',
        traumaType: 'Trauma',
        time: 'Oct 17, 13:45',
        hr: 74,
        spo2: 98,
        resp: 17,
        bp: '115/75',
        etc02: 22,
        ibp: '117/79',
      ),
    ];
  }


  // Method to return a list of casualties
  List<CasualtySummary> getCasualtyVitalsInsightCountSummary() {
    return [
      CasualtySummary(
        name: 'Richard James',
        lastUpdated: '2024-10-17 15:34',
        vitals: 8,
        insights: 2,
        severity: 1,
      ),
      CasualtySummary(
        name: 'Mack Gerhardt',
        lastUpdated: '2024-10-17 14:50',
        vitals: 3,
        insights: 0,
        severity: 4,
      ),
      CasualtySummary(
        name: 'Charles Grey',
        lastUpdated: '2024-10-17 14:30',
        vitals: 5,
        insights: 2,
        severity: 3,
      ),
      CasualtySummary(
        name: 'Jonas Blane',
        lastUpdated: '2024-10-17 13:45',
        vitals: 0,
        insights: 0,
        severity: 3,
      ),
      CasualtySummary(
        name: 'John Smith',
        lastUpdated: '2024-10-17 13:45',
        vitals: 10,
        insights: 1,
        severity: 2,
      ),
    ];
  }
}
