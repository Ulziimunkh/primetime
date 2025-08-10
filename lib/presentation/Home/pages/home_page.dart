import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primetime/common/bloc/auth/auth_state_cubit.dart';
import 'package:primetime/common/bloc/button/button_state.dart';
import 'package:primetime/common/constants/constants.dart';
import 'package:primetime/common/logger/logger_service.dart';
import 'package:primetime/common/widgets/rounded_button.dart';
import 'package:primetime/domain/repository/auth.dart';
import 'package:primetime/domain/usecases/logout.dart';
import 'package:primetime/presentation/Login/pages/login_page.dart';
import 'package:primetime/presentation/Profile/pages/user_profile_page.dart';
import 'package:primetime/presentation/Signup/pages/signup_page.dart';
import 'package:primetime/service_locator.dart';

import '../../../common/bloc/auth/auth_state.dart';
import '../../../common/bloc/button/button_state_cubit.dart';

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
  final List<String> categories = [
    "All",
    "Караоке",
    "Салон",
    "Спа",
    "Маникюр & Педикюр",
    "Алжаал тайлах төв"
  ];
  final List<Map<String, String>> services = [
    {"name": "Prime Karaoke", "location": "Downtown", "category": "Караоке"},
    {"name": "Salon Beauty", "location": "Midtown", "category": "Салон"},
    {"name": "Spa Bliss", "location": "Uptown", "category": "Спа"},
    {
      "name": "Gua Maral Salon",
      "location": "Midtown",
      "category": "Маникюр & Педикюр"
    },
    {"name": "Gourmet Karaoke", "location": "Downtown", "category": "Караоке"},
    {
      "name": "Central Salon",
      "location": "Uptown",
      "category": "Маникюр & Педикюр"
    },
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
      "location": "Downtown",
    },
    {
      "name": "Spa Bliss",
      "imagePath": 'assets/images/slider-image-2.jpg',
      "details": "Relax and rejuvenate at our premium spa.",
      "location": "Uptown",
    },
    {
      "name": "Salon Beauty",
      "imagePath": 'assets/images/slider-image-4.jpg',
      "details": "Get a modern haircut and styling at our salon.",
      "location": "Midtown",
    },
    {
      "name": "Hair Salon and Wellness Center",
      "imagePath": 'assets/images/slider-image-3.jpg',
      "details": "Build your stunning new style with us and wellness centers.",
      "location": "Downtown",
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
        final matchesCategory = selectedCategory == "All" ||
            service["category"] == selectedCategory;
        final matchesName = service["name"]!
            .toLowerCase()
            .contains(searchController.text.toLowerCase());
        final matchesLocation = service["location"]!
            .toLowerCase()
            .contains(locationController.text.toLowerCase());
        return matchesCategory && matchesName && matchesLocation;
      }).toList();
      // Debugging output
      // Debugging output
      LoggerService.logInfo(
          "Filtered Services Count: ${filteredServices.length}");
      LoggerService.logInfo("Filtered Services: $filteredServices");
    });
  }

  void _onTabTapped(AuthState state, index) {
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
          if (state is Authenticated) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfilePage()));
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          }
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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: filteredServices.isEmpty
                        ? const Center(
                            child: Text(
                              "No services found.",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: filteredServices.length,
                            itemBuilder: (context, index) {
                              final service = filteredServices[index];
                              return Card(
                                child: ListTile(
                                  title: Text(service["name"]!),
                                  subtitle:
                                      Text("Location: ${service["location"]!}"),
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

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Гарах"),
          content: const Text("Та системээс гарахдаа итгэлтэй байна уу?"),
          actions: [
            RoundedButton(
              press: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              text: "Үгүй",
            ),
            RoundedButton(
              press: () {
                // Perform logout action
                context
                    .read<ButtonStateCubit>()
                    .execute(usecase: sl<LogoutUseCase>());

                Navigator.of(context).pop(); // Close the dialog
              },
              text: "Тийм",
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoggerService.logInfo(
        "Building HomePage with ${filteredServices.length} filtered services");
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthStateCubit>(
          create: (context) => AuthStateCubit()..appStarted(),
        ),
        BlocProvider<ButtonStateCubit>(
          create: (context) => ButtonStateCubit(),
        ),
      ],
      child: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            // Handle success state
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        child: BlocBuilder<AuthStateCubit, AuthState>(
          builder: (context, state) {
            // Add your widget-building logic here
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "PrimeTime",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: kPrimaryColor),
                ).animate().tint(color: kPrimaryColor).then().shake(),
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu), // Burger menu icon
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // Open the drawer
                    },
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notification action
                    },
                  ),
                ],
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
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
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
                      title: const Text("Нүүр"),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Тохиргоо"),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        // Navigate to settings page if needed
                      },
                    ),
                    if (state is UnAuthenticated) ...[
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text("Нэвтрэх"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                      ),
                    ],
                    if (state is Authenticated) ...[
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text("Миний мэдээлэл"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserProfilePage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text("Гарах"),
                        onTap: () {
                          // Handle logout action
                          //_showLogoutConfirmationDialog(context);
                          context
                              .read<ButtonStateCubit>()
                              .execute(usecase: sl<LogoutUseCase>());
                        },
                      ),
                    ],
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
                                  LoggerService.logInfo("Navigating to: $link");
                                  // You can use a package like url_launcher to open the link
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      width: size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              imageData["imagePath"]!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 20,
                                      right: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(), // Prevent internal scrolling
                        itemCount: featuredServices.length,
                        itemBuilder: (context, index) {
                          final service = featuredServices[index];
                          return GestureDetector(
                            onTap: () {
                              LoggerService.logInfo(
                                  "Clicked on: ${service['name']}");
                              // Handle navigation or action
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    // Image Section
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(service["imagePath"]!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Text Section
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                size: 16,
                                                color: Colors.red,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                service["location"] ??
                                                    "Unknown location",
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
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
                              LoggerService.logInfo(
                                  "Navigating to Үйлчилгээний нөхцөл");
                              // Handle navigation or action
                            },
                          ),
                          ListTile(
                            title: const Text("Нууцлалын бодлого"),
                            onTap: () {
                              LoggerService.logInfo(
                                  "Navigating to Нууцлалын бодлого");
                              // Handle navigation or action
                            },
                          ),
                          ListTile(
                            title: const Text("Бүтээгдэхүүн үйлчилгээ"),
                            onTap: () {
                              LoggerService.logInfo(
                                  "Navigating to Бүтээгдэхүүн үйлчилгээ");
                              // Handle navigation or action
                            },
                          ),
                          ListTile(
                            title: const Text("Сэтгэгдлүүд"),
                            onTap: () {
                              LoggerService.logInfo(
                                  "Navigating to Сэтгэгдлүүд");
                              // Handle navigation or action
                            },
                          ),
                          ListTile(
                            title: const Text("Гарын авлага"),
                            onTap: () {
                              LoggerService.logInfo(
                                  "Navigating to Гарын авлага");
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
                              LoggerService.logInfo(
                                  "Navigating to Системийн тухай");
                              // Handle navigation or action
                            },
                          ),
                          ListTile(
                            title: const Text("Хэрхэн цаг захиалах вэ?"),
                            onTap: () {
                              LoggerService.logInfo(
                                  "Navigating to Хэрхэн цаг захиалах вэ?");
                              // Handle navigation or action
                            },
                          ),
                          ListTile(
                            title: const Text("Захиалга хэрхэн цуцлах вэ?"),
                            onTap: () {
                              LoggerService.logInfo(
                                  "Navigating to Захиалга хэрхэн цуцлах вэ?");
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
                              LoggerService.logInfo("Navigating to Нэвтрэх");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                              // Handle navigation or action
                            },
                          ),
                          ListTile(
                            title: const Text("Шинээр бүртгүүлэх"),
                            onTap: () {
                              LoggerService.logInfo(
                                  "Navigating to Шинээр бүртгүүлэх");
                              // Handle navigation or action
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()),
                              );
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
                onTap: (index) => _onTabTapped(state, index),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Нүүр",
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
          },
        ),
      ),
    );
  }
}
