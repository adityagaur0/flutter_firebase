import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter_firebase/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/route_manager.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TAXIFY"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Get.to(() => ProfileScreen());
              // AuthenticationRepository.instance.logout();
            },
          ),
        ],
      ),
    );
  }
}
