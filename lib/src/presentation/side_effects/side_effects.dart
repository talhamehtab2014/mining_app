sealed class UiEffect {}

class ShowUserNameTitle implements UiEffect {
  final String title;
  final String balance;
  ShowUserNameTitle(this.title, this.balance);
}

class ShowError implements UiEffect {
  final String title;
  final String message;
  ShowError(this.title, this.message);
}