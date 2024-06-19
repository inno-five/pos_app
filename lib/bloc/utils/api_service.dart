enum Environment { dev, test, prod }

class ApiService {
  static String getBaseUrl(Environment environment) {
    switch (environment) {
      case Environment.dev:
        return 'http://localhost:3001';
      case Environment.test:
        return 'http://localhost:3001';
      case Environment.prod:
        return 'http://localhost:3001';
    }
  }
}
