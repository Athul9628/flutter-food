import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart'; // for orientation
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(

        primarySwatch: Colors.grey,
          fontFamily: 'Inter',
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  List<String> _popular = ['Sliced1','2','3'];
  TabController _tabController;
  @override
  void initState(){
    _tabController =TabController(length: 4,vsync: this);
    super.initState();
  }
Widget _buildPopular(){
    return Column(
      children: <Widget>[Container(
        child: _buildPopularList(),height: 400,
      ),Container(
        child: Card(elevation: 0,
          child: ListTile(
            title: SizedBox(
              child: Align(
                child: Text('Your Information',style: TextStyle(
                    fontSize: 20,
                  fontWeight: FontWeight.w700
                ),),
                alignment: Alignment.topLeft,
              ),
              height: 30,
            ),
            leading: Container(height: 50,width: 45,
              child: Icon(Icons.location_on,color: Colors.black,size: 40,
                ),decoration: BoxDecoration(
                color: Color.fromARGB(255,246,206,99),
              borderRadius: BorderRadius.circular(10)
            )
            ),
            subtitle: Column(
              children: <Widget>[SizedBox(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Delivery Address'
                    ,style: TextStyle(
                      fontSize: 17,
                    ),),
                ),height: 40,
              ),Text('31c,Park Avenue, LA',style: TextStyle(
                fontWeight: FontWeight.w400,
                  color: Colors.black,
                fontSize: 25
              ),)],
            ),
            trailing: IconButton(icon: Icon(Icons.edit,color: Colors.black,),
              onPressed: (){},

            ),
          ),
        ),
      )],
    );
}
Widget _buildPopularList(){
    return ListView.builder(itemBuilder: (context,index){
      if (index < _popular.length){
        return _buildcard(_popular[index],index);
      }

    },scrollDirection: Axis.horizontal,shrinkWrap: true,);
}

Widget _buildcard(String food, index){
    return SingleChildScrollView(
      child: Container(height: 375,width:300 ,
        child: Card(semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          child: Column(
            children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Container(
                child: Row(
                  children: <Widget>[Icon(Icons.whatshot,color: Colors.orangeAccent,),Text('78 Calories',)],
                ),
              ),IconButton(
                icon: Icon(Icons.favorite,color: Colors.pink,),
                onPressed: (){},
              ),],
            ),ClipRect(
                child: Align(
                  child: Image.network("https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                  alignment: Alignment.center,
                  widthFactor: 0.90,
                  heightFactor: 1.0,
                )),
              ListTile(
                title: SizedBox(
                  height: 40,
                  child: Text('Clasico',style: TextStyle(fontSize: 30,

                  ),textAlign: TextAlign.left,),
                ),
                subtitle:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[SizedBox(
                    height: 30,
                    child: Align(alignment: Alignment.topLeft ,
                      child: Text(food,style: TextStyle(
                        fontSize: 18,fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  Align(
                    child: Text('\$21',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,color: Colors.black
                    ),),
                    alignment: Alignment.topLeft,
                  )],
                ) ,trailing: IconButton(icon: Icon(Icons.arrow_forward,color: Colors.black,),
                iconSize: 25,
                onPressed: (){},),)],
          ),

        ),
      ),
    );
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title,style: TextStyle(
          fontWeight: FontWeight.w200
        ),),actions: <Widget>[IconButton(
        icon: Icon(Icons.search),
        onPressed: (){},

      )],leading: Icon(Icons.menu),
      backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          child: Column(children: <Widget>[
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(padding: EdgeInsets.only(top:5),
                  child: Text('Food',style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 25
                  ),),
                ),
              ],
            ),Row(
              children: <Widget>[Container(
                child: Text('Special For You',style: TextStyle(
                    fontSize: 30
                )),)],
            ),
            Container(
              child: Scaffold(
                appBar: TabBar(controller: _tabController,
                  isScrollable: true,
                  tabs: <Widget>[Tab(text: 'Popular',),Tab(text: 'Hot',),Text('Pizza'),Text('Food')],
                  indicatorColor: Color.fromARGB(255,246,206,99),),
              body: TabBarView(children: <Widget>[_buildPopular(),Text('hello'),Text('hello'),Text('hello')],
                controller: _tabController,),),height: 700,
            )
          ],

          ),
        ),
      ),
        floatingActionButton: FloatingActionButton.extended(onPressed: null, label: Text('Add'),
          icon: Icon(Icons.shopping_cart),
        backgroundColor: Color.fromARGB(255,246,206,99),),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
