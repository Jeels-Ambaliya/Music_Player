import 'package:flutter/material.dart';
import 'package:rainbow_music_player/screens/views/audio.dart';
import 'package:rainbow_music_player/utils/audio_utils.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: My_Audio_Player(),
    ),
  );
}

class My_Audio_Player extends StatefulWidget {
  const My_Audio_Player({Key? key}) : super(key: key);

  @override
  State<My_Audio_Player> createState() => _My_Audio_PlayerState();
}

class _My_Audio_PlayerState extends State<My_Audio_Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "RAINBOW MUSIC",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: myAudioList
              .map(
                (e) => Card(
                  color: Colors.primaries[myAudioList.indexOf(e) % 18],
                  elevation: 3,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Audio_Page(
                            name: e['name'],
                            image: e['image'],
                            song: e['song'],
                            madeby: e['makeby'],
                          ),
                        ),
                      );
                    },
                    leading: Container(
                      height: 65,
                      width: 65,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            e['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      e['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      e['makeby'],
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 14,
                      ),
                    ),
                    // trailing: StreamBuilder(
                    //   stream: myPlayer.isPlaying,
                    //   builder: (context, snapShot) {
                    //     var val = snapShot.data;
                    //     (val == true)
                    //         ? myIconController!.forward()
                    //         : myIconController!.reverse();
                    //     return IconButton(
                    //       onPressed: () {
                    //         if (val == true) {
                    //           myPlayer.pause();
                    //         } else {
                    //           myPlayer.play();
                    //         }
                    //       },
                    //       icon: AnimatedIcon(
                    //         icon: AnimatedIcons.play_pause,
                    //         progress: myIconController!,
                    //       ),
                    //     );
                    //   },
                    // ),
                    trailing: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
