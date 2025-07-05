import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[400],
        //AppBar at the top of the app with title
        appBar: AppBar(
          title: Text('Image Assignment'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[600],
        ),
        body: Center(
          child: Column(
            children: [
              // ---------Local Image---------
              Container(
                margin: EdgeInsets.all(20),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.black26),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("images/my_image.jpg"),
                    fit: BoxFit.cover
                  ),
                  boxShadow: [    // 
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(3, 9),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              //----------- Network Image ------------
              Container(
                width: 300,
                height: 200,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(3, 9),
                      blurRadius: 10,
                    ),
                  ],
                ),
                // ClipRRect is used to apply rounded corners
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://images.pexels.com/photos/792416/pexels-photo-792416.jpeg',
                    fit: BoxFit.cover,
                    //show loading while image loads
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    //show error message if image fail to load
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Text(' Failed to load image'));
                    },
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
