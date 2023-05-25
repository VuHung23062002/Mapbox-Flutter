import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../data/DamagePoint.dart';
import '../utils/utils.dart';
class FilteringApp extends StatefulWidget {
  const FilteringApp({Key? key}) : super(key: key);

  @override
  State<FilteringApp> createState() => _FilteringAppState();
}

class _FilteringAppState extends State<FilteringApp> {
  DateTime? selectedDate;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDateTime.text = DateFormat('dd-MM-yyyy').format(selectedDate!);
      });
    }
  }
  DateTime? selectedEndDate;
  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
        endDateTime.text = DateFormat('dd-MM-yyyy').format(selectedEndDate!);
      });
    }
  }
  List<DamagePoint> newlistdampoints = [];
  List<SymbolOptions> getSymbols() {
    List<SymbolOptions> symbols = [];
    if (manhole) {
      var filteredPlaces = newApply.where((place) => place.type == 'manhole').toList();
      newlistdampoints.addAll(filteredPlaces);
      addImageFromAssets('manhole',"assets/icons/manhole.png");
      for (int i = 0; i < newlistdampoints.length; i++) {
        symbols.add(
          SymbolOptions(
            draggable: true,
            geometry: LatLng(newlistdampoints[i].lat!, newlistdampoints[i].lon!),
            iconImage: 'manhole',
            iconSize: 0.05,
            textSize: 10,
            textOffset: const Offset(0, 1),
          ),
        );
      }
    } if (peeling) {
      addImageFromAssets('peeling', "assets/icons/peeling.png");
      var filteredPlaces = newApply.where((place) => place.type == 'peeling').toList();
      newlistdampoints.addAll(filteredPlaces);
      for (int i = 0; i < newlistdampoints.length-1; i++) {
        symbols.add(
          SymbolOptions(
            draggable: true,
            geometry: LatLng(newlistdampoints[i].lat!, newlistdampoints[i].lon!),
            iconImage: 'peeling',
            iconSize: 0.05,
            textSize: 10,
            textOffset: const Offset(0, 1),
          ),
        );
      }
    } if(pothole) {
      addImageFromAssets('pothole', "assets/icons/pothole.png");
      var filteredPlaces = newApply.where((place) => place.type == 'pothole').toList();
      newlistdampoints.addAll(filteredPlaces);
      for (int i = 0; i < newlistdampoints.length-1; i++) {
        symbols.add(
          SymbolOptions(
            draggable: true,
            geometry: LatLng(newlistdampoints[i].lat!, newlistdampoints[i].lon!),
            iconImage: 'pothole',
            iconSize: 0.05,
            textSize: 10,
            textOffset: const Offset(0, 1),
          ),
        );
      }
    }  if (unknown) {
      var filteredPlaces = newApply.where((place) => place.type == 'unknown').toList();
      newlistdampoints.addAll(filteredPlaces);
      addImageFromAssets('unknown',"assets/icons/unknown.png");
      for (int i = 0; i < newlistdampoints.length-1; i++) {
        symbols.add(
          SymbolOptions(
            draggable: true,
            geometry: LatLng(newlistdampoints[i].lat!, newlistdampoints[i].lon!),
            iconImage: 'unknown',
            iconSize: 0.05,
            textSize: 10,
            textOffset: const Offset(0, 1),
          ),
        );
      }
    }
    if (newStatus) {
      var filteredPlaces = damagaPoint.where((place) => place.status == 'NEW').toList();
      newlistdampoints.addAll(filteredPlaces);
    }
    if (requiredStatus) {
      var filteredPlaces = damagaPoint.where((place) => place.status == 'FIX REQUIRED').toList();
      newlistdampoints.addAll(filteredPlaces);
    }
    if (closeStatus) {
      var filteredPlaces = damagaPoint.where((place) => place.status == 'CLOSED').toList();
      newlistdampoints.addAll(filteredPlaces);
    }
    for(int i=0; i<newApply.length; i++){
      int? dataTimes = newApply[i].detectedTime;
      int? dateinsert =  selectedDate!.millisecondsSinceEpoch;
      int? dateEndInsert = selectedEndDate!.millisecondsSinceEpoch;
      if(dateinsert >= dataTimes! && dataTimes <= dateEndInsert){
        Text('${selectedDate!.millisecondsSinceEpoch}');
      }
    }
    return symbols;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text('Filtering')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Flitering',
              style: TextStyle(
                height: 3,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                CheckboxListTile (
                  title:  const Text("manhole"),
                  value: manhole,
                  onChanged: (newValue) {
                    setState(() {
                      manhole = newValue!;
                    });
                  },
                  secondary: Image.asset('assets/icons/manhole.png'),
                  //controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.blueAccent,
                ),
                CheckboxListTile(
                  title:  const Text("peeling"),
                  value: peeling,
                  onChanged: (bool? newValue) {
                    setState(() {
                      peeling= newValue!;
                    });
                  },
                  secondary: Image.asset('assets/icons/peeling.png'),
                ),
                CheckboxListTile(
                  title: const Text("pothole"),
                  value: pothole,
                  onChanged: (bool? newValue) {
                    setState(() {
                      pothole = newValue!;
                    });
                  },
                  secondary: Image.asset('assets/icons/pothole.png'),
                ),
                CheckboxListTile(
                  title: const Text("unknown"),
                  value: unknown,
                  onChanged: (bool? newValue) {
                    setState(() {
                      unknown = newValue!;
                    });
                  },
                  secondary: Image.asset('assets/icons/unknown.png'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Data',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                TextField(
                  controller: startDateTime,
                  onTap: () => selectDate(context),
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Select Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                TextField(
                  controller: endDateTime,
                  onTap: () => selectEndDate(context),
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'End Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ],
            ),
            const Text(
              'Status',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                CheckboxListTile (
                  title:  const Text("NEW"),
                  value: newStatus,
                  onChanged: (newValue) {
                    setState(() {
                      newStatus = newValue!;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
                CheckboxListTile(
                  title:  const Text("REQUIRED"),
                  value: requiredStatus,
                  onChanged: (bool? newValue) {
                    setState(() {
                      requiredStatus= newValue!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("CLOSE"),
                  value: closeStatus,
                  onChanged: (bool? newValue) {
                    setState(() {
                      closeStatus = newValue!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
                child: const Text('Submit'),
                onPressed: () async {
                  await mapController.removeSymbols(addedSymbols);
                  symbolFiltering = getSymbols();
                  Navigator.pop(context);
                  for(int i=0; i< symbolFiltering.length;i++){
                    mapController.addSymbol(symbolFiltering[i]);
                  }
                }
            ),
          ],
        ),
      )
    );
  }
}
