import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_player/playlistScreen.dart';

class PlayListBox extends StatefulWidget {
  final PlaylistInfo playlistInfo;
  final int index;

  PlayListBox({this.playlistInfo, this.index});

  @override
  _PlayListBoxState createState() => _PlayListBoxState();
}

class _PlayListBoxState extends State<PlayListBox> {
  File imageFile;

  @override
  Widget build(BuildContext context) {
    String _imageurl = "https://picsum.photos/250?image=${widget.index + 10}";
    ImageProvider img =
        (imageFile == null) ? NetworkImage(_imageurl) : FileImage(imageFile);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: GestureDetector(
        onLongPress: () {
          _showChoiceDialog(context);
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlaylistScreen(
                      playlistInfo: widget.playlistInfo, img: img)));
        },
        child: Container(
          alignment: Alignment.bottomRight,
          width: 170,
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.playlistInfo.name,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                image: img),
          ),
        ),
      ),
    );
  }

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _removeImage(BuildContext context) {
    setState(() {
      imageFile = null;
    });
    Navigator.of(context).pop();
  }

  _removeCollection(BuildContext context) {
    Navigator.of(context).pop();
  }

  _renameCollection(BuildContext context) {
    setState(() {});
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Text(
              'Collection Menu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Change image"),
                      Spacer(),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.solidImages,
                          ),
                          onPressed: () {
                            _openGallery(context);
                          }),
                      SizedBox(
                        height: 60,
                        width: 10,
                      ),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.ban),
                          onPressed: () {
                            _removeImage(context);
                          })
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Remove Collection"),
                      Spacer(),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.solidTrashAlt),
                          onPressed: () {
                            _removeCollection(context);
                          })
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Rename"),
                      Spacer(),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.pencilAlt),
                          onPressed: () {
                            _renameCollection(context);
                          })
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
