// To parse this JSON data, do
//
//     final modelInvert = modelInvertFromJson(jsonString);

import 'dart:convert';

ModelInvert modelInvertFromJson(String str) =>
    ModelInvert.fromJson(json.decode(str));

String modelInvertToJson(ModelInvert data) => json.encode(data.toJson());

class ModelInvert {
  ModelInvert({
    this.unit,
    this.lokasi,
    this.equipment,
    this.merk,
    this.tipe,
    this.tanggalDanJam,
    this.inverterModul,
    this.baypasModul,
  });

  String unit;
  String lokasi;
  String equipment;
  String merk;
  String tipe;
  DateTime tanggalDanJam;
  String inverterModul;
  String baypasModul;

  factory ModelInvert.fromJson(Map<String, dynamic> json) => ModelInvert(
        unit: json["unit"],
        lokasi: json["lokasi"],
        equipment: json["equipment"],
        merk: json["merk"],
        tipe: json["tipe"],
        tanggalDanJam: DateTime.parse(json["tanggal_dan_jam"]),
        inverterModul: json["inverter_modul"],
        baypasModul: json["baypas_modul"],
      );

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "lokasi": lokasi,
        "equipment": equipment,
        "merk": merk,
        "tipe": tipe,
        "tanggal_dan_jam": tanggalDanJam.toIso8601String(),
        "inverter_modul": inverterModul,
        "baypas_modul": baypasModul,
      };
}
