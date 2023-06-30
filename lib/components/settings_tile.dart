import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  final String title;
  final String desc;
  final IconData icon;
  final Function fn;
  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    required this.desc,
    required this.fn,
  });

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              widget.fn();
            },
            child: Container(
              padding: const EdgeInsets.all(
                10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                widget.icon,
                color: const Color.fromRGBO(1, 170, 142, 1),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                widget.desc,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
