import 'package:flutter/material.dart';
import '../utils/utils.dart';

class SettingDrawer extends StatefulWidget {
  const SettingDrawer({Key? key}) : super(key: key);

  @override
  State<SettingDrawer> createState() => _SettingDrawerState();
}

class _SettingDrawerState extends State<SettingDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Settings')
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: numberEditing,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Number Of Points',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: confidenceEditing,
                  onChanged: (value) {
                    setState(() {
                      ConfidenceInput = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Confidence',
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
              child: const Text('Apply'),
              onPressed: ()  {
                dateAplly();
                Navigator.pop(context);
              }
          ),
        ],
      ),
    );
  }
}
