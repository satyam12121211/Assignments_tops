class Vehicle {
  String type;
  String fuelType;
  int maxSpeed;

  Vehicle(this.type, this.fuelType, this.maxSpeed);

  void displayDetails() {
    print("Vehicle Type: $type");
    print("Fuel Type: $fuelType");
    print("Max Speed: $maxSpeed km/h");
  }
}

class Car extends Vehicle {
  Car(String fuelType, int maxSpeed) : super("Car", fuelType, maxSpeed);
}

class Bike extends Vehicle {
  Bike(String fuelType, int maxSpeed) : super("Bike", fuelType, maxSpeed);
}

void main() {
  Car car = Car("Petrol", 220);
  car.displayDetails();

  Bike bike = Bike("petrol", 160);
  bike.displayDetails();
}
