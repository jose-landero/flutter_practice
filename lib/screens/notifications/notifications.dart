import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meru_app/widgets.dart';

enum NotificationType {
  orderConfirmed,
  dispatchingOrder,
  orderInTransit,
  orderShipped,
  pendingPayment,
}

class NotificationData {
  final String order;

  final String createdAt;

  final NotificationType type;

  NotificationData({
    required this.order,
    required this.createdAt,
    required this.type,
  });
}

final notifications = {
  'Hoy': [
    NotificationData(
      order: 'MXOC-BL210500002660',
      createdAt: '2021-08-27T18:34:24Z',
      type: NotificationType.dispatchingOrder,
    ),
    NotificationData(
      order: 'MXOC-BL210500002660',
      createdAt: '2021-08-27T17:34:24Z',
      type: NotificationType.pendingPayment,
    ),
  ],
  'Hace una semana': [
    NotificationData(
      order: 'MXOC-BL210500002660',
      createdAt: '2021-08-17T18:34:24Z',
      type: NotificationType.orderInTransit,
    ),
    NotificationData(
      order: 'MXOC-BL210500002660',
      createdAt: '2021-08-17T18:34:24Z',
      type: NotificationType.orderInTransit,
    ),
    NotificationData(
      order: 'MXOC-BL210500002660',
      createdAt: '2021-08-17T18:34:24Z',
      type: NotificationType.orderShipped,
    ),
  ]
};

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: MeruAppBar(
        title: Text(
          'Notificaciones',
          style: TextStyle(
            color: const Color(0xff0f172a),
            fontSize: 20,
            height: 24 / 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Apercu Pro',
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: _buildNotificationsList(),
        ),
      ),
    );
  }

  _buildNotificationsList() {
    final slivers = <Widget>[];

    for (var notificationGroup in notifications.entries) {
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: 24,
              left: 16,
              right: 16,
            ),
            child: Text(
              notificationGroup.key,
              style: TextStyle(
                color: const Color(0xff151522),
                fontSize: 15,
                height: 20 / 15,
                fontFamily: 'Apercu Pro',
              ),
            ),
          ),
        ),
      );

      slivers.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final notification = notificationGroup.value[index];

              if (notification.type == NotificationType.dispatchingOrder) {
                return Notification.dispatching(order: notification.order);
              }

              if (notification.type == NotificationType.orderInTransit) {
                return Notification.inTransit(order: notification.order);
              }

              if (notification.type == NotificationType.orderShipped) {
                return Notification.shipped(order: notification.order);
              }

              if (notification.type == NotificationType.pendingPayment) {
                return Notification.pendingPayment(order: notification.order);
              }
            },
            childCount: notificationGroup.value.length,
          ),
        ),
      );
    }

    slivers.add(
      SliverToBoxAdapter(
        child: SizedBox(
          height: 24,
        ),
      ),
    );

    return slivers;
  }
}

class Notification extends StatelessWidget {
  final String icon;

  final Color iconBackground;

  final Color iconForeground;

  final String title;

  final String? description;

  final String order;

  const Notification.dispatching({required this.order})
      : icon = 'icon_box.svg',
        iconBackground = const Color(0xffe6e9ee),
        iconForeground = const Color(0xff022853),
        title = 'Estamos preparando tu pedido',
        description = 'Te notificaremos cuando tu pedido esté en camino';

  const Notification.inTransit({required this.order})
      : icon = 'icon_truck.svg',
        iconBackground = const Color(0x33ffa349),
        iconForeground = const Color(0xffffa349),
        title = '¡Tu pedido está en camino!',
        description = null;

  const Notification.shipped({required this.order})
      : icon = 'icon_truck.svg',
        iconBackground = const Color(0xffe6f9f8),
        iconForeground = const Color(0xff03aca4),
        title = 'Tu pedido ha sido entregado',
        description = null;

  const Notification.pendingPayment({required this.order})
      : icon = 'icon_clock.svg',
        iconBackground = const Color(0x33ff5a72),
        iconForeground = const Color(0xffff5a72),
        title = 'Tienes un pago pendiente',
        description =
            'Realiza el pago correspondiente para poder confirmar tu pedido o cambia tu método de pago';

  @override
  Widget build(BuildContext context) {
    final notificationContent = <Widget>[
      Text(
        title,
        style: TextStyle(
          color: const Color(0xff151522),
          fontSize: 13,
          height: 22 / 13,
          fontFamily: 'Apercu Pro',
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 4),
      Text(
        "No. Pedido $order",
        style: TextStyle(
          color: const Color(0xff64748b),
          fontSize: 12,
          height: 14 / 12,
          fontFamily: 'Apercu Pro',
        ),
      ),
    ];

    if (description != null) {
      notificationContent.insertAll(
        1,
        [
          SizedBox(
            height: 4,
          ),
          Text(
            description!,
            style: TextStyle(
              color: const Color(0xff151522),
              fontSize: 13,
              height: 18 / 13,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: iconBackground,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/$icon",
                    width: 20,
                    height: 20,
                    color: iconForeground,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: notificationContent,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                '9:00 AM',
                style: TextStyle(
                  color: const Color(0xff151522),
                  fontSize: 8,
                  height: 12 / 8,
                  fontFamily: 'Apercu Pro',
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(
              height: 1,
              thickness: 1,
              color: const Color(0x4de4e4e4),
            ),
          ),
        ],
      ),
    );
  }
}
