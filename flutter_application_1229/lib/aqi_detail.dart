import 'package:flutter/material.dart';

class AQIListDetail extends StatelessWidget {
  final String cityName;
  final String aqiPoint;
  final String county;
  final String status;
  final String windSpeed;
  final String importDate;
  Color aqiBackgroundColor = Colors.black;
  String airState = "";

  AQIListDetail({required this.cityName, required this.aqiPoint,required this.county,required this.status,required this.windSpeed,required this.importDate, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (int.tryParse(aqiPoint)! >= 0 && int.tryParse(aqiPoint)! <= 50) {
      airState = "空氣品質令人滿意，基本無空氣污染";
      aqiBackgroundColor = Colors.green;
    } else if (int.tryParse(aqiPoint)! >= 51 && int.tryParse(aqiPoint)! <= 100) {
      airState = "空氣品質可接受，但某些污染物可能對極少數異常敏感人群健康有較弱影響";
      aqiBackgroundColor = Colors.yellow;
    } else if (int.tryParse(aqiPoint)! >= 101 && int.tryParse(aqiPoint)! <= 150) {
      airState = "易感人群症狀有輕度加劇，健康人群出現刺激症狀";
      aqiBackgroundColor = Colors.orange;
    } else if (int.tryParse(aqiPoint)! >= 151 && int.tryParse(aqiPoint)! <= 200) {
      airState = "進一步加劇易感人群症狀，可能對健康人群心臟、呼吸系統有影響";
      aqiBackgroundColor = Colors.red;
    } else if (int.tryParse(aqiPoint)! >= 201 && int.tryParse(aqiPoint)! <= 300) {
      airState = "心臟病和肺病患者症狀顯著加劇，運動耐受力降低，健康人群普遍出現症狀";
      aqiBackgroundColor = Colors.purple;
    } else if (int.tryParse(aqiPoint)! > 300) {
      airState = "健康人群運動耐受力降低，有明顯強烈症狀，提前出現某些疾病";
      aqiBackgroundColor = Colors.redAccent.shade700;
    }
    return Scaffold(
      appBar: AppBar(title: const Text("詳細資訊"),),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("地名: $cityName", style: const TextStyle(color: Colors.black),),
            Text("城市: $county", style: const TextStyle(color: Colors.black),),
            Text("空氣品質指數: $aqiPoint", style: const TextStyle(color: Colors.black),),
            Text("狀態: $status", style: const TextStyle(color: Colors.black),),
            Text("風速: $windSpeed", style: const TextStyle(color: Colors.black),),
            Text("更新時間: $importDate", style: const TextStyle(color: Colors.black),),
            Text("建議: $airState", style: TextStyle(color: aqiBackgroundColor),),
          ],
        ),
        alignment: Alignment.center,
      ), 
    );
  }
}