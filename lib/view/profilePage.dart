import 'package:flutter/material.dart';
import 'package:flutter_login_profile_app/controller/profileProvider.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),centerTitle: true,elevation: 15,),
      body: Consumer<ProfileNotifier>(
        builder: (context, profileNotifier, child) {
          profileNotifier.getProfile();
        return FutureBuilder(
          future: profileNotifier.profile,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError)
            {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            }
            else {
              final userData = snapshot.data;
              return Padding(padding: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userData!.data!.profilePicture??''),
                  ),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Name: '),
                          Text('${userData.data!.firstName} ' ' ${userData.data!.lastName??''}'),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Email: '),
                          Text('${userData.data!.email}'),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Contact: '),
                          Text('${userData.data!.contact}'),
                        ],
                      ),

                    ],
                  ),
                ),
              );
            }

          },

        );
      },),
    );
  }
}
