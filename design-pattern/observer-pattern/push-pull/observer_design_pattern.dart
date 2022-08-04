Future<void> main(List<String> arguments) async {
  final station = WeatherStation();

  final console1 = ConsoleDisplay(station, '1. console');
  final console2 = ConsoleDisplay(station, '2. console');

  station.add(console1);
  station.add(console2);
  station.remove(console1);

  changeStationState(station);
}

void changeStationState(WeatherStation station) {
  const list = [24, 34, -4, 65, 12];
  for (var element in list) {
    station.temperature = element;
    station.notify();
  }
}

abstract class IObservable {
  void add(IObserver observer);
  void remove(IObserver observer);
  void notify();
}

abstract class IObserver {
  void update();
}

class WeatherStation implements IObservable {
  final Set<IObserver> observers = <IObserver>{};
  int temperature = 0;

  @override
  void add(IObserver observer) {
    observers.add(observer);
  }

  @override
  void remove(IObserver observer) {
    observers.remove(observer);
  }

  @override
  void notify() {
    for (var observer in observers) {
      observer.update();
    }
  }

  int getTemperature() {
    return temperature;
  }
}

class ConsoleDisplay implements IObserver {
  ConsoleDisplay(this.station, this.id);

  final WeatherStation station;
  final String id;
  int? temperature;

  @override
  void update() {
    temperature = station.getTemperature();
    logToConsole(temperature);
  }

  void logToConsole(int? temperature) => print('$id:: Temperature: $temperature °C');
}
