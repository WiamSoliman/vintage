import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = [
      {
        'name': 'Vintage Lovers',
        'avatar': Icons.camera_alt_outlined,
        'lastMessage': 'See you at the retro party! 🎉',
        'time': '17:01',
        'unread': 2,
      },
      {
        'name': 'Oldies Music',
        'avatar': Icons.album,
        'lastMessage': 'New playlist shared!',
        'time': '16:45',
        'unread': 0,
      },
      {
        'name': 'Classic Cars',
        'avatar': Icons.directions_car,
        'lastMessage': 'Check this 1967 Mustang!',
        'time': '15:30',
        'unread': 5,
      },
      {
        'name': 'Retro Gamers',
        'avatar': Icons.videogame_asset,
        'lastMessage': 'Who wants to play Pac-Man?',
        'time': '14:10',
        'unread': 1,
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8F8F8),
              Color(0xFFEDEDED),
              Colors.white,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          children: [
            // Header décoratif avec boutons
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 48, bottom: 24, left: 16, right: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 1.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Bouton profil
                  IconButton(
                    icon: const Icon(Icons.person_outline, color: Colors.black, size: 30),
                    tooltip: 'Profile',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha((0.12 * 255).toInt()),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Groups',
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Bouton déconnexion
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.black, size: 28),
                    tooltip: 'Logout',
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const LandingPage()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
            // Liste des groupes
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                itemCount: groups.length,
                separatorBuilder: (context, index) => const SizedBox(height: 18),
                itemBuilder: (context, index) {
                  final group = groups[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(22),
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.92),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: Colors.black12, width: 1.2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.07),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                radius: 28,
                                child: Icon(
                                  group['avatar'] as IconData,
                                  color: Colors.black87,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 18),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      group['name'] as String,
                                      style: const TextStyle(
                                        fontFamily: 'Georgia',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      group['lastMessage'] as String,
                                      style: const TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: 15,
                                        color: Colors.black54,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    group['time'] as String,
                                    style: const TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  if ((group['unread'] as int) > 0)
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: Colors.white, width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.10),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        group['unread'].toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Georgia',
                                          fontSize: 13,
                                          letterSpacing: 1.1,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 