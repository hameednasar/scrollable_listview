import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unique Scrollable List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ScrollableListView(), // Referencing our custom list view
    );
  }
}

class ScrollableListView extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Mount Everest',
      'subtitle': 'The highest mountain in the world.'
    },
    {'title': 'Sahara Desert', 'subtitle': 'The largest hot desert on Earth.'},
    {'title': 'Amazon Rainforest', 'subtitle': 'The lungs of the Earth.'},
    {'title': 'Grand Canyon', 'subtitle': 'A magnificent natural wonder.'},
    {
      'title': 'Great Wall of China',
      'subtitle': 'An iconic man-made structure.'
    },
    {'title': 'Pacific Ocean', 'subtitle': 'The largest ocean in the world.'},
    {
      'title': 'Niagara Falls',
      'subtitle': 'Famous waterfalls in North America.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unique Scrollable List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomCard(
            title: items[index]['title']!,
            subtitle: items[index]['subtitle']!,
            iconData: Icons.explore, // Using a common icon for all items
            gradientColors: index % 2 == 0
                ? [Colors.blue.shade200, Colors.teal.shade400]
                : [
                    Colors.purple.shade200,
                    Colors.deepPurple.shade400
                  ], // Alternating gradients
          );
        },
      ),
    );
  }
}

// Custom widget to create a unique card for each item
class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final List<Color> gradientColors;

  const CustomCard({
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10, // Adds shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15), // Rounded corners for uniqueness
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: gradientColors, // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor:
                Colors.white.withOpacity(0.9), // Circular icon background
            child: Icon(
              iconData,
              color: gradientColors[1], // Icon color matches the gradient
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'Roboto', // Using custom font for title
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'Montserrat', // Different font for subtitle
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white70, // Right arrow icon for interactivity
          ),
          onTap: () {
            // Action on tap (if required)
          },
        ),
      ),
    );
  }
}
