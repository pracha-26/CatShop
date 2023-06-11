// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
    List<Datum> data;
    Meta meta;

    Orders({
        required this.data,
        required this.meta,
    });

    factory Orders.fromJson(Map<String, dynamic> json) => Orders(
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
    int totalAmount;
    DateTime orderDate;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    UsersPermissionsUser usersPermissionsUser;
    OrderItem orderItem;

    DatumAttributes({
        required this.totalAmount,
        required this.orderDate,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.usersPermissionsUser,
        required this.orderItem,
    });

    factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
        totalAmount: json["total_amount"],
        orderDate: DateTime.parse(json["order_date"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        usersPermissionsUser: UsersPermissionsUser.fromJson(json["users_permissions_user"]),
        orderItem: OrderItem.fromJson(json["order_item"]),
    );

    Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
        "order_date": orderDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "users_permissions_user": usersPermissionsUser.toJson(),
        "order_item": orderItem.toJson(),
    };
}

class OrderItem {
    OrderItemData data;

    OrderItem({
        required this.data,
    });

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        data: OrderItemData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class OrderItemData {
    int id;
    PurpleAttributes attributes;

    OrderItemData({
        required this.id,
        required this.attributes,
    });

    factory OrderItemData.fromJson(Map<String, dynamic> json) => OrderItemData(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class PurpleAttributes {
    int quantity;
    int price;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    String? urlImage;

    PurpleAttributes({
        required this.quantity,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        this.urlImage,
    });

    factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        quantity: json["quantity"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        urlImage: json["url_image"],
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "url_image": urlImage,
    };
}

class UsersPermissionsUser {
    UsersPermissionsUserData data;

    UsersPermissionsUser({
        required this.data,
    });

    factory UsersPermissionsUser.fromJson(Map<String, dynamic> json) => UsersPermissionsUser(
        data: UsersPermissionsUserData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class UsersPermissionsUserData {
    int id;
    FluffyAttributes attributes;

    UsersPermissionsUserData({
        required this.id,
        required this.attributes,
    });

    factory UsersPermissionsUserData.fromJson(Map<String, dynamic> json) => UsersPermissionsUserData(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class FluffyAttributes {
    String username;
    String email;
    String provider;
    bool confirmed;
    bool blocked;
    DateTime createdAt;
    DateTime updatedAt;
    String phone;

    FluffyAttributes({
        required this.username,
        required this.email,
        required this.provider,
        required this.confirmed,
        required this.blocked,
        required this.createdAt,
        required this.updatedAt,
        required this.phone,
    });

    factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "phone": phone,
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
