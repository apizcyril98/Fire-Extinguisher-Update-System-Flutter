import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:utm_fire_extinguisher_scanner/widgets/button_widget.dart';
import 'package:utm_fire_extinguisher_scanner/widgets/data_input_widget.dart';
import 'package:utm_fire_extinguisher_scanner/FadeAnimation.dart';


class DataInputForm extends StatefulWidget{
  String qrCode;
  DataInputForm({Key key, @required this.qrCode}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DataInputFormState(qrCode);

}

class _DataInputFormState extends State<DataInputForm> {
  String qrCode;
  _DataInputFormState(this.qrCode);

  final controller = TextEditingController() ;

  get key => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 500,
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
                    FadeAnimation(1, Text(
                      "Update Info", textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),)),
                    SizedBox(height: 100,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
                child: Column(
                  children: <Widget>[
                    const Text('QR Code: ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      qrCode,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 20),
                    const Text('APA Number',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    DataInputWidget(key: key, text: 'XXMMYYYYXSSSSSS',),
                    SizedBox(height: 15,),
                    const Text('Expiration Date',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    DataInputWidget(key: key, text: 'DD/MM/YYYY',),
                    SizedBox(height: 15),
                    const Text('Category',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    DataInputWidget(key: key, text: 'e.g. ABC Powder, Foam Spray ...',),
                    SizedBox(height: 15,),
                    ButtonWidget(
                      text: 'Save',
                      onClicked: () {
                      }, key: key,
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}