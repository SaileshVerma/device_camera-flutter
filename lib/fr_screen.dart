


import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
   

File image;


 openGallery(BuildContext context) async{
   var  vari= await ImagePicker.pickImage(source: ImageSource.gallery);
   setState(() {
     image=vari;
   });
     Navigator.of(context).pop();
 }


openCamera(BuildContext context) async{
  var  vari= await ImagePicker.pickImage(source: ImageSource.camera);
   setState(() {
     image=vari;
   });
   Navigator.of(context).pop();
}



   Future<void>  dialogBox(BuildContext context){
    
     return showDialog(context: context,builder:(BuildContext context){

         return AlertDialog(
           backgroundColor: Colors.blueAccent,
             title: Text("choose from the both"),
             content: SingleChildScrollView(
                            child: ListBody(
                     
                     children: <Widget>[

                       GestureDetector(
                         child: Text('gallery'),
                         onTap:(
                          
                         ){ openGallery(context);} ,
                       ),
                        SizedBox(height: 10,),
                       GestureDetector(
                         child: Text('camera'),
                         onTap:(){
                           openCamera(context);
                         } ,
                       ),
                      
                     ],

               ),
             ) ,
         );
     }
     
     
     
     );

   }


 Widget  isImagethere(){

if(image==null){
  return Text("your image will be isplay here");
}else

return  Image.file(image,height: 200,width: 200,);

 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('data'),

),


body: Container(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
      children: <Widget>[

             isImagethere(),
      
RaisedButton(
    child: Text('select'),
    
    onPressed: (){
     dialogBox(context);
})



      ],
    ),
  )

)

    );
  }
}