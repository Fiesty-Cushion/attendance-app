import 'package:flutter/material.dart';

SnackBar errorSnackBar(String? errorMessage) {
    return SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFC72C41),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Oh Snap!",
                        style: TextStyle(fontSize: 18, color: Colors.white),),
                      const Spacer(),
                      Text(
                        errorMessage!,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20)),
              child: Image.asset(
                "assets/images/bubbles.png",
                color: const Color(0xFF801336),
                height: 70,
                width: 70,
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/speech.png",
                  height: 40,
                  color: const Color(0xFF801336),
                ),
                Positioned(
                  top: 10,
                  child: Image.asset(
                    "assets/images/cross.png",
                    height: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
}

SnackBar successSnackBar(String? message) {
  return SnackBar(
    content: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          height: 90,
          decoration: const BoxDecoration(
            color: Color(0xFF4F8C7C),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Well Done!",
                      style: TextStyle(fontSize: 18, color: Colors.white),),
                    const Spacer(),
                    Text(
                      message!,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20)),
            child: Image.asset(
              "assets/images/bubbles.png",
              color: const Color(0xFF055762),
              height: 70,
              width: 70,
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/speech.png",
                height: 40,
                color: const Color(0xFF055762),
              ),
              Positioned(
                top: 10,
                child: Image.asset(
                  "assets/images/cross.png",
                  height: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

      ],
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}