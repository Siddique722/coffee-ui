
import 'package:aboutus/utils/coffee-tile.dart';
import 'package:aboutus/utils/coffee-types.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    // [coffee type, isSelected]
    ['capucinno', true],
    ['latte', false],
    ['black', false]
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
//this for loop make all false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }

      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: Icon(Icons.people),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          //find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: (25.0),
            ),
            child: Text(
              'Find the best coffee for you',
              style: TextStyle(fontSize: 40) //GoogleFonts.bebasNeue(fontSize: 60,),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Find your coffee...",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

//horizontal listview of coffee types
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeTypes(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(
                      index,
                    );
                  },
                );
              },
            ),
          ),

//horizontal listview of coffee tiles

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                    coffeeImagePath: "lib/images/coffee.jpg",
                    coffeeName: "coffee",
                    coffeePrice: "4.00"),
                CoffeeTile(
                    coffeeImagePath: "lib/images/barista.jpg",
                    coffeeName: "espresso",
                    coffeePrice: "5.00"),
                CoffeeTile(
                    coffeeImagePath: "lib/images/capucino.jpg",
                    coffeeName: "capucine",
                    coffeePrice: "6.00"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
