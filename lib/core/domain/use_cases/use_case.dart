abstract class UseCase<Type, Params> {
  Type execute(Params params);
}

class NoParams {}
