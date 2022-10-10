import 'package:flutter/material.dart';
import 'package:flutter_space/data.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'detail.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color(0xFF9354B9) ,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Color(0xFF0050AC),
            Color(0xFF9354B9)
            ],
             stops: [0.3,0.7],
             begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: SafeArea(

          child: Padding(
            padding:const   EdgeInsets.all(32),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text("EXPLORE",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Solar System",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white38),),
                ),
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 400,
                child: Swiper(

                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width-2*64,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,a,b)=>Detailpage(planets[index])));

                      },
                      child: Stack(
                        children: [

                          Column(

                            children: [
                              // Image.asset(planets[index]..toString()),
                              SizedBox(height: 100,),

                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                color:Colors.white,
                                elevation:10,

                                child:Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,


                                    children: [
                                      SizedBox(height: 100,),
                                      Text(planets[index].name,

                                        style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color(0xff47455f),),),
                                      Text("Solor System",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff47455f)),),
                                      SizedBox(height: 30,),
                                      Row(

                                        children: [
                                          Text("Know More",style: TextStyle(color: Colors.red,fontSize: 16),),
                                          SizedBox(width: 20,),
                                          Icon(Icons.arrow_forward,color: Colors.red,)
                                        ],)
                                    ],
                                  ),
                                ) ,
                              )
                            ],
                          ),
                          Image.asset(planets[index].iconImage)
                        ],
                      ),
                    );
                  }

                ),
              )

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF6751B5),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
        ),
        padding: EdgeInsets.all(24),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
         IconButton(onPressed: (){}, icon: Image.asset("assets/menu_icon.png") ),
           IconButton(onPressed: (){}, icon: Image.asset("assets/search_icon.png") ),
           IconButton(onPressed: (){}, icon: Image.asset("assets/profile_icon.png") ),

         ],
       ),
      ),
      
    );
  }
}
