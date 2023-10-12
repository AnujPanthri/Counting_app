import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
 final VoidCallback onPressed;
 final String title;
 final double borderRadius;
 final Color color;
 final Widget icon;

 const CustomButton({super.key,required this.onPressed,required this.icon,this.title="",this.color=Colors.white,
                      this.borderRadius=20});
 @override
 Widget build(BuildContext context){
  return Ink(
        // decoration: const ShapeDecoration(
        //               color: Colors.blue,
        //               shape: CircleBorder(),
        //             ),
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                      color: color,
                    ),
        
        child:IconButton(
          iconSize:50,
          padding: const EdgeInsets.all(20),
          onPressed: onPressed,
          tooltip: title,
          // icon: Image.asset(
          //         "assets/images/mic.png",
          //         color:const Color(0xffffffff),
          //       ),
          icon:icon,
        
         ),
         );
 } 
}