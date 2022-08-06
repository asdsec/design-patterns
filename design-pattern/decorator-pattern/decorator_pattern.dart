void main(List<String> args) {
  print('--- Coffee 1 ---');
  final coffee1 = SoyDecorator(Espresso());
  print('cost: 1 + 9 = 10');
  final cost1 = coffee1.cost();
  print(cost1);

  print('\n--- Coffee 2 ---');
  final coffee2 = SoyDecorator(CaramelDecorator(Decaf()));
  print('cost: 2 + 5 + 9 = 16');
  final cost2 = coffee2.cost();
  print(cost2);
}

abstract class Beverage {
  int cost();
}

abstract class AddOnDecorator implements Beverage {
  const AddOnDecorator(this.beverage);

  final Beverage beverage;

  @override
  int cost();
}

class Espresso implements Beverage {
  @override
  int cost() {
    return 1;
  }
}

class Decaf implements Beverage {
  @override
  int cost() {
    return 2;
  }
}

class CaramelDecorator implements AddOnDecorator {
  CaramelDecorator(this.beverage);

  @override
  final Beverage beverage;

  @override
  int cost() {
    return beverage.cost() + 5;
  }
}

class SoyDecorator implements AddOnDecorator {
  SoyDecorator(this.beverage);

  @override
  final Beverage beverage;

  @override
  int cost() {
    return beverage.cost() + 9;
  }
}
