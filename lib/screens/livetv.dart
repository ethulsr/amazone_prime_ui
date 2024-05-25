import 'package:flutter/material.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class LiveTV extends StatelessWidget {
  final List<Channel> channels = [
    Channel(
        logoUrl: 'assets/Sky-tv-logo-png.png',
        name: 'Sky TV',
        program: 'Live Football Match',
        timeRemaining: '1h 30m'),
    Channel(
        logoUrl: 'assets/HBO_logo_blue.png',
        name: 'HBO',
        program: 'House of The Dragon',
        timeRemaining: '1h 20m'),
    Channel(
        logoUrl: 'assets/BBC.jpg',
        name: 'BBC',
        program: 'Morning News',
        timeRemaining: 'Live'),
    Channel(
        logoUrl: 'assets/Cartoon_Network_logo_logotype.png',
        name: 'Cartoon Network',
        program: 'Tom and Jerry',
        timeRemaining: '40m'),
    Channel(
        logoUrl: 'assets/MNX_logo.webp',
        name: 'MNX',
        program: 'Laugh for Laugh',
        timeRemaining: '40m'),
    Channel(
        logoUrl: 'assets/National Geographic.webp',
        name: 'National Geographic',
        program: 'Animal Kingdom',
        timeRemaining: '1h 40m'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.secondaryColor,
      appBar: AppBar(
        backgroundColor: apptheme.secondaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            modifiedTexts(
                text: "Live TV", color: apptheme.StoreAppBarTitle, size: 20),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: channels.length,
              itemBuilder: (context, index) {
                final channel = channels[index];
                return ChannelTile(channel: channel);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Channel {
  final String logoUrl;
  final String name;
  final String program;
  final String timeRemaining;

  Channel({
    required this.logoUrl,
    required this.name,
    required this.program,
    required this.timeRemaining,
  });
}

class ChannelTile extends StatelessWidget {
  final Channel channel;

  const ChannelTile({required this.channel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              channel.logoUrl,
              width: 155.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channel.name,
                  style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(channel.program, style: TextStyle(color: Colors.white)),
                Text(channel.timeRemaining,
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.play_arrow_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
