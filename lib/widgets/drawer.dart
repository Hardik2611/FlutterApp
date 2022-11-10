import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final imageUrl = "https://media-exp1.licdn.com/dms/image/C4D03AQGeXps-Gfy0bw/profile-displayphoto-shrink_800_800/0/1654518198279?e=2147483647&v=beta&t=HoCOzj9djrHf2zIzQD4E9PChWfN31d0Hq83JwRMn7po";

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children:  [
            DrawerHeader(

              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    accountName:const Text( "hardik"),
                    accountEmail:const Text("hello@gmail.com"),
                    currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
                ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home", style: TextStyle(color: Colors.white),),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text("Profile", style: TextStyle(color: Colors.white),),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text("Email", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
