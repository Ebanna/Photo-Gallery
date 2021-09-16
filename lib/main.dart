import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_app/picture_detail.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:PhotoGalleryApp(),
  ));
}
class PhotoGalleryApp extends StatefulWidget {
  const PhotoGalleryApp({Key? key}) : super(key: key);

  @override
  _PhotoGalleryAppState createState() => _PhotoGalleryAppState();
}

class _PhotoGalleryAppState extends State<PhotoGalleryApp> {
  // Images data source
    List img = [
      "https://images.unsplash.com/photo-1631540373352-b96bd6159b1f?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8eGpQUjRobGtCR0F8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1618107057892-67f36135fe17?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE0fHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          "https://images.unsplash.com/photo-1631143071901-d9ede826b78d?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIwfHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          "https://images.unsplash.com/photo-1622372597516-15d49f8b2f87?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI3fHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          "https://images.unsplash.com/photo-1630257901786-3796aa883ec6?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM3fHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          "https://images.unsplash.com/photo-1630424836013-00e25bfe1849?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDU0fHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:12.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Text("Photo Gallery App",
                  style: TextStyle(
                    fontSize:32.0,
                    fontWeight: FontWeight.bold,
                  ),),
               SizedBox(height:18.0),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon( Icons.search,color: Colors.amber,),
                 hintText: "Search for Image",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8.0)
                     )
                ),
              ),
              SizedBox(height: 24.0,),
              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(vertical:18.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  //itemCount:img. length ,
                  itemBuilder: (context, index){
                    return Container(
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                       child: GestureDetector(
                         onTap: () {
                           Navigator.push(context,
                           MaterialPageRoute( builder:(context) => PictureDetailScreen( img[index])),);
                         },
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(8.0),
                           child: Image.network(img[index],fit:BoxFit.fill ,),
                         ),
                       ),
                    );
                  },
                     staggeredTileBuilder: (index){
                    return new StaggeredTile.count(1, index.isEven ? 1.2 :2);
              }
                ),
              ))
            ],
          ),
        ),
    ),

    );

  }
}
