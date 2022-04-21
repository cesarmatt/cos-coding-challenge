class LoginFormState {
  LoginFormState._();

  factory LoginFormState.success() = Success;
  factory LoginFormState.error() = Error;
  factory LoginFormState.loading() = Loading;
  factory LoginFormState.idle() = Idle;
}

class Success extends LoginFormState { Success(): super._(); }
class Error extends LoginFormState { Error(): super._(); }
class Loading extends LoginFormState { Loading(): super._(); }
class Idle extends LoginFormState { Idle(): super._(); }