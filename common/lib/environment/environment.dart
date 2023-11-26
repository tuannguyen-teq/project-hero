Environment currentEnvironment = Environment.DEV;

enum Environment {
  DEV,
  STG,
  PROD,
}

abstract class BaseEnvironmentData<D> {
  D dev();

  D stg();

  D prod();

  D get  getData {
    switch (currentEnvironment) {
      case Environment.DEV:
        return dev();
      case Environment.STG:
        return stg();
      case Environment.PROD:
        return prod();
      default:
        return dev();
    }
  }
}
