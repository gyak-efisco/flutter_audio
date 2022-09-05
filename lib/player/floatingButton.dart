import 'package:flutter/material.dart';

floatingButton(){
  return FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () {
      Navigator.pushNamed(context, '/second');
    },
  );
}