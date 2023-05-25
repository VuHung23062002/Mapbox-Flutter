import 'package:finalproject/data/DamagePoint.dart';
import 'package:finalproject/model/Filterring.dart';
import 'package:finalproject/model/Settingdrawer.dart';
import 'package:finalproject/utils/utils.dart';
import 'package:flutter/material.dart';
class DrawerMapbox extends StatefulWidget {
  const DrawerMapbox({super.key});
  @override
  State<DrawerMapbox> createState() => _DrawerMapboxState();
}

class _DrawerMapboxState extends State<DrawerMapbox> {
  @override
  void initState() {
    // TODO: implement initState
    createDamagePoint().then((value)=>
        setState((){
          damagaPoint.addAll(value);
        }));
    super.initState();
  }
  String? selectedClass;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 30,),
          Column(
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>  const FilteringApp()),
                    );
                  },
                  child: const Text('Filtering'),
                ),
              ),
              const SizedBox(height: 30,),
              SizedBox(
                height: 50,
                width: 200,
                child:  ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>  const SettingDrawer()),
                    );
                  },
                  child: const Text('Setting'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}