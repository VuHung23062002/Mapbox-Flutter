import 'dart:convert';
import 'package:finalproject/data/DamagePoint.dart';
import 'package:finalproject/data/DataLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
late MapboxMapController mapController;
// lay data damagapoints
List<DamagePoint> damagaPoint = <DamagePoint>[];
// su ly nay thang
TextEditingController startDateTime = TextEditingController();
TextEditingController endDateTime = TextEditingController();
//filtering
bool manhole = false;
bool peeling = false;
bool pothole = false;
bool unknown = false;
bool newStatus = false;
bool requiredStatus = false;
bool closeStatus = false;
List<SymbolOptions> symbolFiltering = <SymbolOptions>[];
//link mapbox
const String accessToken = "pk.eyJ1IjoidGh1YW50cmFuMTcwNCIsImEiOiJja3pnc3ViYXAzcWU3Mm9vMHYwdnNqZWwxIn0.fRoymeK_Gwe6XjLy7sJvng";
//sử lý hình ảnh
Future<void> addImageFromAssets(String name, String assetsName)async{
  final ByteData bytes = await rootBundle.load(assetsName);
  final Uint8List list = bytes.buffer.asUint8List();
  return mapController.addImage(name, list);
}
// đọc file damagepoints.json
createDamagePoint() async{
  final jsondatacreatemap = await rootBundle.loadString("assets/damagePoints.json");
  final list = jsonDecode(jsondatacreatemap) as List<dynamic>;
  return list.map((e) => DamagePoint.fromJson(e)).toList();
}
//đọc file logindata.json
createDataLogin() async{
  final jsonlogin = await rootBundle.loadString("assets/datalogin.json");
  final lists = jsonDecode(jsonlogin) as List<dynamic>;
  List<Datalogin> loginDataList = lists.map((json) => Datalogin.fromJson(json)).toList();
  return loginDataList;
}
final List<Datalogin>  login = <Datalogin>[];
// data settings
TextEditingController numberEditing = TextEditingController();
TextEditingController confidenceEditing = TextEditingController();
String ConfidenceInput = '';
String selectedOption = '';
List<DamagePoint> newApply = [];
List<void> dateAplly() {
  newApply = [];
  String numberOfPointsText = numberEditing.text.trim();
  var  filteredData = damagaPoint.take(int.parse(numberOfPointsText)).toList();
  newApply.addAll(filteredData);
  String confiDence = confidenceEditing.text.trim();
  var filteredPlaces = newApply.where((place) => place.confidence! >= double.parse(confiDence)).toList();
  newApply = filteredPlaces;
  return newApply;
}
//hàm sử lý location người dùng
List<Symbol> addedSymbols = [];
Future<List<Symbol>> symbols() async{
   for(int i=0; i<newApply.length;i++){
     Future<Symbol> symbol = mapController.addSymbol(
       SymbolOptions(
           draggable: true,
           geometry: LatLng(newApply[i].lat!,newApply[i].lon!),
           iconImage: 'name',
           iconSize: 0.2,
           textField: newApply[i].deviceId!,
           textSize: 10,
           textOffset: const Offset(0,1)
       ),
     );
     addedSymbols.add(await symbol );
   }
   return addedSymbols;
}

