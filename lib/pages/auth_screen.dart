// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:walletappui/pages/home_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum SupportState{
  uknown,
  supported,
  unSupported,
}

class _AuthScreenState extends State<AuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.uknown;
  List<BiometricType>? availableBiometric;

  @override
  void initState() { // TODO: implement initState
    auth.isDeviceSupported().then((bool isSupported) => 
      setState(()=> supportState = isSupported ? SupportState.supported :SupportState.unSupported));
    super.initState();
    checkBiometric();
    getAvailableBiometrics();
  }

  Future<void> checkBiometric() async{
    late bool canCheckBiometric;
    try{
      canCheckBiometric = await auth.canCheckBiometrics;
      print("Biometric Supported: $canCheckBiometric");
    } on PlatformException catch (e) {
      print(e);
      canCheckBiometric = false;
    }
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> biometricTypes;
    try{
      biometricTypes = await auth.getAvailableBiometrics();
      print("Support biometrics $biometricTypes");
    }on PlatformException catch (e){
      print(e);
    }

    if(!mounted){
      return;
    }
    setState(() {
      availableBiometric = biometricTypes;
    });
  }

  Future<void> authenticateWithBiometrics() async {
    try{
      final authenticated = await auth.authenticate(
        localizedReason: 'Authenticate with fingerprint or Face ID',
        options:  AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        )
        );

        if(!mounted){
          return;
        }

        if(authenticated){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

        }

    }on PlatformException catch (e){
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Multi-Purpose Wallet',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.grey[700],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              supportState == SupportState.supported
              ? ''
              : supportState == SupportState.unSupported
              ? ''
              : '',

              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:  supportState == SupportState.supported
                ? Colors.green
                : supportState == SupportState.unSupported
                ? Colors.red
                : Colors.grey,
              ),
            ),
            
            SizedBox(height: 20),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                'lib/icons/padlock.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                ),

            SizedBox(height: 10), // Add some spacing between the image and the button
            
            ElevatedButton(
              onPressed: authenticateWithBiometrics,
             style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.grey, // Set the button text color to white
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                  ),
               ),
            child: Text("Use Face ID or Fingerprint to Open"),
              ),
             ],
            )
          ],
        ),
      ),
    );
  }
}