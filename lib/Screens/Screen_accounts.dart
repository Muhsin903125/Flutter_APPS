import 'package:flutter/material.dart';

class ScreenAccount extends StatelessWidget {
  ScreenAccount({Key? key}) : super(key: key);
  final _list = ['apple', 'orange', 'pineapple'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Account Page"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: DropdownButtonFormField(
                hint: Text("Select fruit"),
                onChanged: (value) {
                  print(value);
                },
                items: _list.map((e) {
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
