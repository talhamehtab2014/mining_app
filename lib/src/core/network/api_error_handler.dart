class ApiErrorsHandler {
  final Map<String, List<String>> errors;
  final String errorDescription;

  ApiErrorsHandler({required this.errors, this.errorDescription = ""});

  factory ApiErrorsHandler.fromJson(Map<String, dynamic> json) {
    final Map<String, List<String>> parsedErrors = {};
    String description = "";

    json.forEach((key, value) {
      if (value is List) {
        parsedErrors[key] = List<String>.from(value.map((e) => e.toString()));
        description += "${parsedErrors[key]!.join(', ')}\n";
      } else {
        parsedErrors[key] = [value.toString()];
        if (parsedErrors['message'] != null) {
          description += "${parsedErrors['message']?[0]}";
        }
      }
    });

    return ApiErrorsHandler(
      errors: parsedErrors,
      errorDescription: description,
    );
  }

  bool hasError(String field) {
    return errors.containsKey(field);
  }

  List<String>? getErrors(String field) {
    return errors[field];
  }

  String generateErrorDescription() {
    return errors.entries
        .map((entry) => "${entry.key}: ${entry.value.join(', ')}")
        .join("\n");
  }

  @override
  String toString() {
    return errorDescription;
  }
}
