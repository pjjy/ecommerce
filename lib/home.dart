import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://picsum.photos/250?image=1',
  'https://picsum.photos/250?image=4',
  'https://picsum.photos/250?image=5',
  'https://picsum.photos/250?image=9',
  'https://picsum.photos/250?image=8',
  'https://picsum.photos/250?image=4'
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class HomeT extends StatefulWidget {
//  MainFeedPage({Key key, @required this.empId}) : super(key: key);
  @override
  _Home createState() => _Home();
}


class _Home extends State<HomeT>{


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            title: Text('Transactions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text('Profile'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: home(context),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: grade(context),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: profile(context),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }

  Widget home(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Home'),
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            )
        ),
      ),
        body: new Column(
          children: <Widget>[

//              CarouselSlider(
//              items: child,
//              autoPlay: true,
//              enlargeCenterPage: true,
//              aspectRatio: 2.0,
//            ),


            new Expanded(
                child: new GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {

                         if(index == 0){
                           return CarouselSlider(
                             items: child,
                             autoPlay: true,
                             enlargeCenterPage: true,
                             aspectRatio: 2.0,
                           );
////                         return Text('hhe');
//
                         }
//                         else{
                          print(index);
                           return Container(
                             child: Hero(
                               tag: 'image',
                               child:  Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvkLs5kAh1yHb1qxTmvR_BPrkepfIPvswL5x1jDaH36GXtVQ8z',height: 10.0),
                             ),
                           );
//                         }
                    }
                )
            )

          ],
        )
//      body: ListView.builder(
////              controller: newsfeedcontroller,
//              itemCount: 4,
//              itemBuilder: (BuildContext context, int index) {
//                return itemFeed(context: context, index: index);
//              })
      );
  }

  Widget grade(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Transactions'),
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            )
        ),
      ),
      body: ListView(
        children: <Widget>[
          Text('Transactions'),

        ],
      ),
    );
  }

  Widget profile(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Profile'),
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            )
        ),
      ),
      body: ListView(
        children: <Widget>[
          Text('profile'),
        ],
      ),
    );
  }

  Widget itemFeed({BuildContext context, int index, bool hideName = false}) {
    return Container(
      child:


          Hero(
            tag: 'image',
            child:  Image.network('https://picsum.photos/250?image=8',height: 200.0),
          ),

    );
  }

}




