import 'package:finalproject/model/Drawermap.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'utils/utils.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
  createDamagePoint().then((value)=>
  setState((){
    damagaPoint.addAll(value);
  }));
  super.initState();
  }
  bool mapboxInitialized = false;
  void _onMapCreated(MapboxMapController controller){
    mapController = controller;
    dateAplly();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapbox Flutter'),
      ),
      drawer: const Drawer(
        child: DrawerMapbox(),
      ),
      body:Stack(
        children: [
          createMapbox(),
        ],
      ),
      floatingActionButton: botonesFlotantes(),
    );
  }
  Column botonesFlotantes(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: 'test1',
          child: const Icon(Icons.zoom_in),
            onPressed: (){
            mapController.animateCamera(CameraUpdate.zoomIn());
            }),
        const SizedBox(height: 5),
        FloatingActionButton(
            heroTag: 'test2',
            child: const Icon(Icons.zoom_out),
            onPressed: (){
              mapController.animateCamera(CameraUpdate.zoomOut());
            }),
        const SizedBox(height: 5),
        FloatingActionButton(
            heroTag: 'test3',
            child:  const Icon(Icons.location_on),
          onPressed: (){
            addImageFromAssets('name',"assets/icons/images.png");
            mapController.animateCamera(CameraUpdate.newLatLng(
              LatLng(newApply[0].lat!, newApply[0].lon!),
            ));
            symbols();
            }
            ),
      ],
    );
  }
  MapboxMap createMapbox(){
    return MapboxMap(
      accessToken: accessToken,
      styleString: 'mapbox://styles/mapbox/streets-v12',
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      myLocationRenderMode: MyLocationRenderMode.GPS,
      initialCameraPosition:  const CameraPosition(
        target: LatLng(11.966490632199879, 108.43609838047458),
        zoom: 15,
      ),
    );
  }
}