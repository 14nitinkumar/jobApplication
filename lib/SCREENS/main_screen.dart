import 'package:flutter/material.dart';

const kSectionTitleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
const kSubTextStyle = TextStyle(fontSize: 14, color: Colors.grey);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const Center(child: Text('Rewards')),
    const Center(child: Text('My Orders')),
    const Center(child: Text('Bookings')),
    const Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.black),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Home", style: TextStyle(fontSize: 16, color: Colors.black)),
                Text("Inner Circle, Connaught Place, New Delhi...",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: 'My Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  final List<Map<String, String>> popularServices = const [
    {"image": "assets/images/kitchen_cleaning.jpg", "title": "Kitchen Cleaning"},
    {"image": "assets/images/placeholder.jpg", "title": "Sofa Cleaning"},
    {"image": "assets/images/house_cleaning.jpg", "title": "Full House"},
  ];

  final List<Map<String, String>> cleaningServices = const [
    {"image": "assets/images/kitchen_cleaning2.jpg", "title": "Kitchen Cleaning"},
    {"image": "assets/images/sofa_cleaning2.jpg", "title": "Sofa Cleaning"},
    {"image": "assets/images/house_cleaning2.jpg", "title": "Full House"},
  ];

  final List<Map<String, dynamic>> features = const [
    {"icon": Icons.schedule, "label": "On Demand / Scheduled"},
    {"icon": Icons.verified, "label": "Verified Partners"},
    {"icon": Icons.emoji_emotions, "label": "Satisfaction Guarantee"},
    {"icon": Icons.attach_money, "label": "Upfront Pricing"},
    {"icon": Icons.star, "label": "Highly Trained\nProfessionals"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.black.withOpacity(0.4),
              ),
              const Positioned(
                left: 16,
                top: 16,
                bottom: 16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ServiceLabel(title: 'Renovation'),
                    ServiceLabel(title: 'Handyman'),
                    ServiceLabel(title: 'Home shifting'),
                    ServiceLabel(title: 'Gardening'),
                    ServiceLabel(title: 'Declutter'),
                    ServiceLabel(title: 'Painting'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Popular Services'),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: popularServices.length,
              itemBuilder: (context, index) {
                final service = popularServices[index];
                return ServiceCard(
                  image: service['image']!,
                  title: service['title']!,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Cleaning Services'),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: cleaningServices.length,
              itemBuilder: (context, index) {
                final service = cleaningServices[index];
                return ServiceCard(
                  image: service['image']!,
                  title: service['title']!,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: features.length,
              itemBuilder: (context, index) {
                final feature = features[index];
                return FeatureCard(
                  icon: feature['icon'],
                  label: feature['label'],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.shield_outlined, color: Colors.black),
                SizedBox(width: 8),
                Text("Why Choose Us", style: kSectionTitleStyle),
              ],
            ),
          ),
          const FCard(
            icon: Icons.verified_outlined,
            title: "Quality Assurance",
            subtitle: "Your satisfaction is guaranteed",
          ),
          const FCard(
            icon: Icons.attach_money_outlined,
            title: "Fixed Prices",
            subtitle: "No hidden costs, all the prices are known and fixed before booking",
          ),
          const FCard(
            icon: Icons.handshake_outlined,
            title: "Hassle free",
            subtitle: "Convenient, time saving and secure",
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: Colors.black,
            alignment: Alignment.center,
            child: const Text(
              "Best-in Class Safety Measures",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: kSectionTitleStyle),
    );
  }
}

class ServiceLabel extends StatelessWidget {
  final String title;
  const ServiceLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  const ServiceCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, width: 110, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 14), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  const FeatureCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.green, size: 28),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class FCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const FCard({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: Colors.orange),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: kSubTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     const HomeContent(),
//     const Center(child: Text('Rewards')),
//     const Center(child: Text('My Orders')),
//     const Center(child: Text('Bookings')),
//     const Center(child: Text('Profile')),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             const Icon(Icons.location_on, color: Colors.black),
//             const SizedBox(width: 8),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text("Home", style: TextStyle(fontSize: 16, color: Colors.black)),
//                 Text("Inner Circle, Connaught Place, New Delhi...",
//                     style: TextStyle(fontSize: 12, color: Colors.grey)),
//               ],
//             ),
//             const Spacer(),
//             IconButton(
//               icon: const Icon(Icons.search, color: Colors.black),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined), label: 'Rewards'),
//           BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: 'My Orders'),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Bookings'),
//           BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/banner.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 color: Colors.black.withOpacity(0.4),
//               ),
//               const Positioned(
//                 left: 16,
//                 top: 16,
//                 bottom: 16,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ServiceLabel(title: 'Renovation'),
//                     ServiceLabel(title: 'Handyman'),
//                     ServiceLabel(title: 'Home shifting'),
//                     ServiceLabel(title: 'Gardening'),
//                     ServiceLabel(title: 'Declutter'),
//                     ServiceLabel(title: 'Painting'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: GridView.count(
//               shrinkWrap: true,
//               crossAxisCount: 3,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               physics: const NeverScrollableScrollPhysics(),
//               children: const [
//                 ServiceIcon(icon: Icons.home_repair_service, label: 'Renovation'),
//                 ServiceIcon(icon: Icons.build, label: 'Handyman'),
//                 ServiceIcon(icon: Icons.local_shipping, label: 'Home shifting'),
//                 ServiceIcon(icon: Icons.grass, label: 'Gardening'),
//                 ServiceIcon(icon: Icons.inventory_2, label: 'Declutter'),
//                 ServiceIcon(icon: Icons.format_paint, label: 'Painting'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Text('Popular Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//           ),
//           const SizedBox(height: 12),
//           SizedBox(
//             height: 120,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: const [
//                 ServiceCard(image: 'assets/images/kitchen_cleaning.jpg', title: 'Kitchen Cleaning'),
//                 ServiceCard(image: 'assets/images/placeholder.jpg', title: 'Sofa Cleaning'),
//                 ServiceCard(image: 'assets/images/house_cleaning.jpg', title: 'Full House'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Text('Cleaning Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//           ),
//           const SizedBox(height: 12),
//           SizedBox(
//             height: 120,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: const [
//                 ServiceCard(image: 'assets/images/kitchen_cleaning2.jpg', title: 'Kitchen Cleaning'),
//                 ServiceCard(image: 'assets/images/sofa_cleaning2.jpg', title: 'Sofa Cleaning'),
//                 ServiceCard(image: 'assets/images/house_cleaning2.jpg', title: 'Full House'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           SizedBox(
//             height: 100,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: const [
//                 FeatureCard(icon: Icons.schedule, label: 'On Demand / Scheduled'),
//                 FeatureCard(icon: Icons.verified, label: 'Verified Partners'),
//                 FeatureCard(icon: Icons.emoji_emotions, label: 'Satisfaction Guarantee'),
//                 FeatureCard(icon: Icons.attach_money, label: 'Upfront Pricing'),
//                 FeatureCard(icon: Icons.star, label: 'Highly Trained\nProfessionals'),
//               ],
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Icon(Icons.shield_outlined, color: Colors.black),
//                 SizedBox(width: 8),
//                 Text("Why Choose Us", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ),
//           const FCard(
//             icon: Icons.verified_outlined,
//             title: "Quality Assurance",
//             subtitle: "Your satisfaction is guaranteed",
//           ),
//           const FCard(
//             icon: Icons.attach_money_outlined,
//             title: "Fixed Prices",
//             subtitle: "No hidden costs, all the prices are known and fixed before booking",
//           ),
//           const FCard(
//             icon: Icons.handshake_outlined,
//             title: "Hassle free",
//             subtitle: "Convenient, time saving and secure",
//           ),
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 24),
//             color: Colors.black,
//             alignment: Alignment.center,
//             child: const Text(
//               "Best-in Class Safety Measures",
//               style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class ServiceLabel extends StatelessWidget {
//   final String title;
//   const ServiceLabel({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           const Icon(Icons.check_circle_outline, color: Colors.white, size: 16),
//           const SizedBox(width: 8),
//           Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }

// class ServiceIcon extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   const ServiceIcon({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.grey.shade200,
//           child: Icon(icon, color: Colors.blue, size: 28),
//         ),
//         const SizedBox(height: 8),
//         Text(label, style: const TextStyle(fontSize: 14)),
//       ],
//     );
//   }
// }

// class ServiceCard extends StatelessWidget {
//   final String image;
//   final String title;
//   const ServiceCard({super.key, required this.image, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 110,
//       margin: const EdgeInsets.only(right: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.asset(image, width: 110, height: 70, fit: BoxFit.cover),
//           ),
//           const SizedBox(height: 6),
//           Text(title, style: const TextStyle(fontSize: 14), overflow: TextOverflow.ellipsis),
//         ],
//       ),
//     );
//   }
// }

// class FeatureCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   const FeatureCard({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       margin: const EdgeInsets.only(right: 12),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: Colors.green, size: 28),
//           const SizedBox(height: 8),
//           Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

// class FCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   const FCard({super.key, required this.icon, required this.title, required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade50,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: 32, color: Colors.orange),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 4),
//                 Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.4)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             const Icon(Icons.location_on, color: Colors.black),
//             const SizedBox(width: 8),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   "Home",
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//                 Text(
//                   "Inner Circle, Connaught Place, New Delhi...",
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             IconButton(
//               icon: const Icon(Icons.search, color: Colors.black),
//               onPressed: () {
//                 // Search logic here
//               },
//             )
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // 🖼️ Static Banner with service list overlay
//             Stack(
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/banner.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   // ignore: deprecated_member_use
//                   color: Colors.black.withOpacity(0.4),
//                 ),
//                 Positioned(
//                   left: 16,
//                   top: 16,
//                   bottom: 16,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       ServiceLabel(title: 'Renovation'),
//                       ServiceLabel(title: 'Handyman'),
//                       ServiceLabel(title: 'Home shifting'),
//                       ServiceLabel(title: 'Gardening'),
//                       ServiceLabel(title: 'Declutter'),
//                       ServiceLabel(title: 'Painting'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 24),

//             // 🔲 Grid Services
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: GridView.count(
//                 shrinkWrap: true,
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: const [
//                   ServiceIcon(icon: Icons.home_repair_service, label: 'Renovation'),
//                   ServiceIcon(icon: Icons.build, label: 'Handyman'),
//                   ServiceIcon(icon: Icons.local_shipping, label: 'Home shifting'),
//                   ServiceIcon(icon: Icons.grass, label: 'Gardening'),
//                   ServiceIcon(icon: Icons.inventory_2, label: 'Declutter'),
//                   ServiceIcon(icon: Icons.format_paint, label: 'Painting'),
//                 ],
//               ),
//             ),
//             Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Popular Services',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 120,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const [
//                     ServiceCard(
//                       image: 'assets/images/kitchen_cleaning.jpg',
//                       title: 'Kitchen Cleaning',
//                     ),
//                     ServiceCard(
//                       image: 'assets/images/placeholder.jpg',
//                       title: 'Sofa Cleaning',
//                     ),
//                     ServiceCard(
//                       image: 'assets/images/house_cleaning.jpg',
//                       title: 'Full House',
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Text(
//                 'Cleaning Services',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 120,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const [
//                     ServiceCard(
//                       image: 'assets/images/kitchen_cleaning2.jpg',
//                       title: 'Kitchen Cleaning',
//                     ),
//                     ServiceCard(
//                       image: 'assets/images/sofa_cleaning2.jpg',
//                       title: 'Sofa Cleaning',
//                     ),
//                     ServiceCard(
//                       image: 'assets/images/house_cleaning2.jpg',
//                       title: 'Full House',
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 height: 100,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const [
//                     FeatureCard(
//                       icon: Icons.schedule,
//                       label: 'On Demand / Scheduled',
//                     ),
//                     FeatureCard(
//                       icon: Icons.verified,
//                       label: 'Verified Partners',
//                     ),
//                     FeatureCard(
//                       icon: Icons.emoji_emotions,
//                       label: 'Satisfaction Guarantee',
//                     ),
//                     FeatureCard(
//                       icon: Icons.attach_money,
//                       label: 'Upfront Pricing',
//                     ),
//                     FeatureCard(
//                       icon: Icons.star,
//                       label: 'Highly Trained\nProfessionals',
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔘 Title Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: const [
//                   Icon(Icons.shield_outlined, color: Colors.black),
//                   SizedBox(width: 8),
//                   Text(
//                     "Why Choose Us",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),

//             // 🧩 Feature Cards
//             const FCard(
//               icon: Icons.verified_outlined,
//               title: "Quality Assurance",
//               subtitle: "Your satisfaction is guaranteed",
//             ),
//             const FCard(
//               icon: Icons.attach_money_outlined,
//               title: "Fixed Prices",
//               subtitle: "No hidden costs, all the prices are known\nand fixed before booking",
//             ),
//             const FCard(
//               icon: Icons.handshake_outlined,
//               title: "Hassle free",
//               subtitle: "Convenient, time saving and secure",
//             ),

//             const SizedBox(height: 24),

//             // 🏁 Footer Banner
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 24),
//               color: Colors.black,
//               alignment: Alignment.center,
//               child: const Text(
//                 "Best-in Class Safety Measures",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             )
//           ],
//         ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ServiceLabel extends StatelessWidget {
//   final String title;
//   const ServiceLabel({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           const Icon(Icons.check_circle_outline, color: Colors.white, size: 16),
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ServiceIcon extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   const ServiceIcon({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.grey.shade200,
//           child: Icon(icon, color: Colors.blue, size: 28),
//         ),
//         const SizedBox(height: 8),
//         Text(label, style: const TextStyle(fontSize: 14)),
//       ],
//     );
//   }
// }

// class ServiceCard extends StatelessWidget {
//   final String image;
//   final String title;

//   const ServiceCard({super.key, required this.image, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 110,
//       margin: const EdgeInsets.only(right: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.asset(
//               image,
//               width: 110,
//               height: 70,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 14),
//             overflow: TextOverflow.ellipsis,
//           )
//         ],
//       ),
//     );
//   }
// }

// class FeatureCard extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const FeatureCard({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       margin: const EdgeInsets.only(right: 12),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: Colors.green, size: 28),
//           const SizedBox(height: 8),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }


// class FCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;

//   const FCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade50,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: 32, color: Colors.orange),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                     height: 1.4,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


// import 'package:carousel_slider/carousel_slider.dart' as cs;
// import 'package:flutter/material.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreen();
// }

// class _MainScreen extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             const Icon(Icons.location_on, color: Colors.black),
//             const SizedBox(width: 8),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   "Home",
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//                 Text(
//                   "Inner Circle, Connaught Place, New Delhi...",
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             IconButton(
//               icon: const Icon(Icons.search, color: Colors.black),
//               onPressed: () {
//                 // Search logic here
//               },
//             )
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // 📸 Banner with service list (custom UI)
//             Stack(
//               children: [
//                 cs.CarouselSlider(
//                   items: [
//                     Image.asset(
//                       'assets/images/banner.jpg', // Replace with your image
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ],
//                   options: cs.CarouselOptions(
//                     height: 200,
//                     viewportFraction: 1.0,
//                     autoPlay: false,
//                   ),
//                 ),
//                 Positioned(
//                   left: 16,
//                   top: 16,
//                   bottom: 16,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       ServiceLabel(title: 'Renovation'),
//                       ServiceLabel(title: 'Handyman'),
//                       ServiceLabel(title: 'Home shifting'),
//                       ServiceLabel(title: 'Gardening'),
//                       ServiceLabel(title: 'Declutter'),
//                       ServiceLabel(title: 'Painting'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 24),

//             // 🔲 Grid Services
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: GridView.count(
//                 shrinkWrap: true,
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: const [
//                   ServiceIcon(icon: Icons.home_repair_service, label: 'Renovation'),
//                   ServiceIcon(icon: Icons.build, label: 'Handyman'),
//                   ServiceIcon(icon: Icons.local_shipping, label: 'Home shifting'),
//                   ServiceIcon(icon: Icons.grass, label: 'Gardening'),
//                   ServiceIcon(icon: Icons.inventory_2, label: 'Declutter'),
//                   ServiceIcon(icon: Icons.format_paint, label: 'Painting'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ServiceLabel extends StatelessWidget {
//   final String title;
//   const ServiceLabel({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           const Icon(Icons.check_circle_outline, color: Colors.white, size: 16),
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ServiceIcon extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   const ServiceIcon({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.grey.shade200,
//           child: Icon(icon, color: Colors.blue, size: 28),
//         ),
//         const SizedBox(height: 8),
//         Text(label, style: const TextStyle(fontSize: 14)),
//       ],
//     );
//   }
// }
