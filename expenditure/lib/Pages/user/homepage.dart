import 'package:flutter/material.dart';

import 'new_request.dart';
import 'request_details.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedPage = 0;

  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1000), curve: Curves.linear);
  }

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
        body: PageView(controller: pageController, children: [
          SingleChildScrollView(
            child: Container(
              color: const Color.fromRGBO(224, 224, 224, 1),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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

                  //New request button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  //list of requests
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.58,
                    padding: const EdgeInsets.fromLTRB(0, 11, 0, 0),
                    color: const Color.fromRGBO(232, 232, 230, 1),
                    child: Column(
                      children: [
                        const Text(
                          'MY REQUESTS',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.width * 0.3),
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: const Icon(Icons.list),
                                  trailing: const Text(
                                    "GFG",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                  title: Text("List item $index"),
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RequestDetails(),
                                    ));
                                  },
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      trailing: const Text(
                        "GFG",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("List item $index"));
                }), /* Archive here */
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
        )

        /* Column(
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

          PageView(controller: pageController, children: [
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
                ],
              ),
            ),
            Container(
              color: Colors.blue,
            )
          ]),
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
        ],
      ), */

        );
  }
}
