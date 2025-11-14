sealed class UiEffect {}

class ShowUserNameTitle implements UiEffect {
  final String title;
  final String balance;
  ShowUserNameTitle(this.title, this.balance);
}