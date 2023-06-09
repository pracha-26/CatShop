// To parse this JSON data, do
//
//     final ordersId = ordersIdFromJson(jsonString);

import 'dart:convert';

OrdersId ordersIdFromJson(String str) => OrdersId.fromJson(json.decode(str));

String ordersIdToJson(OrdersId data) => json.encode(data.toJson());

class OrdersId {
    OrdersIdData data;
    Meta meta;

    OrdersId({
        required this.data,
        required this.meta,
    });

    factory OrdersId.fromJson(Map<String, dynamic> json) => OrdersId(
        data: OrdersIdData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
    };
}

class OrdersIdData {
    int id;
    PurpleAttributes attributes;

    OrdersIdData({
        required this.id,
        required this.attributes,
    });

    factory OrdersIdData.fromJson(Map<String, dynamic> json) => OrdersIdData(
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
    OrderItem usersPermissionsUser;
    OrderItem orderItem;
    OrderItem payment;

    PurpleAttributes({
        required this.totalAmount,
        required this.orderDate,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.usersPermissionsUser,
        required this.orderItem,
        required this.payment,
    });

    factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        totalAmount: json["total_amount"],
        orderDate: DateTime.parse(json["order_date"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        usersPermissionsUser: OrderItem.fromJson(json["users_permissions_user"]),
        orderItem: OrderItem.fromJson(json["order_item"]),
        payment: OrderItem.fromJson(json["payment"]),
    );

    Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
        "order_date": orderDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "users_permissions_user": usersPermissionsUser.toJson(),
        "order_item": orderItem.toJson(),
        "payment": payment.toJson(),
    };
}

class OrderItem {
    OrderItemData? data;

    OrderItem({
        this.data,
    });

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        data: json["data"] == null ? null : OrderItemData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class OrderItemData {
    int id;
    FluffyAttributes attributes;

    OrderItemData({
        required this.id,
        required this.attributes,
    });

    factory OrderItemData.fromJson(Map<String, dynamic> json) => OrderItemData(
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
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}
