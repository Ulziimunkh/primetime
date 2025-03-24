import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:primetime/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String selectedCategory = "All"; // Default category
  int _currentIndex = 0; // Track the selected tab
  final List<String> categories = ["All", "Караоке", "Салон", "Спа", "Маникюр & Педикюр", "Алжаал тайлах төв"];
  final List<Map<String, String>> services = [
    {"name": "Prime Karaoke", "location": "Downtown", "category": "Караоке"},
    {"name": "Salon Beauty", "location": "Midtown", "category": "Салон"},
    {"name": "Spa Bliss", "location": "Uptown", "category": "Спа"},
    {"name": "Gua Maral Salon", "location": "Midtown", "category": "Маникюр & Педикюр"},
    {"name": "Gourmet Karaoke", "location": "Downtown", "category": "Караоке"},
    {"name": "Central Salon", "location": "Uptown", "category": "Маникюр & Педикюр"},
    {"name": "Hotel Prime Salon", "location": "Downtown", "category": "Салон"},
    {"name": "Salon Beauty Spa", "location": "Midtown", "category": "Спа"},
    {"name": "Spa Bliss", "location": "Uptown", "category": "Spa"},
    {"name": "Relax", "location": "Midtown", "category": "Алжаал тайлах төв"},
    {"name": "Rest", "location": "Downtown", "category": "Салон"},
    {"name": "SSS Central", "location": "Uptown", "category": "Спа"},
  ];
  List<Map<String, String>> filteredServices = [];
  final List<Map<String, String>> carouselImages = [
  {
    "imagePath": 'assets/images/slider-image-1.jpg',
    "title": "Welcome to PrimeTime",
    "link": "https://example.com/slider1",
    "details": "Discover the best services in your area with PrimeTime."
  },
  {
    "imagePath": 'assets/images/slider-image-2.jpg',
    "title": "Relax and Unwind",
    "link": "https://example.com/slider2",
    "details": "Find the best spas and relaxation centers near you."
  },
  {
    "imagePath": 'assets/images/slider-image-3.jpg',
    "title": "Exclusive Offers",
    "link": "https://example.com/slider3",
    "details": "Check out our exclusive offers and discounts."
  },
  {
    "imagePath": 'assets/images/slider-image-4.jpg',
    "title": "Modern Styled Hair cut",
    "link": "https://example.com/slider4",
    "details": "Check out our exclusive offers and discounts."
  },
  {
    "imagePath": 'assets/images/slider-image-5.jpg',
    "title": "Hair Salon and Wellness center",
    "link": "https://example.com/slider5",
    "details": "Build your stunning new style with us and wellness centers."
  },
  {
    "imagePath": 'assets/images/slider-image-6.jpg',
    "title": "VIP Karaoke",
    "link": "https://example.com/slider6",
    "details": "Indulge in luxury experiences and premium services."
  },
];
  final List<Map<String, String>> featuredServices = [
    {
      "name": "Prime Karaoke",
      "imagePath": 'assets/images/slider-image-6.jpg',
      "details": "Enjoy the best karaoke experience in town.",
    },
    {
      "name": "Spa Bliss",
      "imagePath": 'assets/images/slider-image-2.jpg',
      "details": "Relax and rejuvenate at our premium spa.",
    },
    {
      "name": "Salon Beauty",
      "imagePath": 'assets/images/slider-image-4.jpg',
      "details": "Get a modern haircut and styling at our salon.",
    },
    {
      "name": "Hair Salon and Wellness center",
      "imagePath": 'assets/images/slider-image-3.jpg',
      "details": "Build your stunning new style with us and wellness centers.",
    },
  ];
  @override
  void initState() {
    super.initState();
    filteredServices = services; // Initially show all services
  }

  void _filterServices() {
    setState(() {
      filteredServices = services.where((service) {
        final matchesCategory = selectedCategory == "All" || service["category"] == selectedCategory;
        final matchesName = service["name"]!.toLowerCase().contains(searchController.text.toLowerCase());
        final matchesLocation = service["location"]!.toLowerCase().contains(locationController.text.toLowerCase());
        return matchesCategory && matchesName && matchesLocation;
      }).toList();
          // Debugging output
     // Debugging output
    print("Filtered Services Count: ${filteredServices.length}");
    print("Filtered Services: $filteredServices");
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 1:
          // Handle the second tab
          break;
        case 2:
          // Handle the third tab
          filteredServices = services; // Initially show all services
          _showSearchPopup(context);
          break;
        case 3:
          // Handle the fourth tab
          break;
        case 4:
          // Handle the fifth tab
          break;
        default:
          // Handle the first tab
          break;
      }
    });
  }
 void _showSearchPopup(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Категори сонгох:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  value: selectedCategory,
                  isExpanded: true,
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setModalState(() {
                      selectedCategory = value!;
                      _filterServices();
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: "Нэрээр хайх",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setModalState(() {
                      _filterServices();
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: "Байршилаар хайх",
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setModalState(() {
                      _filterServices();
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  "Илэрц: ${filteredServices.length}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: filteredServices.isEmpty
                      ? const Center(
                          child: Text(
                            "No services found.",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredServices.length,
                          itemBuilder: (context, index) {
                            final service = filteredServices[index];
                            return Card(
                              child: ListTile(
                                title: Text(service["name"]!),
                                subtitle: Text("Location: ${service["location"]!}"),
                                trailing: Text(service["category"]!),
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the popup
                      },
                      child: const Text("Close"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    print("Building HomePage with ${filteredServices.length} filtered services");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PrimeTime",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: kPrimaryColor),
        ),
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Burger menu icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "PrimeTime",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to settings page if needed
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Handle logout logic
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: carouselImages.map((imageData) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          // Handle link navigation
                          final String link = imageData["link"]!;
                          print("Navigating to: $link");
                          // You can use a package like url_launcher to open the link
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(imageData["imagePath"]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 20,
                              right: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    imageData["title"]!,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      backgroundColor: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    imageData["details"]!,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      backgroundColor: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // "Онцлох" Section
              const Text(
                "Онцлох",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Prevent internal scrolling
                itemCount: featuredServices.length,
                itemBuilder: (context, index) {
                  final service = featuredServices[index];
                  return GestureDetector(
                    onTap: () {
                      print("Clicked on: ${service['name']}");
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(service["imagePath"]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service["name"]!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    service["details"]!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Footer Section
              const Divider(),
              const SizedBox(height: 8),
              ExpansionTile(
                leading: const Icon(Icons.info_outline),
                title: const Text("Бидний тухай"),
                children: [
                  ListTile(
                    title: const Text("Үйлчилгээний нөхцөл"),
                    onTap: () {
                      print("Navigating to Үйлчилгээний нөхцөл");
                      // Handle navigation or action
                    },
                  ),
                  ListTile(
                    title: const Text("Нууцлалын бодлого"),
                    onTap: () {
                      print("Navigating to Нууцлалын бодлого");
                      // Handle navigation or action
                    },
                  ),
                  ListTile(
                    title: const Text("Бүтээгдэхүүн үйлчилгээ"),
                    onTap: () {
                      print("Navigating to Бүтээгдэхүүн үйлчилгээ");
                      // Handle navigation or action
                    },
                  ),
                  ListTile(
                    title: const Text("Сэтгэгдлүүд"),
                    onTap: () {
                      print("Navigating to Сэтгэгдлүүд");
                      // Handle navigation or action
                    },
                  ),
                  ListTile(
                    title: const Text("Гарын авлага"),
                    onTap: () {
                      print("Navigating to Гарын авлага");
                      // Handle navigation or action
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.help_outline),
                title: const Text("Тусламж"),
                children: [
                  ListTile(
                    title: const Text("Системийн тухай"),
                    onTap: () {
                      print("Navigating to Системийн тухай");
                      // Handle navigation or action
                    },
                  ),
                  ListTile(
                    title: const Text("Хэрхэн цаг захиалах вэ?"),
                    onTap: () {
                      print("Navigating to Хэрхэн цаг захиалах вэ?");
                      // Handle navigation or action
                    },
                  ),
                  ListTile(
                    title: const Text("Захиалга хэрхэн цуцлах вэ?"),
                    onTap: () {
                      print("Navigating to Захиалга хэрхэн цуцлах вэ?");
                      // Handle navigation or action
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.person_outline),
                title: const Text("Миний булан"),
                children: [
                  ListTile(
                    title: const Text("Нэвтрэх"),
                    onTap: () {
                      print("Navigating to Нэвтрэх");
                      // Handle navigation or action
                    },
                  ),
                  ListTile(
                    title: const Text("Шинээр бүртгүүлэх"),
                    onTap: () {
                      print("Navigating to Шинээр бүртгүүлэх");
                      // Handle navigation or action
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  "© 2025 PrimeTime. All rights reserved.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Онцлох",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Хайлт",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Хадгалсан",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профайл",
          ),
        ],
      ),
    );
  }
}