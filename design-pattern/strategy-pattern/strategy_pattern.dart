void main(List<String> args) {
  final cityCar = CityCar(
    ZeroBrakeBehavior(),
    FullGasBehavior(),
  );
  final mountain = MountainCar(
    FullBrakeBehavior(),
    HalfGasBehavior(),
  );

  print('--- CityCar ---');
  cityCar.gasBehavior.gas();
  cityCar.brakeBehavior.brake();

  print('\n--- MountainCar ---');
  mountain.gasBehavior.gas();
  mountain.brakeBehavior.brake();
}

class Car {
  final IBrakeBehavior brakeBehavior;
  final IGasBehavior gasBehavior;

  Car(this.brakeBehavior, this.gasBehavior);
}

abstract class IBrakeBehavior {
  void brake();
}

class FullBrakeBehavior implements IBrakeBehavior {
  @override
  void brake() {
    print('FullBrakeBehavior.brake');
  }
}

class ZeroBrakeBehavior implements IBrakeBehavior {
  @override
  void brake() {
    print('ZeroBrakeBehavior.brake');
  }
}

abstract class IGasBehavior {
  void gas();
}

class FullGasBehavior implements IGasBehavior {
  @override
  void gas() {
    print('FullGasBehavior.gas');
  }
}

class HalfGasBehavior implements IGasBehavior {
  @override
  void gas() {
    print('HalfGasBehavior.gas');
  }
}

class CityCar implements Car {
  @override
  final IBrakeBehavior brakeBehavior;

  @override
  final IGasBehavior gasBehavior;

  CityCar(this.brakeBehavior, this.gasBehavior);
}

class MountainCar implements Car {
  @override
  final IBrakeBehavior brakeBehavior;

  @override
  final IGasBehavior gasBehavior;

  MountainCar(this.brakeBehavior, this.gasBehavior);
}
