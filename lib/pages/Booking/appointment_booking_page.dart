import 'package:flutter/material.dart';

class AppointmentBookingPage extends StatefulWidget {
  const AppointmentBookingPage({super.key});

  @override
  State<AppointmentBookingPage> createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTimeSlot; // Selected time slot
  final List<TimeOfDay> timeSlots = []; // List of 2-hour interval time slots

  @override
  void initState() {
    super.initState();
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    // Generate time slots with a 2-hour interval
    TimeOfDay startTime = const TimeOfDay(hour: 12, minute: 0); // Start at 8:00 AM
    TimeOfDay endTime = const TimeOfDay(hour: 22, minute: 0); // End at 8:00 PM

    while (startTime.hour < endTime.hour || (startTime.hour == endTime.hour && startTime.minute < endTime.minute)) {
      timeSlots.add(startTime);
      startTime = TimeOfDay(hour: startTime.hour + 2, minute: startTime.minute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Цаг сонгох"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Өдөр:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
              onDateChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Цагийн хуваарь (2 цагийн интервал):",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  final timeSlot = timeSlots[index];
                  final isSelected = selectedTimeSlot == timeSlot;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTimeSlot = timeSlot;
                      });
                    },
                    child: Card(
                      color: isSelected ? Colors.blue : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${timeSlot.hour.toString().padLeft(2, '0')}:${timeSlot.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedDate != null && selectedTimeSlot != null) {
                    // Handle booking confirmation
                    print(
                        "Appointment booked for $selectedDate at ${selectedTimeSlot!.hour.toString().padLeft(2, '0')}:${selectedTimeSlot!.minute.toString().padLeft(2, '0')}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Appointment booked for ${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')} at ${selectedTimeSlot!.hour.toString().padLeft(2, '0')}:${selectedTimeSlot!.minute.toString().padLeft(2, '0')}",
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select both date and time slot."),
                      ),
                    );
                  }
                },
                child: const Text("Үргэлжлүүлэх"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}