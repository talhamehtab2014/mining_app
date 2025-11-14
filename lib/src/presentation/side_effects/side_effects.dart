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

class UpdateFieldValues implements UiEffect {
  final String? value1;
  final String? value2;
  final String? value3;
  final String? value4;
  final String? value5;

  UpdateFieldValues({
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
  });
}
