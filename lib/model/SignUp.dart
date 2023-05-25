import 'dart:convert' ;
import 'dart:io';
import 'package:finalproject/data/DataLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNamedEditingController =  TextEditingController();
  final emailEditingController =  TextEditingController();
  final passworkEditingController =  TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  void handleSignUpButtonPressed(BuildContext context) {
    Datalogin newSignUp = Datalogin(
    username: emailEditingController.text.trim(),
    firstname: firstNamedEditingController.text.trim(),
    password: passworkEditingController.text.trim(), numberOfPoints: '', confidence: '', id: '',
  );
    addUserToJsonFile(newSignUp)
        .then((_) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Đăng ký thành công'),
    ));
    Navigator.of(context).pop();
    }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Đăng ký thất bại: $error'),
    ));
    });
  }
  Widget firstNamed(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'First Name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: firstNamedEditingController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
                color: Colors.black87
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'First Named',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }
  Widget buildEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
                color: Colors.black87
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }
  Widget buildPasswork(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Passwork',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: passworkEditingController,
            obscureText: true,
            style: const TextStyle(
                color: Colors.black87
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Passwork',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }
  Widget buildSignUPBtn(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: ()async{
          handleSignUpButtonPressed(context);
        },
        child: const Text(
          'Sign In',
          style: TextStyle(
            color: Color(0xff5ac18e),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
          Container(
          height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x665ac18e),
                    Color(0x995ac18e),
                    Color(0xcc5ac18e),
                    Color(0xff5ac18e),
                  ],
                )
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 120,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 50,),
                  buildEmail(),
                  const SizedBox(height: 20,),
                  firstNamed(),
                  buildPasswork(),
                  buildSignUPBtn(),
                ],
              ),
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
// String path = 'C:/Users/Windows 10/AndroidStudioProjects/finalproject/assets/';
Future<void> addUserToJsonFile(Datalogin user) async {
  // new File('$path/file.xlsx').create(recursive: true);
  var tempDir = await getExternalStorageDirectory();
  final file = File( 'C:/Users/Windows 10/AndroidStudioProjects/finalproject/assets/datalogin.json');
  List<dynamic> users = [];
  Map<String, dynamic> userJson = user.toJson();
  if (await file.exists()) {
    String fileContent = await file.readAsString();
    List<dynamic> data = jsonDecode(fileContent);
    print(data);
  }
  users.add(userJson);
  await file.writeAsString(jsonEncode(users));
}
// List<Datalogin> getAllDataloginfromfile(){
//   try{
//     var stringContext = File(importFile).readAsStringSync();
//     List jsonList = json.decode(stringContext);
//     return  List<Datalogin>.from(
//         jsonList.map((json ) =>  Datalogin.fromJson(json)).toList()
//     );
//   }catch(e){
//     print('Error:$e');
//   }
// }
// void exportFile(List<Datalogin> data){
//   try{
//     data.sort(a,b)=> a.id.compareTo(b.id);
//     List jsonList =[];
//     data.forEach((element) { })
//   }
// }