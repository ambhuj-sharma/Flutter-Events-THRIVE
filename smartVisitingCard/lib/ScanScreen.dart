import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';

class ScanCode extends StatefulWidget {
  const ScanCode({Key? key}) : super(key: key);

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {

  ////Scanner start here
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancels', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  ///////End here


  _onFormSubmit(){}
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height:300,
                  child:QrImage(
                    data: "https://www.linkedin.com/in/ronak-ranjan/",
                    version: QrVersions.auto,
                    size: 300.0,
                      backgroundColor:Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                SizedBox(
                    width: 350.0,
                    height: 60.0,
                    child: ElevatedButton(
                        onPressed: () => scanQR(),
                      child: const Text("EXPAND YOUR NETWORK",
                        style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                SizedBox(
                  child:  Text("Scan Result : $_scanBarcode\n",
                    style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                SizedBox(
                  width: 200.0,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: _onFormSubmit,
                    child: const Text("REQUESTS",
                      style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
