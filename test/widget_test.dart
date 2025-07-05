import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Display Assignment"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Local Asset Image with BorderRadius & Shadow
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage("images/my_image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Network Image with loading + error
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Zebra_finch_taeniopygia_guttata.jpg/640px-Zebra_finch_taeniopygia_guttata.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: Icon(Icons.error, color: Colors.red),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
