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
              height: (MediaQuery.of(context).size.height / 4),
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      profImage,
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'Screen profile $name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
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
            ElevatedButton.icon(
              onPressed: () {
                showbottomsheet(context);
              },
              icon: Icon(Icons.arrow_circle_up),
              label: Text("Open sheet"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showbottomsheet(BuildContext ctx) async {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx1) {
          return Container(
            width: double.infinity,

            height: (MediaQuery.of(ctx1).size.height / 3), //for screen size
            color: Color.fromARGB(255, 113, 223, 195),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text(
                    "Text title",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 40),
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx1).pop();
                    },
                    child: Text("Close Pop")),
              ],
            ),
          );
        });
  }
}
