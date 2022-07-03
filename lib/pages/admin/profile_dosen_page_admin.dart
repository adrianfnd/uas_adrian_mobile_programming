import 'package:flutter/material.dart';

import 'package:uas_adrian_mobile_programming/pages/user/home_page.dart';

class ProfileDosenAdmin extends StatefulWidget {
  const ProfileDosenAdmin({Key key}) : super(key: key);

  @override
  State<ProfileDosenAdmin> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ProfileDosenAdmin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            //snap: true,
            //floating: true,
            expandedHeight: 300.0,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Indriani, S.T., M.Eng.',
                  style: TextStyle(fontSize: 18)),
              background: FlutterLogo(),
            ),
            actions: <Widget>[
              PopupMenuButton<int>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                offset: Offset(-30, 40),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("User Page"),
                  ),
                ],
                initialValue: 2,
                onCanceled: () {
                },
                onSelected: (value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(40, 50, 40, 150),
                  child: Column(
                    children:<Widget>[
                      Column(
                          children:<Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:<Widget>[
                                Column(
                                  children:<Widget>[
                                    Icon(Icons.topic_outlined,
                                        size: 35),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:<Widget>[
                                    Text("NID",
                                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5),
                                    Text("20021",
                                        style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.5))),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:<Widget>[
                                Column(
                                  children:<Widget>[
                                    Icon(Icons.map_outlined,
                                        size: 35),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:<Widget>[
                                    Text("Alamat",
                                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5),
                                    Text("Bandung",
                                        style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.5))),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:<Widget>[
                                Column(
                                  children:<Widget>[
                                    Icon(Icons.person_outlined,
                                        size: 35),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:<Widget>[
                                    Text("Jenis Kelamin",
                                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5),
                                    Text("Perempuan",
                                        style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.5))),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                          ]
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}


