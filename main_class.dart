class Lieferkosten {
  double orderValue;
  double distance;
  bool rushHour;
  bool isRaining;
  int orderSize;
  double deliveryCost = 0.00;

  Lieferkosten(this.orderValue, this.distance, this.rushHour, this.isRaining, this.orderSize);

  void grundLieferGebeur() {
    if (distance <= 5) {
      deliveryCost += 2.50;
    } else if(distance > 5 && distance <= 10) {
      deliveryCost += 3.50;
    } else if (distance > 10) {
      deliveryCost += 5.00;
    }
  }

  void distanceZuschlag() {
    if (distance > 5) {
      int extraDistance = ((distance - 5).ceil());
      deliveryCost += extraDistance * 0.30;
    }
  }

  void wetterZuschlag() {
    if (isRaining) {
      deliveryCost += 1.50;
    }
  }

  void rushHourZuschlag() {
    if (rushHour) {
      deliveryCost += 2.0;
    }
  }

  void orderSizeZuschlag() {
    if (orderSize >= 8) {
      deliveryCost -= 2.00;
    } else if (orderSize >= 5) {
      deliveryCost -= 1.00;  
    } else if (orderSize >= 3) {
      deliveryCost -= 0.50;
    }
  }

  void minOrderValue() {
    if (orderValue < 15.00) {
      deliveryCost += 5.00;
    }
  }

  void maxDeliveryCostRule() {
    double maxDeliveryCost = orderValue * 0.4;
    if (deliveryCost > maxDeliveryCost) {
      deliveryCost = maxDeliveryCost;
    }
  }

  void roundToNearestCent() {
    deliveryCost = ((deliveryCost * 10).ceil()) / 10;
  }

  void calculateDeliveryCost() {
    grundLieferGebeur(); 
    distanceZuschlag();
    wetterZuschlag();
    rushHourZuschlag();
    orderSizeZuschlag();
    minOrderValue();
    maxDeliveryCostRule();
    roundToNearestCent();
  }

  String deliveryCategory() {
    if (deliveryCost < 5) {
      return "Günstige Lieferung";
    } else if (deliveryCost <= 10) {
      return "Standardlieferung";
    } else {
      return "Premium-Lieferung";
  } 
}
}

void main() {
  var bestellung1 = Lieferkosten(18.5, 4.2, false, false, 2);
  var bestellung2 = Lieferkosten(55.90, 8.8, true, true, 6);
  var bestellung3 = Lieferkosten(12.40, 11.2, false, false, 1);
  bestellung1.calculateDeliveryCost();
  print("Lieferkosten: ${bestellung1.deliveryCost}");
  print("Lieferkategorie: ${bestellung1.deliveryCategory()}");
  bestellung2.calculateDeliveryCost();
  print("Lieferkosten: ${bestellung2.deliveryCost}");
  print("Lieferkategorie: ${bestellung2.deliveryCategory()}");
  bestellung3.calculateDeliveryCost();
  print("Lieferkosten: ${bestellung3.deliveryCost}");
  print("Lieferkategorie: ${bestellung3.deliveryCategory()}");
}