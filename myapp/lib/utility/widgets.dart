import 'package:flutter/material.dart';

const digital_blue = Color(0xFF03A9F4);
const digital_blueb = Color(0xFF143D52);

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
    hintText: hintText,
    hintStyle: TextStyle(fontStyle: FontStyle.italic),
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

MaterialButton longButtons(String title, void Function() fun,
    {Color color: digital_blueb, Color textColor: Colors.white}) {

  return MaterialButton(
    onPressed: fun,
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 10,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}