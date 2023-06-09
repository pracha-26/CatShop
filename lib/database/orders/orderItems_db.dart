// To parse this JSON data, do
//
//     final orderItems = orderItemsFromJson(jsonString);

import 'dart:convert';

OrderItems orderItemsFromJson(String str) => OrderItems.fromJson(json.decode(str));

String orderItemsToJson(OrderItems data) => json.encode(data.toJson());

class OrderItems {
    List<Datum> data;
    Meta meta;

    OrderItems({
        required this.data,
        required this.meta,
    });

    factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Datum {
    int id;
    DatumAttributes attributes;

    Datum({
        required this.id,
        required this.attributes,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class DatumAttributes {
    int quantity;
    int price;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    Order order;
    Product product;

    DatumAttributes({
        required this.quantity,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.order,
        required this.product,
    });

    factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
        quantity: json["quantity"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        order: Order.fromJson(json["order"]),
        product: Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "order": order.toJson(),
        "product": product.toJson(),
    };
}

class Order {
    OrderData? data;

    Order({
        this.data,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        data: json["data"] == null ? null : OrderData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class OrderData {
    int id;
    PurpleAttributes attributes;

    OrderData({
        required this.id,
        required this.attributes,
    });

    factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class PurpleAttributes {
    int totalAmount;
    DateTime orderDate;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;

    PurpleAttributes({
        required this.totalAmount,
        required this.orderDate,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        totalAmount: json["total_amount"],
        orderDate: DateTime.parse(json["order_date"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
        "order_date": orderDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
    };
}

class Product {
    ProductData data;

    Product({
        required this.data,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: ProductData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class ProductData {
    int id;
    FluffyAttributes attributes;

    ProductData({
        required this.id,
        required this.attributes,
    });

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class FluffyAttributes {
    String pName;
    int pPrice;
    String pDescription;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;

    FluffyAttributes({
        required this.pName,
        required this.pPrice,
        required this.pDescription,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
        pName: json["p_name"],
        pPrice: json["p_price"],
        pDescription: json["p_description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "p_name": pName,
        "p_price": pPrice,
        "p_description": pDescription,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
    };
}

class Meta {
    Pagination pagination;

    Meta({
        required this.pagination,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    int page;
    int pageSize;
    int pageCount;
    int total;

    Pagination({
        required this.page,
        required this.pageSize,
        required this.pageCount,
        required this.total,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };
}
