import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:utm_fire_extinguisher_scanner/widgets/button_widget.dart';
import 'package:utm_fire_extinguisher_scanner/data_input.dart';
import 'package:utm_fire_extinguisher_scanner/FadeAnimation.dart';


class QRScanPage extends StatefulWidget {
  const QRScanPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Unknown';
  String title = 'QR Scanner';

  get key => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.2),
                      ]
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FadeAnimation(1, Text("SKE Extinguisher Updater", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 100,),
                ],
              ),
            ),
          ),
              SizedBox(height: 100),
              Container(
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Scan Result',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      qrCode,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 72),
                    ButtonWidget(
                      text: 'Start QR scan',
                      onClicked: () => scanQRCode(), key: key,
                    ),
                    SizedBox(height: 30,),
                    ButtonWidget(
                      text: 'Update',
                      onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DataInputForm(qrCode: qrCode),
                      )), key: key,
                )
              ]
                )
              )
            ]
      ),
      ),
    );
  }


  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}