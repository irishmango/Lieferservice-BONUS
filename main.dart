void main() {
  double orderValue = 20.00;
  double distance = 4.2;
  bool rushHour = false;
  bool isRaining = false;
  int orderSize = 2;

  double deliveryCost = calculateDeliveryCost(orderValue, distance, rushHour, isRaining, orderSize); 
  print("Lieferkosten: ${deliveryCost.toStringAsFixed(2)}€");
  print("Lieferkategorie: ${deliveryCategory(deliveryCost)}");
}

double calculateDeliveryCost(double orderValue, double distance, bool rushHour, bool isRaining, int orderSize) {
  double deliveryCost = 0.0;

  if (distance <= 5) {
    deliveryCost += 2.50;
  } else if (distance > 5 && distance <= 10) {
    deliveryCost += 3.50;
  } else {
    deliveryCost += 5.00;
  }

  if (distance > 5) {
    int extraDistance = ((distance - 5).ceil()); 
    deliveryCost += extraDistance * 0.30;
  }

  if (isRaining) {
    deliveryCost += 1.50;
  }

  if (rushHour) {
    deliveryCost += 2.00;
  }

  if (orderSize >= 8) {
    deliveryCost -= 2.00;
  } else if (orderSize >= 5) {
    deliveryCost -= 1.00;
  } else if (orderSize >= 3) {
    deliveryCost -= 0.50;
  }

  if (orderValue < 15.00) {
    deliveryCost += 5.00;
  }

  double maxAllowedCost = orderValue * 0.40;
  if (deliveryCost > maxAllowedCost) {
    deliveryCost = maxAllowedCost;
  }

  deliveryCost = ((deliveryCost * 10).ceil()) / 10;
  return deliveryCost;
}

String deliveryCategory(double deliveryCost) {
  if (deliveryCost < 5.00) {
    return "Günstige Lieferung";
  } else if (deliveryCost <= 10.00) {
    return "Standardlieferung";
  } else {
    return "Premium-Lieferung";
  }
}