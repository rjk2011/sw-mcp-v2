import 'package:flutter/material.dart';

class CasualtySummary {
  final String casualtyId;

  final String name;
  final String lastUpdated;
  final int vitals;
  final int insights;
  final int severity;

  // Constructor
  CasualtySummary({
    required this.casualtyId,
    required this.name,
    required this.lastUpdated,
    required this.vitals,
    required this.insights,
    required this.severity,

  });
}

class Casualty {
  final String casualtyId;
  final String name;
  final String traumaType;
  final String time;
  final int hr;     // Heart Rate
  final int spo2;   // SPO2
  final int resp;   // Respiration Rate
  final String bp;  // Blood Pressure
  final int etc02;  // ETCO2
  final String ibp; // IBP (Invasive Blood Pressure)

  Casualty({
    required this.casualtyId,
    required this.name,
    required this.traumaType,
    required this.time,
    required this.hr,
    required this.spo2,
    required this.resp,
    required this.bp,
    required this.etc02,
    required this.ibp,
  });
}