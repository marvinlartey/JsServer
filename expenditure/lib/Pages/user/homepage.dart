import 'package:flutter/material.dart';

import 'new_request.dart';
import 'request_details.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  // _HomepageState createState() => _HomepageState();

  int _selectedPage = 0;
  PageController pageController = PageController();

  // void onTapped(int index) {
  //   setState(() {
  //     _selectedPage = index;
  //   });
  //   PageController.jumpToPage(index);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromRGBO(224, 224, 224, 1),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                //Profile picture
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/dp5.jpg"),
                  ),
                ),
                //username
                const Text(
                  'John Doe',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),

                //separator
                const SizedBox(
                  height: 22,
                ),

                //New request button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NewRequest(),
                    ));
                  },
                  child: const Text(
                    'Create New Request',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),

          PageView(
            controller: pageController,
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'History'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            ],
            currentIndex: _selectedPage,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
          //list of requests
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.59,
            padding: const EdgeInsets.fromLTRB(0, 22, 0, 22),
            color: const Color.fromRGBO(232, 232, 230, 1),
            child: Column(
              children: const [
                Text(
                  'MY REQUESTS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                //listbuilder
                //ListView.builder(itemBuilder: )
              ],
            ),
          )
        ],
      ),
    );
  }
}
