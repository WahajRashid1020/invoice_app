class Customer {
  final String name;
  final String email;
  final String address;
  final String pocName;
  final String documentId;
  final String initials;

  const Customer({
    required this.name,
    required this.email,
    required this.address,
    required this.pocName,
    required this.documentId,
    required this.initials,
  });

  static Customer fromJson(json) => Customer(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      pocName: json['poc_name'],
      documentId: json['document_id'],
      initials: json['initials']);
}
