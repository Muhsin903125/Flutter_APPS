import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  final String name;
  final String profImage;

  const ScreenProfile({Key? key, required this.name, required this.profImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (profImage == null) {
    //   imageLink =
    //       'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?s=612x612';
    // }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Image.network(
            //  'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg'),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      profImage,
                    ),
                    Text(
                      'Screen profile $name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          backgroundColor: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('go back'),
            ),
          ],
        ),
      ),
    );
  }
}
