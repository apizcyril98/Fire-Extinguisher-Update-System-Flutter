import 'package:flutter/material.dart';


class DataInputWidget extends StatelessWidget{

  final String text;

  DataInputWidget({
    @required this.text,
    @required Key key,
  }) : super(key: key);

  final controller = TextEditingController() ;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 325.0,
    child: TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ),
  );

}