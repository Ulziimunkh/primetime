import 'package:flutter/material.dart';
import 'package:primetime/common/constants/constants.dart';
import 'package:primetime/common/logger/logger_service.dart';

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
    TimeOfDay startTime = const TimeOfDay(hour: 8, minute: 0); // Start at 8:00 AM
    TimeOfDay endTime = const TimeOfDay(hour: 22, minute: 0); // End at 10:00 PM

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
        backgroundColor: kSecondaryRedColor,
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
              lastDate: DateTime.now().add(const Duration(days: 2)), // Restrict to 2-day range
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

                  // Check if the time slot is in the past or less than 10 minutes in advance
                  final now = DateTime.now();
                  final timeSlotDateTime = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    timeSlot.hour,
                    timeSlot.minute,
                  );
                  final isPast = timeSlotDateTime.isBefore(now.add(const Duration(minutes: 10)));

                  return GestureDetector(
                    onTap: isPast
                        ? null // Disable tap if the time slot is in the past or less than 10 minutes in advance
                        : () {
                            setState(() {
                              selectedTimeSlot = timeSlot;
                            });
                          },
                    child: Card(
                      color: isSelected
                          ? Colors.blue
                          : isPast
                              ? Colors.grey[300] // Grey out past or invalid time slots
                              : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${timeSlot.hour.toString().padLeft(2, '0')}:${timeSlot.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(
                            fontSize: 16,
                            color: isPast
                                ? Colors.grey // Grey text for past or invalid time slots
                                : isSelected
                                    ? Colors.white
                                    : Colors.black,
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
                  if (selectedTimeSlot != null) {
                    // Handle booking confirmation
                    LoggerService.logInfo(
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