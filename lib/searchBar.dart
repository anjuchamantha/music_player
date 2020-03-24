import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.16),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Search Music...",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.mic,
            color: Colors.white,
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
