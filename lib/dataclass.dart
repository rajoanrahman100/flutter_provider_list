
class DataClass {
    String createdAt;
    String id;
    String image;
    int numOfProducts;
    String title;

    DataClass({this.createdAt, this.id, this.image, this.numOfProducts, this.title});

    factory DataClass.fromJson(Map<String, dynamic> json) {
        return DataClass(
            createdAt: json['createdAt'],
            id: json['id'],
            image: json['image'],
            numOfProducts: json['numOfProducts'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['createdAt'] = this.createdAt;
        data['id'] = this.id;
        data['image'] = this.image;
        data['numOfProducts'] = this.numOfProducts;
        data['title'] = this.title;
        return data;
    }
}
class TokenClass {
    String data;
    List<Object> errors;
    String status;
    int statusCode;

    TokenClass({this.data, this.errors, this.status, this.statusCode});

    factory TokenClass.fromJson(Map<String, dynamic> json) {
        return TokenClass(
            data: json['`data`'],
            errors: json['errors'] != null ? (json['errors'] as List).map((i) => Object.fromJson(i)).toList() : null,
            status: json['status'],
            statusCode: json['statusCode'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['`data`'] = this.data;
        data['status'] = this.status;
        data['statusCode'] = this.statusCode;
        if (this.errors != null) {
            data['errors'] = this.errors.map((v) => v.toJson()).toList();
        }
        return data;
    }
}
