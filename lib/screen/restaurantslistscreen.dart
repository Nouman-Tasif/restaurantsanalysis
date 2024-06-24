import 'package:flutter/material.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffF1F4FC),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
            child: Text("Restaurant App", style: TextStyle(color: Colors.white))),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profileimage.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "user name",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Give Feedback'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                // final user = FirebaseAuth.instance.currentUser;
                // if (user != null) {
                //   try {
                //     viewModel.gotoLoginScreen(context);
                //   } catch (e) {
                //     Fluttertoast.showToast(msg: "Logout Failed");
                //   }
                // }
              },
            ),
          ],
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [

       ],
      ),
    );
  }
}
