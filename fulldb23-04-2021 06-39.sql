#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Группы';

INSERT INTO `communities` (`id`, `name`, `created_at`, `update_at`) VALUES (1, 'neque', '2011-12-16 09:25:27', '2016-08-14 00:28:08');
INSERT INTO `communities` (`id`, `name`, `created_at`, `update_at`) VALUES (2, 'magnam', '2014-06-11 08:32:43', '2017-01-01 11:27:33');
INSERT INTO `communities` (`id`, `name`, `created_at`, `update_at`) VALUES (3, 'asperiores', '2011-06-12 03:43:21', '2011-06-15 08:46:23');
INSERT INTO `communities` (`id`, `name`, `created_at`, `update_at`) VALUES (4, 'sed', '2014-04-03 18:29:37', '2014-01-11 00:49:02');
INSERT INTO `communities` (`id`, `name`, `created_at`, `update_at`) VALUES (5, 'omnis', '2017-12-12 09:33:49', '2015-06-23 02:35:06');


#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `communities_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на группу',
  `users_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (`communities_id`,`users_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';

INSERT INTO `communities_users` (`communities_id`, `users_id`, `created_at`) VALUES (1, 43, '2020-02-24 05:48:23');
INSERT INTO `communities_users` (`communities_id`, `users_id`, `created_at`) VALUES (1, 94, '2013-12-19 16:06:05');
INSERT INTO `communities_users` (`communities_id`, `users_id`, `created_at`) VALUES (4, 14, '2017-06-11 02:18:32');
INSERT INTO `communities_users` (`communities_id`, `users_id`, `created_at`) VALUES (4, 52, '2016-03-16 08:04:43');
INSERT INTO `communities_users` (`communities_id`, `users_id`, `created_at`) VALUES (5, 16, '2020-02-16 01:39:55');


#
# TABLE STRUCTURE FOR: friendshep_statuses
#

DROP TABLE IF EXISTS `friendshep_statuses`;

CREATE TABLE `friendshep_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статусы дружбы';

INSERT INTO `friendshep_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'ea', '2012-08-28 13:03:18', '2013-01-01 22:44:42');
INSERT INTO `friendshep_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'ut', '2014-10-06 05:11:20', '2014-06-20 13:44:51');
INSERT INTO `friendshep_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'dolores', '2014-02-03 00:49:03', '2014-12-26 21:06:25');
INSERT INTO `friendshep_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'vero', '2018-10-01 04:05:21', '2016-08-29 08:50:37');
INSERT INTO `friendshep_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'sint', '2015-02-07 13:29:41', '2016-11-16 20:59:14');


#
# TABLE STRUCTURE FOR: friendship
#

DROP TABLE IF EXISTS `friendship`;

CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `friend_status_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на статус (текущее состояние) отношений',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица дружбы';

INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (1, 71, 46, '2019-11-23 00:06:15', '2012-05-13 07:10:56', '2013-01-28 18:00:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (1, 89, 71, '2015-11-06 10:25:57', '2017-08-02 00:00:47', '2015-06-21 17:27:21');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (3, 48, 64, '2015-04-21 23:31:20', '2013-01-23 16:21:57', '2012-10-25 23:48:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (3, 78, 39, '2013-06-18 08:31:55', '2011-11-09 04:21:49', '2015-07-17 22:52:45');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (4, 47, 69, '2017-03-19 12:06:35', '2012-09-27 18:07:39', '2012-12-18 20:45:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (4, 99, 99, '2021-04-22 09:23:19', '2017-03-15 13:59:31', '2012-12-14 08:57:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (5, 22, 30, '2014-06-04 05:06:41', '2016-11-10 16:20:14', '2018-09-12 16:02:29');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (7, 37, 86, '2017-09-11 21:56:01', '2014-10-08 08:30:45', '2018-05-16 12:51:56');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (8, 70, 72, '2020-05-18 23:42:38', '2018-01-21 10:06:47', '2012-09-06 02:51:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (9, 7, 60, '2013-02-14 22:10:26', '2019-06-09 16:16:47', '2018-01-15 10:39:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (12, 49, 40, '2019-12-07 15:17:49', '2012-06-29 16:00:36', '2019-01-11 18:20:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (12, 89, 54, '2015-12-11 17:40:31', '2020-03-20 20:42:45', '2019-09-09 00:21:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (12, 98, 82, '2017-11-08 15:26:03', '2014-06-02 16:30:51', '2017-03-10 04:09:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (15, 36, 7, '2017-07-29 09:35:05', '2013-10-19 10:26:21', '2019-06-11 11:28:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (17, 53, 36, '2013-09-13 11:31:50', '2012-11-22 16:23:02', '2016-09-13 17:07:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (17, 61, 71, '2013-01-11 21:57:42', '2019-03-30 16:22:33', '2014-12-29 02:44:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (17, 70, 96, '2013-10-27 13:56:42', '2013-05-08 05:13:38', '2012-07-15 15:43:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (17, 72, 76, '2014-09-15 04:16:48', '2012-08-21 22:55:40', '2015-10-11 00:36:35');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (18, 54, 9, '2013-10-13 09:41:11', '2018-10-17 08:48:20', '2016-04-15 05:50:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (18, 97, 67, '2012-07-26 16:40:52', '2014-05-18 18:21:02', '2015-11-12 14:44:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (19, 2, 70, '2019-01-08 17:38:36', '2012-09-28 23:42:32', '2012-04-11 00:55:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (19, 100, 70, '2019-12-15 23:14:55', '2018-10-24 06:49:03', '2020-06-12 06:40:52');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (20, 82, 38, '2015-09-17 15:49:55', '2013-07-19 09:05:53', '2018-08-21 22:36:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (20, 87, 58, '2021-02-17 01:24:33', '2015-06-25 13:36:27', '2015-12-23 00:31:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (21, 69, 71, '2015-11-25 00:48:05', '2013-11-14 19:04:50', '2020-06-28 12:54:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (21, 89, 76, '2019-03-21 00:37:12', '2012-06-12 05:52:12', '2011-09-10 00:45:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (22, 74, 64, '2012-09-01 06:33:29', '2013-10-27 05:38:52', '2011-04-25 11:38:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (23, 88, 78, '2016-12-12 01:35:23', '2014-06-08 09:36:25', '2014-07-31 03:59:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (24, 51, 2, '2013-09-01 03:17:54', '2013-08-26 01:38:08', '2013-05-04 13:36:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (25, 2, 73, '2020-03-19 05:06:35', '2015-08-14 01:26:09', '2017-11-21 05:37:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (25, 15, 6, '2014-09-29 00:34:50', '2014-06-17 07:59:54', '2017-09-24 15:14:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (26, 91, 47, '2014-05-19 18:23:54', '2013-11-19 13:24:29', '2016-06-11 10:14:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (29, 34, 48, '2014-01-13 05:28:13', '2020-10-01 23:40:17', '2015-05-11 19:14:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (31, 78, 10, '2019-07-16 18:47:40', '2017-06-12 21:49:46', '2020-05-23 22:00:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (34, 16, 94, '2012-06-10 14:04:54', '2019-01-05 19:13:45', '2019-04-04 23:28:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (34, 78, 69, '2015-12-24 20:26:49', '2011-12-29 07:20:15', '2012-11-28 09:13:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (35, 59, 59, '2013-10-18 23:13:17', '2015-02-23 16:50:50', '2015-07-01 13:23:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (35, 77, 19, '2021-01-07 05:56:14', '2017-07-09 04:05:09', '2017-02-03 14:29:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (36, 31, 67, '2012-06-12 20:25:10', '2014-11-18 18:31:47', '2014-07-13 07:25:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (37, 39, 3, '2015-04-06 21:40:08', '2016-10-20 02:08:46', '2011-05-17 04:09:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (39, 42, 92, '2015-09-10 12:10:41', '2017-01-16 23:56:59', '2018-08-31 04:07:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (40, 62, 6, '2020-03-11 21:40:56', '2016-01-12 18:28:32', '2020-08-18 01:00:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (41, 77, 81, '2016-12-22 16:02:56', '2017-02-19 22:21:03', '2012-06-23 08:42:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (44, 48, 42, '2011-07-21 22:28:13', '2018-11-10 01:13:43', '2019-03-03 23:00:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (44, 86, 73, '2011-05-20 04:39:06', '2015-06-11 14:23:44', '2011-07-08 14:26:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (45, 1, 37, '2013-10-22 07:41:16', '2018-09-19 02:40:13', '2017-04-13 22:14:55');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (46, 18, 26, '2014-12-11 22:00:27', '2019-08-18 10:00:18', '2013-12-12 14:45:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (46, 33, 89, '2019-04-23 04:51:49', '2016-06-01 00:55:46', '2016-01-03 23:54:13');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (48, 15, 59, '2012-11-13 16:35:25', '2015-05-04 14:10:41', '2019-04-11 01:12:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (48, 60, 97, '2016-11-15 10:25:40', '2012-04-24 18:55:43', '2016-01-15 05:35:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (48, 89, 59, '2013-12-16 19:29:08', '2015-10-30 14:44:16', '2015-10-10 10:16:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (49, 15, 19, '2021-03-22 18:35:14', '2017-03-14 16:38:17', '2015-09-08 06:16:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (51, 73, 84, '2018-09-27 19:52:18', '2014-11-15 14:09:03', '2019-03-17 15:18:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (52, 35, 20, '2013-07-30 13:37:15', '2012-02-04 12:54:32', '2013-07-19 04:56:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (53, 44, 91, '2017-09-25 07:48:49', '2020-12-23 21:06:33', '2016-03-30 05:06:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (53, 54, 20, '2015-08-26 11:41:10', '2014-11-27 03:04:53', '2019-08-06 04:16:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (55, 14, 96, '2014-08-07 05:10:25', '2011-06-15 19:49:21', '2017-03-29 18:09:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (55, 30, 36, '2020-02-04 13:01:50', '2013-04-11 09:52:53', '2020-08-05 04:24:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (57, 35, 65, '2018-02-15 23:29:37', '2014-12-08 14:01:20', '2012-01-18 02:39:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (59, 50, 9, '2016-12-22 05:13:29', '2020-05-18 19:52:38', '2018-01-08 05:55:29');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (59, 94, 84, '2019-11-29 05:19:17', '2014-02-11 16:08:02', '2012-07-24 07:00:38');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (61, 7, 59, '2019-05-04 13:13:07', '2019-11-18 09:57:30', '2018-05-31 08:47:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (64, 77, 43, '2012-11-17 12:12:56', '2013-05-25 04:51:02', '2015-04-20 17:39:15');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (65, 4, 23, '2012-07-22 15:30:38', '2014-11-26 09:25:51', '2015-12-09 01:51:53');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (67, 92, 32, '2014-05-18 05:18:57', '2017-08-25 18:41:49', '2020-09-14 05:20:07');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (68, 38, 47, '2018-05-26 07:00:30', '2015-05-21 05:02:48', '2017-05-26 22:35:53');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (69, 36, 81, '2017-12-07 01:20:05', '2015-08-09 19:23:00', '2012-09-27 15:22:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (74, 99, 92, '2020-08-04 20:04:24', '2011-08-08 07:48:06', '2013-06-12 01:42:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (78, 26, 46, '2017-06-06 13:39:25', '2014-02-17 12:25:46', '2018-03-07 22:19:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (78, 99, 89, '2018-03-11 04:11:02', '2020-06-01 01:03:38', '2014-12-27 14:13:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (79, 3, 45, '2014-01-26 22:42:57', '2018-05-09 21:46:41', '2014-04-02 21:27:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (79, 19, 59, '2018-05-27 03:49:07', '2014-12-08 07:07:55', '2020-09-02 10:20:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (80, 30, 3, '2014-07-17 17:43:53', '2014-05-09 03:19:45', '2013-06-26 08:24:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (81, 80, 45, '2015-02-16 02:19:09', '2011-07-17 16:26:53', '2020-04-19 07:21:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (82, 30, 69, '2018-05-12 02:01:24', '2011-08-31 12:39:39', '2012-09-28 05:17:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (82, 58, 39, '2018-12-12 08:12:42', '2012-03-05 05:15:40', '2017-02-16 02:22:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (82, 68, 54, '2020-12-08 10:51:21', '2012-01-31 10:51:53', '2017-03-16 00:43:35');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (84, 61, 2, '2011-06-23 13:05:47', '2014-01-27 18:12:48', '2012-02-17 04:59:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (85, 89, 32, '2012-09-07 03:39:03', '2017-10-03 12:19:49', '2015-09-04 14:13:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (86, 55, 14, '2013-11-05 20:54:17', '2019-02-06 07:22:41', '2018-03-23 13:27:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (86, 64, 9, '2012-10-28 11:50:37', '2020-10-16 15:00:37', '2017-06-30 07:16:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (87, 3, 83, '2012-03-03 08:48:32', '2020-02-04 09:10:58', '2018-06-18 09:15:52');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (87, 14, 61, '2014-11-18 15:07:56', '2014-04-10 02:07:04', '2014-02-18 06:54:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (87, 27, 73, '2016-01-01 01:19:27', '2011-06-30 22:32:09', '2018-03-17 11:12:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (88, 17, 48, '2020-04-13 01:42:11', '2014-07-22 12:42:45', '2016-03-31 05:05:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (88, 94, 62, '2013-12-10 12:40:08', '2021-02-06 19:22:11', '2016-03-10 05:52:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (89, 9, 2, '2015-04-30 12:01:36', '2020-06-22 18:30:45', '2019-10-25 16:43:55');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (89, 86, 33, '2013-07-27 05:15:57', '2018-09-26 11:24:42', '2015-09-17 05:00:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (90, 11, 70, '2015-03-18 04:01:40', '2015-02-22 14:19:59', '2014-12-28 10:05:25');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (90, 63, 59, '2013-12-31 03:15:32', '2017-09-08 02:56:57', '2013-07-23 19:56:42');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (90, 87, 34, '2015-05-30 07:20:13', '2012-04-14 03:30:22', '2016-12-30 16:56:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (92, 1, 8, '2020-01-25 13:40:12', '2014-02-16 11:59:01', '2019-07-03 23:14:15');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (92, 30, 69, '2016-03-18 05:46:09', '2014-12-28 05:48:35', '2012-04-29 07:45:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (92, 33, 68, '2020-12-13 04:45:25', '2011-10-13 18:04:32', '2020-05-07 07:38:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (93, 57, 57, '2013-08-13 17:43:16', '2013-05-23 13:12:57', '2012-08-24 20:38:17');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (93, 67, 65, '2017-04-13 13:18:52', '2012-06-15 13:19:06', '2011-10-31 04:29:21');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (93, 86, 39, '2013-08-12 08:55:35', '2017-01-06 21:08:28', '2020-09-30 03:48:35');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (96, 16, 1, '2015-11-22 03:55:04', '2014-11-10 22:06:56', '2015-04-11 22:57:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (99, 49, 23, '2018-02-16 19:15:02', '2019-12-30 20:40:41', '2013-08-17 15:39:09');
INSERT INTO `friendship` (`user_id`, `friend_id`, `friend_status_id`, `confirmed_at`, `created_at`, `update_at`) VALUES (99, 79, 67, '2020-09-18 21:27:58', '2021-03-08 11:51:25', '2018-10-28 08:15:10');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя, который загрузил файл',
  `filename` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Путь к файлу',
  `size` int(11) NOT NULL COMMENT 'Размер файла',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Метаданные файла' CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Ссылка на тип контента',
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Медиафайлы';

#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Типы медиафайлов';

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'quis', '2014-05-30 16:39:58', '2012-12-25 22:05:26');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'excepturi', '2015-04-01 21:56:48', '2016-08-09 07:10:57');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'praesentium', '2015-05-30 20:08:30', '2014-11-01 11:35:32');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'qui', '2012-01-22 10:12:00', '2012-05-22 03:54:00');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'ut', '2015-09-25 02:00:12', '2015-03-18 23:32:38');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `create_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сообщения';

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (1, 34, 87, 'Ex vero qui enim rerum tempora. Omnis hic alias deserunt. Dolorum repudiandae non id voluptatem. Distinctio quibusdam inventore ut.', 1, 0, '2012-02-14 06:56:53');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (2, 56, 98, 'Dolores id sed soluta ea. Accusantium natus iure ut laudantium adipisci. Sed voluptas rerum quos et. Ad voluptas voluptas voluptates itaque pariatur. Repudiandae et magnam facilis iste.', 0, 1, '2013-10-13 10:18:34');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (3, 93, 34, 'Quas deserunt rerum aspernatur delectus. Praesentium repellendus fugit repellat quis sunt et. Ratione cumque similique aut dolores. Qui at reprehenderit aut impedit debitis molestias.', 1, 0, '2013-01-31 01:15:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (4, 61, 42, 'Delectus magni sed accusamus perferendis quis. Voluptatum sed rem dolor possimus voluptatem nesciunt.', 0, 0, '2020-06-12 11:59:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (5, 31, 69, 'Voluptas commodi reprehenderit qui voluptatem. Illo dolorum quia officia et iste. Quia et accusamus nulla rerum qui. Sunt repudiandae aspernatur accusantium debitis quisquam consectetur repellendus. Est quae voluptatem ullam consequatur voluptatem voluptatem occaecati.', 1, 1, '2014-12-02 00:00:43');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (6, 79, 55, 'Ipsa rerum aut cupiditate. Velit repellat accusantium aut ea omnis incidunt quam. Fugiat placeat et sint.', 1, 0, '2011-12-29 04:17:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (7, 22, 93, 'Perspiciatis distinctio quo alias provident voluptas enim ipsam. Eum quisquam et numquam. Aut mollitia aut itaque eligendi assumenda dolores dolor quis.', 1, 0, '2015-04-24 13:10:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (8, 81, 53, 'Quis tenetur ut vel sint quidem. Soluta enim a voluptas recusandae sapiente. Ex rem laboriosam id aperiam saepe.', 0, 1, '2014-06-02 15:56:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (9, 36, 78, 'Quia quos necessitatibus sunt eius odio a quis autem. Vel sint esse ut. Culpa dignissimos ut qui in est. Sunt provident reiciendis maiores dolores perferendis. Minima perferendis sit provident asperiores minima delectus natus.', 1, 0, '2017-05-11 02:22:17');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (10, 98, 85, 'Temporibus id omnis rerum. Accusantium quisquam quia adipisci laborum ex perferendis ratione. Iure deserunt repellat in sed eos.', 0, 1, '2019-06-05 22:25:42');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (11, 93, 19, 'Mollitia consequatur a adipisci rerum debitis eos eos omnis. Voluptas adipisci occaecati aperiam necessitatibus qui. Maxime quia quaerat dicta rem.', 0, 1, '2017-05-11 20:01:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (12, 69, 73, 'Rerum at fugiat neque voluptas omnis aut et. Neque perspiciatis aut a et necessitatibus perspiciatis possimus sequi. Ullam sequi recusandae magnam ut quibusdam voluptatum explicabo.', 0, 1, '2020-04-05 22:04:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (13, 23, 75, 'A quaerat voluptatum ratione quis harum rerum optio. Tenetur aut voluptatum sit voluptas. Vitae quia iure nesciunt corporis deleniti.', 0, 1, '2015-05-09 11:48:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (14, 49, 79, 'Ut quasi et eos reprehenderit necessitatibus. Similique ipsam debitis omnis modi autem et dolores. Voluptas et laborum nihil occaecati voluptatem. Illo vitae molestiae error ducimus ducimus iure aliquam. Magni consequatur asperiores porro.', 1, 0, '2018-07-22 15:52:26');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (15, 23, 1, 'Exercitationem nesciunt consequatur sit et iure rerum quo. Labore animi nam qui. Qui omnis non voluptatem voluptates. Cupiditate omnis qui libero.', 0, 1, '2019-10-13 19:11:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (16, 32, 57, 'Occaecati eligendi fugit mollitia sit in qui. Soluta eligendi minima aliquid illum. Repellendus ipsa numquam ullam rem laudantium facere.', 1, 0, '2021-02-04 16:42:47');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (17, 88, 87, 'Pariatur dolores repellendus dolore pariatur ipsa maiores quasi. Necessitatibus aut error alias commodi quam reprehenderit soluta neque. Est eius accusamus exercitationem voluptas quisquam id cumque ad. Voluptatem numquam possimus voluptatem velit recusandae.', 0, 0, '2019-11-27 16:35:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (18, 54, 80, 'Fugiat cum facere aliquid temporibus. Voluptatem ut dolor et modi ex doloremque. Animi similique ea aut.', 0, 0, '2014-11-28 03:10:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (19, 21, 15, 'Necessitatibus sint ut corporis voluptas dolorem molestiae. Nihil rerum repudiandae et molestiae. Iure velit atque beatae modi vel deserunt ipsa voluptatem.', 0, 0, '2012-05-02 15:35:57');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (20, 21, 51, 'Odio et quasi eos aut sit officia. Hic qui aperiam id reprehenderit enim laborum provident perspiciatis. Modi ab aliquid qui vitae mollitia necessitatibus.', 0, 1, '2016-11-26 10:44:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (21, 84, 99, 'Veritatis earum totam autem facere atque. In aspernatur pariatur quasi incidunt accusamus reprehenderit. Quo quaerat consectetur et quia. Aut sit ut vero deleniti consectetur suscipit laborum.', 0, 0, '2016-01-06 12:39:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (22, 6, 5, 'Illo quas distinctio ut quas. Accusamus iusto nulla quam molestiae veritatis. Aut ut numquam cum eius aut autem eos voluptas.', 1, 0, '2014-02-24 02:16:04');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (23, 92, 86, 'Nulla aut voluptatibus est commodi. Qui architecto facere fugiat rerum. Ipsum placeat velit corrupti iure.', 0, 0, '2016-10-09 16:40:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (24, 58, 27, 'Adipisci expedita voluptas amet sed nihil. Aut ut voluptatem labore sunt inventore est. Sint quis quam ut quos in tempora. Mollitia repudiandae commodi hic amet facilis odit.', 1, 1, '2018-10-23 11:56:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (25, 63, 56, 'Voluptatem ipsum labore nobis. Similique corrupti suscipit consequuntur accusamus voluptatibus. Tempora quisquam tempore tempore.', 0, 0, '2020-02-25 04:25:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (26, 12, 56, 'Quae inventore in voluptas esse et rem odit blanditiis. Quae ex tenetur omnis libero maiores non qui error. Voluptatum consequatur ipsa et.', 1, 1, '2014-07-23 07:02:53');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (27, 74, 80, 'Ad neque voluptate autem non voluptas sunt. Asperiores voluptatem ducimus odit consequatur sequi dolor soluta. Rerum nulla impedit atque odit soluta. Sed aut ab harum possimus et animi deleniti.', 0, 1, '2017-07-05 20:11:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (28, 29, 97, 'Quia enim dolores quo autem voluptatum quisquam. Cum cum mollitia libero est qui animi. Deleniti nemo atque hic et odit molestiae quia. Commodi laborum dolor laudantium nemo consequatur consequatur.', 0, 0, '2016-03-23 11:40:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (29, 55, 78, 'Nam excepturi sit quia consequuntur quam facere neque et. Provident maxime et aspernatur omnis cumque et optio. Et laborum ut repellendus debitis ducimus voluptates incidunt sed.', 0, 0, '2012-04-02 16:58:34');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (30, 75, 78, 'Et quae est ut commodi. Placeat illum magni facere consequuntur veritatis hic et. Sed occaecati qui officiis velit rerum sint.', 1, 1, '2015-01-14 04:14:26');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (31, 78, 6, 'Voluptas adipisci ut amet. Excepturi aut cupiditate dolorem deleniti. Et hic quod omnis quidem.', 1, 0, '2017-06-07 20:47:04');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (32, 35, 66, 'Corporis quis est voluptatum qui. Et ut ea quis perspiciatis in. Voluptas aperiam placeat eius odit. Adipisci tempore aliquam quasi recusandae qui hic fugit.', 1, 1, '2020-02-19 21:14:36');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (33, 93, 88, 'Consectetur quis et consequatur ipsum aliquid. Et cumque inventore repellendus voluptatibus. Assumenda laborum sapiente labore repellat.', 1, 1, '2018-04-15 20:32:38');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (34, 45, 13, 'Nulla velit non tempora aliquid dolor deserunt et. Eos voluptatibus ea et maxime quas. Et eos occaecati alias aliquid laboriosam. Officiis dolores soluta dolorum in necessitatibus sapiente.', 0, 0, '2016-12-31 10:04:57');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (35, 3, 65, 'Architecto et nihil cupiditate quaerat ea unde rerum. Illum sed exercitationem vero autem. Dolorum perferendis fugit esse laudantium. Blanditiis sit voluptatem ratione deleniti est et dignissimos.', 0, 1, '2018-03-11 11:48:34');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (36, 64, 86, 'Quo nesciunt dignissimos modi et accusamus at molestiae. Labore alias quo voluptas placeat illum. Delectus at tempora minus. Quo sit qui omnis quos ullam.', 0, 1, '2015-01-15 21:39:06');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (37, 64, 70, 'Deleniti soluta dicta officia. Distinctio quis debitis tenetur placeat sit aut. Sed id assumenda ut. Ipsa nostrum ad illum iusto.', 0, 1, '2018-06-17 04:19:43');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (38, 91, 55, 'Modi sint harum labore eligendi nesciunt. Dolorem id explicabo possimus.', 1, 1, '2015-12-23 22:03:36');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (39, 55, 48, 'Perspiciatis placeat nihil sit laudantium tempore nam. Molestias vel accusantium debitis repudiandae nihil velit atque. Nulla vero consequatur sit cumque enim maiores sapiente.', 0, 0, '2018-04-16 00:20:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (40, 82, 18, 'Quaerat occaecati nihil ut. Vel ea unde laboriosam. Sint rerum fugiat dolorem nostrum.', 1, 0, '2020-03-16 14:00:38');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (41, 3, 93, 'Ut reiciendis qui non voluptates voluptatem in maxime non. Beatae perspiciatis id quo dignissimos commodi enim. Magni dicta voluptatem aliquam exercitationem consequatur officiis quas. Fugiat voluptate possimus dicta ut.', 1, 1, '2019-08-16 19:23:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (42, 74, 77, 'In eaque perferendis quia voluptas saepe maxime id nam. Est deleniti ipsum accusantium tenetur voluptas perspiciatis. Molestiae impedit ea quia a deleniti est.', 0, 0, '2020-01-01 14:32:57');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (43, 73, 3, 'Alias consectetur temporibus ipsam. Laborum labore cum voluptatem. Quam omnis cumque qui fuga placeat harum quia.', 0, 1, '2013-06-26 17:36:08');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (44, 73, 28, 'Veniam enim doloribus cumque laudantium eos fuga. Eum perferendis officia consequatur quia. Libero vel nisi debitis velit nesciunt in eos.', 0, 1, '2017-06-03 06:17:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (45, 80, 47, 'Praesentium illo amet sint quasi beatae et. Aperiam possimus cumque voluptates sit accusantium sit fugiat. Impedit voluptatem magnam deserunt saepe voluptatem. Maiores omnis aut animi occaecati a voluptatem.', 0, 1, '2016-01-29 05:46:27');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (46, 6, 58, 'Voluptates ducimus sed eaque nihil. Eum nostrum dolor ut dolorem nam aut. Nobis molestias deserunt praesentium.', 1, 1, '2016-11-26 21:26:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (47, 53, 40, 'Explicabo reiciendis quia dolor animi. Rerum asperiores ipsum sed corporis autem. Aut officiis molestias dolor nihil. Sint quia sed explicabo veritatis ut vitae aliquid. Eligendi rerum et consequatur.', 0, 0, '2015-01-29 04:48:41');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (48, 23, 46, 'Ipsum sed qui repellat maiores possimus totam. Corrupti itaque consequuntur harum dolor omnis est.', 0, 1, '2015-10-13 06:11:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (49, 28, 67, 'Et et adipisci inventore. Dolorum labore rerum non qui velit quia enim. Praesentium quibusdam distinctio magnam. Repellat rerum sit ipsam corrupti ut placeat consequuntur.', 1, 1, '2014-07-16 01:57:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (50, 59, 31, 'Cum illo expedita aut facere et vel quisquam. Ratione aliquid quos vero tenetur.', 1, 1, '2012-09-17 08:57:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (51, 32, 22, 'Et nihil in provident voluptatem vitae. Dolorum eum et debitis eveniet quibusdam. Quidem nam est impedit enim. Qui delectus quia est sit.', 0, 0, '2020-04-02 11:13:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (52, 16, 95, 'Perspiciatis quasi quia nulla tempora eum minus consectetur ut. Dolores excepturi fugit sed consequatur dolores ea qui quas. Quis occaecati ea quia dolore aut ut.', 1, 0, '2020-11-26 16:49:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (53, 91, 7, 'Praesentium saepe incidunt modi sunt fuga nulla. Numquam quas eius soluta perspiciatis in aut nam doloribus. Rerum et dolores ea minus.', 1, 0, '2018-12-03 03:00:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (54, 49, 46, 'Rerum sapiente consectetur id. Illo quo sunt eos doloremque aut. Dolorum aut dolor commodi delectus ut. Ut consequatur quibusdam doloribus dolorem fugiat dolores et.', 1, 0, '2016-11-20 10:25:53');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (55, 54, 30, 'Harum aliquam quo quos et. Ipsam accusamus eos et asperiores sint animi et quisquam. Nam illum et vel porro quasi.', 0, 0, '2011-11-19 07:52:49');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (56, 64, 56, 'Et optio et soluta error. Occaecati quisquam et quis et. Perspiciatis ut minima ab ut doloremque qui ut. Unde totam sed consequatur ea.', 0, 0, '2012-08-06 12:08:10');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (57, 23, 38, 'Omnis minus neque eius. Alias rerum quos nulla reprehenderit consequatur aut voluptates dolores. Tempora molestias quia sit.', 1, 0, '2015-11-26 18:46:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (58, 32, 96, 'Tenetur at deleniti placeat consequatur porro unde adipisci. Officia et neque sit eos minima.', 1, 0, '2011-09-13 23:42:36');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (59, 40, 5, 'Autem beatae soluta inventore dolore dolorum impedit. Ipsa exercitationem alias vitae quae quisquam autem sit. Praesentium molestias alias ad.', 1, 1, '2018-01-19 01:12:04');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (60, 24, 20, 'Vel inventore cupiditate et et et. Exercitationem rerum pariatur quas ut dolor minus.', 0, 0, '2017-02-02 07:17:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (61, 51, 29, 'Nam aut quidem neque. Magni sequi fugit temporibus soluta quidem. Eum suscipit qui minus architecto minus ex. Vel ad aperiam sit repellat ipsam aliquam.', 0, 1, '2011-09-07 00:49:16');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (62, 77, 4, 'Dolores perspiciatis culpa necessitatibus cumque. Dolorum odio odit laboriosam molestias cumque architecto modi. Consectetur voluptate asperiores animi non commodi.', 1, 1, '2016-04-26 14:52:55');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (63, 69, 100, 'Facere culpa neque nulla voluptas. Autem non et delectus exercitationem hic deserunt. Facere sit in quos quia necessitatibus.', 0, 1, '2012-01-18 09:01:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (64, 49, 96, 'Dolore eligendi atque voluptas voluptas inventore eligendi animi suscipit. Suscipit nihil quo voluptas et. At exercitationem sed aut. Perferendis sint neque eligendi perferendis.', 0, 0, '2019-07-13 18:21:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (65, 66, 7, 'Reiciendis est aut aliquid ratione facere voluptatem consequatur. Praesentium repellendus corrupti consequatur dignissimos cumque. Maiores tenetur recusandae sit quibusdam molestias ipsum.', 1, 1, '2013-02-21 15:32:08');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (66, 26, 98, 'Omnis perspiciatis distinctio dignissimos dolore non fugit. Quisquam quo iusto exercitationem quis tempora. Totam sit magni odit doloremque. Exercitationem accusantium totam cum ipsum mollitia vitae odit. Id minima quia pariatur saepe aut.', 0, 1, '2012-02-11 12:49:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (67, 29, 42, 'Exercitationem minima suscipit est iure voluptatem sed vitae. Aut at facilis quia quisquam ducimus temporibus veritatis. Eum aliquam asperiores consequatur doloremque ullam ipsum voluptates.', 1, 1, '2012-02-10 04:55:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (68, 92, 20, 'Quae voluptas architecto et eum ipsam. Omnis molestiae et velit et sed. Qui esse sed iusto iusto. Quis deleniti velit fugiat omnis eaque dolor ut.', 0, 1, '2013-12-02 07:13:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (69, 48, 41, 'Autem id numquam qui nam asperiores. Corporis dolorum ut distinctio est illum. Est ad et quas mollitia.', 0, 0, '2017-09-29 16:38:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (70, 66, 1, 'Ut beatae suscipit rerum illum perspiciatis eius. Adipisci ipsa eos quia porro reiciendis non assumenda. Officia cum magnam eaque ab blanditiis tenetur et.', 1, 0, '2015-10-19 18:56:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (71, 71, 29, 'Provident deleniti maiores velit non quasi suscipit. Tenetur nesciunt explicabo cum velit placeat quis dolorem. Et repellat dolores voluptatem hic fugiat sunt.', 0, 0, '2015-07-01 07:33:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (72, 57, 94, 'Ducimus consectetur est sed aliquid consequuntur. Quo laboriosam aspernatur rerum labore est. Consequatur voluptatem cupiditate aspernatur nihil veniam quas sit.', 0, 1, '2013-07-05 00:03:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (73, 67, 89, 'Facere omnis sit officia impedit occaecati consequuntur omnis. Odit consequatur aperiam sapiente qui nisi voluptatem ut. Placeat velit impedit maxime dolor nihil vero amet.', 1, 1, '2013-04-10 18:56:37');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (74, 89, 6, 'Rem error repellendus consequatur ut. Accusantium velit occaecati aut facere. Omnis distinctio est sint accusantium magni reprehenderit. Qui quasi cupiditate deleniti consequatur odio.', 1, 1, '2020-04-02 14:43:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (75, 93, 12, 'Sed enim quo at voluptatem libero velit doloremque omnis. Voluptatem necessitatibus autem commodi dolore. Rem est cum porro et voluptas illum a. Nihil dolore a molestiae.', 1, 1, '2015-05-13 04:04:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (76, 25, 44, 'Alias fugiat ea est vero. Et sint quasi facilis mollitia porro dolorem eius. Aliquid iste repellat quae consequuntur quam asperiores.', 0, 1, '2015-03-22 18:45:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (77, 41, 2, 'Eaque impedit nobis illum veritatis. Qui at aut iste quo rerum quo tenetur. Sunt quia ea quia molestias. Et labore quod quis impedit.', 0, 1, '2013-11-29 11:23:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (78, 47, 9, 'Nemo enim autem soluta sequi. Sequi adipisci quo suscipit nemo. Expedita doloremque illo illum recusandae quam unde. Perspiciatis iure praesentium autem veritatis debitis odit.', 0, 0, '2014-03-16 23:12:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (79, 1, 96, 'Ipsum sed sunt quam est unde. Minus atque quia autem ut sequi sunt tempore assumenda. Iusto molestiae qui sit deserunt architecto.', 1, 1, '2015-09-01 04:49:17');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (80, 5, 67, 'Illo ab quod veritatis quos sequi. Et autem et perferendis sed modi quidem asperiores. Magnam magni laboriosam quis soluta vel iure id. Quis quidem a mollitia blanditiis ea.', 0, 1, '2011-06-10 05:15:57');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (81, 3, 30, 'Autem mollitia aut voluptatibus corporis consequatur sit sit. Aliquid ducimus minima rerum sint doloribus quasi. Nisi voluptatem eligendi consectetur sed fugiat laudantium laborum. Voluptatem dolorum sed qui consequatur qui ipsa iusto.', 0, 0, '2015-09-25 11:31:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (82, 64, 31, 'Nemo ea repudiandae error molestiae porro rerum rerum. Tenetur optio quaerat quia repellat possimus occaecati. Distinctio iusto illo aut perferendis nihil mollitia et. Ut dignissimos nihil est sed quia error officia incidunt.', 0, 1, '2018-06-14 15:32:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (83, 72, 56, 'Alias odit omnis officia ratione nihil aut. Recusandae qui omnis labore officia molestiae. Sit quos aut aut.', 0, 0, '2017-06-21 03:11:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (84, 51, 20, 'Illo dolores voluptate praesentium illum similique incidunt eum. Numquam qui aliquid culpa sunt exercitationem et tenetur. Doloribus sint et nisi enim est quis quia consequatur. Recusandae voluptas quibusdam id ut ex eos.', 0, 0, '2014-09-06 02:18:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (85, 96, 16, 'Quod sunt similique dicta blanditiis adipisci eveniet quia. Veritatis dolorem sit et perferendis officia molestiae porro. Qui totam sit et non cumque.', 1, 0, '2019-04-10 16:02:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (86, 21, 67, 'Ad earum in et fugit voluptatem quisquam. Totam sunt nemo esse dolore culpa. Explicabo quae sunt praesentium repudiandae omnis.', 1, 1, '2017-08-16 12:04:17');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (87, 45, 77, 'Sequi sunt ducimus cupiditate dolores accusantium qui. Molestiae ut quos assumenda facilis distinctio a tempora. Tenetur deserunt temporibus sint harum autem omnis qui.', 1, 1, '2017-02-15 04:20:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (88, 60, 11, 'Ipsam nobis sit incidunt. Laborum voluptatibus omnis velit et. Dicta ipsa necessitatibus iste aperiam quibusdam ipsam. Odit laudantium odit voluptatem.', 1, 0, '2019-05-16 14:34:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (89, 65, 48, 'Sint et dolorum officiis. Facilis voluptatem error illo. Vitae quae omnis qui nihil et molestiae. Ea ipsa sunt nam.', 0, 1, '2015-04-09 09:16:53');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (90, 17, 58, 'Odit doloremque nobis sit alias et amet. Voluptates et et pariatur porro omnis quis officiis cupiditate. Qui molestias debitis maiores aliquam. Quis placeat consectetur in omnis delectus sit.', 0, 0, '2015-03-13 19:30:41');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (91, 60, 42, 'Non blanditiis voluptatem quidem praesentium. Et qui consequatur reprehenderit nostrum amet tempora alias. Occaecati aut numquam aut aspernatur similique ut. Dolores quia illum ex corrupti. Iste libero omnis non voluptas suscipit molestias dolores aut.', 0, 0, '2021-01-21 23:23:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (92, 1, 1, 'Sint vitae dolor velit provident iusto dicta. Reiciendis sit libero iusto dolorum nostrum qui illum eligendi. Vel nihil voluptatem similique reprehenderit harum ab assumenda hic. Qui quia amet doloremque ratione.', 1, 1, '2015-08-07 19:52:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (93, 44, 48, 'Rerum est repudiandae ut dignissimos asperiores qui. Qui veritatis harum omnis consequatur natus quae quos. Et laborum aliquam dolor dolor qui non veritatis. Dolor et similique aut aliquam minima.', 0, 0, '2016-07-17 09:45:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (94, 9, 44, 'Ratione consequatur voluptas incidunt deleniti iure consequuntur ipsum. Ducimus et quia qui inventore quis. Consequatur voluptas repellendus dignissimos nam incidunt dicta perspiciatis.', 1, 0, '2016-06-21 16:02:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (95, 43, 14, 'Dolor nemo consequatur neque veniam. Ipsa porro exercitationem adipisci voluptatem mollitia est repudiandae.', 0, 1, '2011-09-19 02:24:39');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (96, 11, 45, 'Sint rem quis tenetur perspiciatis dicta voluptatum odit possimus. Animi ea non molestias similique modi. Sint in eius dicta neque rerum. Quis autem dolor et porro. Rerum sint eum et aliquid nisi est.', 1, 0, '2016-10-16 11:38:34');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (97, 44, 75, 'Voluptatibus eligendi culpa sit at non consequatur eum esse. Nam eaque adipisci voluptatem maxime et cupiditate. Quis a aut repellat. Perspiciatis dolor et quisquam earum explicabo.', 0, 0, '2012-02-18 23:37:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (98, 76, 15, 'Qui soluta vero architecto porro iure esse. Sint ullam ducimus minus eum omnis. Ad doloremque aperiam ullam aperiam dolores facere ut. Impedit asperiores culpa sit consequuntur.', 0, 0, '2013-02-20 20:43:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (99, 30, 26, 'Ab officiis amet quia enim modi. Ut autem a vel delectus provident ab et. Perferendis occaecati possimus sunt quae quia. Rerum vitae aliquid in tempora.', 0, 1, '2012-04-20 22:17:08');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `create_at`) VALUES (100, 34, 26, 'Nam odio occaecati eius rerum sint sint. Soluta ad soluta exercitationem tenetur. Eos dignissimos dolor mollitia velit.', 1, 0, '2011-08-16 17:46:51');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gender` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `city` varchar(130) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Город проживания',
  `country` varchar(130) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Страна проживания',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Профили';

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (1, 'f', '1978-05-06', 'Kertzmannborough', 'Brazil', '2013-03-05 16:44:07', '2021-02-10 07:55:19');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (2, 'm', '2015-10-22', 'New Jordifort', 'Montenegro', '2013-07-18 19:16:14', '2019-05-18 06:20:31');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (3, 'm', '1992-06-12', 'Angelobury', 'Saint Vincent and the Grenadines', '2021-02-05 01:09:52', '2015-06-08 08:00:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (4, 'm', '2018-02-23', 'South Leonel', 'Saint Helena', '2013-12-11 11:14:29', '2017-06-13 02:29:27');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (5, 'f', '2002-01-30', 'New Ivyshire', 'Montserrat', '2019-09-13 05:38:28', '2020-06-04 06:11:16');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (6, 'f', '1979-07-22', 'Delbertfurt', 'Benin', '2021-04-19 13:46:46', '2018-01-31 07:54:28');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (7, 'm', '1996-12-01', 'Alexanderstad', 'Faroe Islands', '2017-11-22 15:59:27', '2019-07-14 21:18:37');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (8, 'f', '1970-01-24', 'Emilianoshire', 'Greenland', '2019-04-12 19:34:01', '2020-10-08 23:40:54');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (9, 'f', '1973-12-15', 'South Vernville', 'Suriname', '2019-03-28 22:05:57', '2017-12-27 14:30:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (10, 'm', '2007-09-04', 'Valentinemouth', 'Belize', '2011-06-20 08:36:04', '2011-10-25 12:17:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (11, 'm', '1988-04-11', 'Sanfordberg', 'Germany', '2018-12-19 17:09:56', '2015-05-23 22:39:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (12, 'f', '1991-02-24', 'South Melyssaland', 'Guinea', '2011-12-07 03:08:02', '2012-04-16 04:47:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (13, 'f', '2006-10-30', 'Brendenside', 'Saint Helena', '2019-03-16 22:29:54', '2011-07-31 21:33:51');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (14, 'f', '1970-08-18', 'East Monserratehaven', 'Gibraltar', '2018-12-09 22:31:06', '2019-05-16 11:52:28');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (15, 'f', '2011-12-11', 'Jerroldhaven', 'Guam', '2013-05-01 10:56:28', '2019-12-03 04:39:56');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (16, 'f', '1996-03-18', 'North Kipborough', 'Tuvalu', '2016-10-06 19:44:35', '2017-02-19 19:31:43');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (17, 'f', '2008-03-04', 'West Addie', 'Saint Barthelemy', '2016-01-23 12:49:14', '2020-05-30 01:43:51');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (18, 'm', '1984-01-25', 'Demariochester', 'Israel', '2018-12-13 14:23:27', '2018-10-18 09:04:36');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (19, 'm', '2019-08-09', 'South Dolly', 'Estonia', '2020-12-18 05:34:33', '2020-01-14 18:09:14');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (20, 'm', '2004-12-22', 'Nellahaven', 'Faroe Islands', '2018-02-14 20:25:30', '2012-04-25 11:12:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (21, 'f', '1984-04-13', 'Elwynview', 'Saint Kitts and Nevis', '2020-01-20 13:11:51', '2021-04-12 01:07:35');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (22, 'm', '2005-01-15', 'West Clinton', 'Australia', '2019-02-02 08:18:04', '2020-09-30 23:22:33');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (23, 'm', '2011-02-08', 'South Hayley', 'Faroe Islands', '2017-09-16 16:41:30', '2012-03-31 00:16:05');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (24, 'm', '2018-11-17', 'Mathiasborough', 'Cyprus', '2011-05-12 17:07:28', '2015-02-07 20:02:32');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (25, 'm', '1972-04-21', 'North Stephania', 'French Southern Territories', '2016-11-12 23:27:21', '2017-11-21 11:01:08');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (26, 'f', '1984-09-22', 'Vanessaton', 'Ireland', '2014-01-14 07:46:26', '2020-09-29 07:01:50');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (27, 'f', '2007-10-15', 'East Deloreschester', 'British Indian Ocean Territory (Chagos Archipelago)', '2017-01-17 10:45:50', '2020-09-30 03:51:06');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (28, 'f', '1985-11-14', 'West Lillymouth', 'United States of America', '2017-03-15 19:02:50', '2020-01-20 00:54:55');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (29, 'm', '2014-04-29', 'Port Karolann', 'American Samoa', '2015-12-11 03:58:07', '2016-04-05 08:47:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (30, 'f', '1975-03-13', 'Ferrytown', 'Algeria', '2019-10-11 20:13:24', '2019-06-23 06:50:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (31, 'f', '2004-02-01', 'Bartonfort', 'Kazakhstan', '2015-03-16 11:36:19', '2011-07-14 06:55:04');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (32, 'm', '1970-07-30', 'South Gudrunton', 'Switzerland', '2016-10-11 15:49:15', '2019-09-26 05:31:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (33, 'm', '1993-10-28', 'East Arielhaven', 'Myanmar', '2011-07-07 11:07:49', '2013-06-21 07:56:20');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (34, 'f', '1971-02-06', 'Adeliaport', 'Kiribati', '2018-03-16 19:18:51', '2021-04-13 01:16:49');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (35, 'f', '1990-06-24', 'Bodeville', 'United Arab Emirates', '2013-06-18 19:11:59', '2013-01-20 22:54:32');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (36, 'm', '2016-07-05', 'Port Rod', 'Spain', '2019-03-30 23:54:06', '2014-08-16 10:31:27');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (37, 'm', '1973-05-18', 'South Astrid', 'Lao People\'s Democratic Republic', '2012-01-01 09:09:38', '2013-08-02 07:11:04');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (38, 'f', '2010-06-22', 'Karlishire', 'Malaysia', '2011-10-15 23:00:49', '2015-07-24 01:35:06');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (39, 'f', '2012-03-24', 'South Sadie', 'Rwanda', '2011-12-13 14:24:37', '2021-01-01 05:06:10');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (40, 'm', '2000-08-07', 'West Carlotta', 'Netherlands Antilles', '2016-11-16 11:55:07', '2018-11-29 02:50:05');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (41, 'm', '2018-04-12', 'Terrymouth', 'Norfolk Island', '2012-02-23 10:24:34', '2018-11-13 03:27:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (42, 'm', '1974-10-18', 'West Fausto', 'Bolivia', '2020-06-02 04:03:38', '2017-02-23 00:13:02');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (43, 'm', '1988-08-10', 'Port Francisshire', 'Heard Island and McDonald Islands', '2013-07-01 05:50:13', '2014-08-25 18:16:45');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (44, 'm', '1977-12-18', 'Lake Nestortown', 'South Georgia and the South Sandwich Islands', '2012-07-25 16:03:02', '2016-04-19 08:00:21');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (45, 'm', '1994-07-24', 'Port Pat', 'Ethiopia', '2014-11-23 02:57:09', '2021-01-11 21:44:29');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (46, 'f', '2008-08-27', 'Derrickborough', 'Bahrain', '2013-02-14 03:11:51', '2019-12-28 17:52:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (47, 'f', '1988-09-16', 'South Alyshamouth', 'Austria', '2012-05-31 06:12:17', '2018-12-23 16:07:55');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (48, 'm', '1982-09-06', 'Weimannview', 'Burundi', '2017-01-13 02:02:02', '2013-03-31 18:43:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (49, 'f', '1972-06-13', 'Mortonhaven', 'Argentina', '2017-12-06 16:31:52', '2019-07-27 05:47:31');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (50, 'f', '2005-08-17', 'Kemmertown', 'New Zealand', '2020-07-23 07:14:53', '2017-05-01 06:48:56');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (51, 'm', '1990-05-06', 'Millsstad', 'Samoa', '2019-08-14 07:52:23', '2020-05-25 11:42:58');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (52, 'f', '2008-02-12', 'Port Alessia', 'Peru', '2015-05-17 21:28:38', '2013-03-03 16:15:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (53, 'f', '1971-08-24', 'New Thalia', 'Bermuda', '2012-01-06 03:01:31', '2012-06-27 09:22:36');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (54, 'f', '1991-04-18', 'Katrinashire', 'Myanmar', '2015-08-19 14:03:49', '2021-03-04 17:17:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (55, 'm', '1993-03-31', 'East Eino', 'Bolivia', '2013-08-06 01:50:36', '2017-03-09 22:58:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (56, 'm', '2008-12-21', 'West Margretstad', 'Kazakhstan', '2017-05-09 18:03:31', '2016-07-09 04:14:45');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (57, 'f', '1992-12-22', 'South Keatonstad', 'Guernsey', '2012-06-27 00:26:49', '2020-10-17 15:51:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (58, 'm', '2006-11-05', 'Lake Holliefurt', 'Christmas Island', '2011-12-20 08:31:30', '2014-03-16 14:49:57');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (59, 'f', '1978-07-01', 'Brennonville', 'France', '2018-10-28 16:59:15', '2014-09-14 11:55:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (60, 'f', '1979-01-14', 'Quitzonhaven', 'Nicaragua', '2013-05-01 11:31:51', '2018-07-18 19:20:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (61, 'm', '2016-10-19', 'South Eldora', 'Turkey', '2020-07-10 12:59:55', '2017-05-13 02:05:33');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (62, 'm', '1993-09-14', 'Lake Alden', 'Argentina', '2014-03-16 23:36:31', '2012-09-27 15:54:23');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (63, 'm', '1971-02-06', 'West Damianland', 'Canada', '2018-05-29 15:23:09', '2014-11-16 23:51:07');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (64, 'f', '2018-03-10', 'North Henriette', 'United States Minor Outlying Islands', '2020-06-27 11:29:38', '2014-12-16 14:55:49');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (65, 'f', '1991-05-24', 'Westtown', 'Antigua and Barbuda', '2011-06-17 21:10:20', '2017-08-22 00:03:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (66, 'f', '2012-09-20', 'East Rickieland', 'Ireland', '2011-11-22 17:17:34', '2014-04-20 09:13:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (67, 'm', '1980-07-16', 'Karelleville', 'Armenia', '2014-12-21 21:00:03', '2011-05-20 22:01:35');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (68, 'm', '1980-06-19', 'East Layneberg', 'Saint Kitts and Nevis', '2017-12-15 06:46:31', '2020-02-29 15:14:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (69, 'm', '1979-11-26', 'Jastside', 'Sao Tome and Principe', '2015-08-29 16:46:38', '2018-07-08 10:20:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (70, 'f', '1971-10-16', 'West Lesterside', 'Oman', '2017-02-26 05:11:23', '2014-06-17 15:18:06');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (71, 'm', '2015-03-31', 'North Hendersonfort', 'Kiribati', '2019-08-27 17:38:54', '2017-08-02 15:14:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (72, 'm', '2004-08-25', 'Lake Mohamedview', 'Brazil', '2019-02-02 03:34:50', '2019-04-04 16:36:19');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (73, 'm', '2011-03-10', 'Effertzfurt', 'Indonesia', '2018-11-06 01:57:08', '2020-06-27 12:36:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (74, 'f', '1999-04-07', 'West Donaldchester', 'Northern Mariana Islands', '2012-01-26 11:03:22', '2018-03-17 20:21:31');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (75, 'm', '1990-09-26', 'West Haroldmouth', 'Vietnam', '2015-06-23 06:59:05', '2016-10-16 13:23:37');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (76, 'f', '2017-09-19', 'Elenorafurt', 'British Indian Ocean Territory (Chagos Archipelago)', '2014-10-28 11:19:58', '2016-12-25 21:57:33');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (77, 'f', '1992-12-05', 'North Raphaelshire', 'San Marino', '2017-01-07 11:21:12', '2016-10-10 19:21:54');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (78, 'f', '1991-03-01', 'Yundttown', 'Holy See (Vatican City State)', '2011-07-18 01:20:15', '2015-02-13 19:37:34');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (79, 'f', '2008-06-01', 'East Rocioborough', 'Ukraine', '2017-06-19 07:41:24', '2011-09-13 19:51:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (80, 'f', '2013-12-16', 'Ryleyberg', 'Palau', '2017-11-02 04:04:56', '2017-06-26 13:49:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (81, 'm', '2001-05-06', 'East Quincy', 'Norfolk Island', '2020-02-11 10:53:07', '2011-10-05 03:57:33');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (82, 'm', '2004-03-14', 'Martabury', 'Saint Vincent and the Grenadines', '2014-11-25 11:56:56', '2013-04-11 04:55:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (83, 'f', '1970-09-16', 'South Wilburn', 'Saint Barthelemy', '2012-10-31 04:28:59', '2015-09-30 01:54:18');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (84, 'm', '1987-02-04', 'South Gust', 'Northern Mariana Islands', '2019-12-01 18:49:59', '2015-02-21 18:05:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (85, 'f', '1972-09-06', 'South Carmelo', 'France', '2016-01-14 04:46:44', '2016-07-06 23:03:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (86, 'f', '1970-11-05', 'Lake Jennie', 'Slovenia', '2014-05-16 05:45:18', '2014-08-27 21:41:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (87, 'm', '2008-11-10', 'Wildermanborough', 'Tokelau', '2018-10-17 20:57:28', '2017-05-25 00:15:53');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (88, 'f', '2013-11-18', 'Elinorport', 'China', '2014-11-24 12:23:28', '2018-01-18 08:06:32');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (89, 'f', '1993-09-28', 'Tatummouth', 'Haiti', '2016-03-27 00:24:16', '2014-04-19 18:24:29');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (90, 'm', '1996-09-18', 'Kennedyview', 'Marshall Islands', '2012-05-13 21:20:38', '2013-03-28 19:30:49');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (91, 'f', '2001-02-18', 'Hankfurt', 'Tunisia', '2014-06-08 05:20:25', '2014-03-28 01:53:01');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (92, 'f', '1989-12-15', 'Georgettefort', 'China', '2019-04-16 10:24:08', '2014-03-28 04:59:51');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (93, 'f', '1975-01-22', 'Port Jess', 'Thailand', '2020-09-25 12:00:33', '2014-10-14 23:04:56');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (94, 'm', '2011-05-14', 'Port Maiabury', 'Mauritania', '2019-05-20 06:59:12', '2013-07-14 13:58:20');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (95, 'f', '1981-10-01', 'South Brandi', 'Brunei Darussalam', '2019-03-04 00:06:50', '2017-11-30 05:00:36');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (96, 'm', '1992-08-16', 'Allanberg', 'Netherlands', '2014-10-13 09:35:12', '2018-11-27 13:59:25');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (97, 'f', '2011-08-26', 'Lake Quincy', 'Brunei Darussalam', '2015-01-25 23:22:35', '2014-04-26 18:45:34');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (98, 'f', '2015-12-25', 'West Arelystad', 'Myanmar', '2013-06-22 17:55:35', '2017-01-10 05:38:31');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (99, 'f', '1989-12-26', 'Klingfort', 'Netherlands', '2017-12-07 09:22:33', '2021-02-27 16:22:53');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `update_at`) VALUES (100, 'f', '2011-01-14', 'South Lucindaland', 'Micronesia', '2013-11-29 04:07:43', '2012-04-04 21:56:14');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `update_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пользователи';

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (1, 'Jamey', 'Armstrong', 'dave.watsica@example.org', '(674)974-0031', '2014-11-14 01:14:58', '2012-09-15 07:36:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (2, 'Lisa', 'Flatley', 'zane61@example.com', '1-201-289-9910x51776', '2020-06-20 16:29:36', '2012-05-05 13:32:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (3, 'Ray', 'Nikolaus', 'mike.braun@example.com', '613.793.9580x94663', '2019-07-19 23:47:10', '2012-03-15 13:52:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (4, 'Casimir', 'Denesik', 'abernathy.morton@example.net', '293-439-3107', '2019-03-10 13:46:14', '2015-09-20 11:39:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (5, 'Kelsi', 'Padberg', 'jacey29@example.com', '+71(8)2861859913', '2020-02-01 22:42:58', '2021-02-17 04:33:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (6, 'Cleve', 'Becker', 'achamplin@example.org', '230.114.0602', '2019-07-07 21:14:54', '2015-04-30 04:50:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (7, 'Aniya', 'Bode', 'jacobson.anissa@example.com', '953.364.9203x911', '2021-02-26 17:13:39', '2019-03-29 15:34:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (8, 'Devan', 'Pollich', 'susana.nitzsche@example.com', '07309675198', '2012-03-09 03:57:44', '2014-05-11 13:12:58');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (9, 'Christy', 'Berge', 'allene59@example.org', '528-873-2325', '2020-01-24 00:24:48', '2021-03-24 11:18:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (10, 'Carmela', 'Treutel', 'lazaro.west@example.net', '06322119370', '2015-08-29 14:37:26', '2019-03-16 15:44:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (11, 'Rosetta', 'Nikolaus', 'pbailey@example.com', '(826)973-5629x2122', '2018-10-10 20:02:40', '2018-10-20 20:44:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (12, 'Vilma', 'Witting', 'reanna46@example.com', '+47(6)0565429068', '2018-12-12 00:12:14', '2014-02-19 02:57:46');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (13, 'Antonio', 'Cassin', 'rgaylord@example.org', '07772947359', '2015-03-19 18:54:52', '2018-07-16 15:51:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (14, 'Louvenia', 'O\'Reilly', 'barton.axel@example.com', '+26(8)7687001415', '2016-12-12 04:53:10', '2019-06-29 21:03:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (15, 'Gunnar', 'Hudson', 'verona.jacobs@example.com', '898.853.7330x05448', '2018-06-09 17:06:54', '2011-06-01 16:26:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (16, 'Rachel', 'Koelpin', 'kmarvin@example.com', '792.445.3543x198', '2020-07-18 07:14:23', '2011-08-22 23:15:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (17, 'Ernesto', 'Hane', 'mwalker@example.net', '177.006.0854x33349', '2013-12-09 13:47:56', '2020-04-25 21:15:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (18, 'Jammie', 'Barton', 'llueilwitz@example.net', '269.384.3470', '2012-01-19 09:26:24', '2012-01-09 06:21:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (19, 'Savannah', 'Heathcote', 'riley90@example.org', '1-378-937-4885', '2019-11-18 17:00:55', '2013-07-07 07:49:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (20, 'Junior', 'Bednar', 'helmer.rowe@example.net', '641.858.6071x533', '2011-07-13 09:39:15', '2011-09-03 02:45:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (21, 'Genoveva', 'Labadie', 'precious01@example.net', '(541)319-4253', '2014-11-04 16:39:29', '2015-10-08 19:59:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (22, 'Alvah', 'Gutkowski', 'qbarrows@example.org', '366-621-8542', '2016-02-22 04:56:08', '2014-08-06 02:09:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (23, 'Laurine', 'Quitzon', 'bria.cole@example.com', '727-157-5477', '2016-03-19 07:00:14', '2012-10-27 04:13:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (24, 'Benny', 'Goldner', 'ebuckridge@example.com', '039.550.1615x88837', '2016-07-22 05:08:16', '2012-12-22 08:53:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (25, 'Hope', 'Konopelski', 'keshaun.stanton@example.org', '746-008-3808', '2016-04-11 17:38:32', '2019-01-30 11:57:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (26, 'Woodrow', 'Bernier', 'chelsie34@example.com', '937-125-1588x83105', '2012-10-13 20:29:57', '2021-03-31 16:32:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (27, 'Javier', 'Sawayn', 'lesch.walton@example.net', '579.440.5087x61162', '2014-12-22 15:51:38', '2017-12-23 17:55:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (28, 'Enrico', 'Oberbrunner', 'wendy.bechtelar@example.net', '498.488.7896', '2014-12-24 16:41:59', '2017-05-26 10:10:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (29, 'Natalie', 'Ward', 'zhegmann@example.org', '(375)791-8616x37796', '2017-12-22 03:34:29', '2017-10-25 03:41:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (30, 'Maximillia', 'Parker', 'joel.bernhard@example.org', '419.051.6016x98520', '2011-06-10 20:38:06', '2020-11-01 01:59:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (31, 'Marilie', 'Mitchell', 'zmohr@example.net', '1-862-705-7238', '2019-05-16 10:41:33', '2011-08-12 03:23:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (32, 'Alessandro', 'Strosin', 'claire26@example.com', '1-046-289-6575', '2014-01-14 22:20:04', '2018-02-24 12:11:37');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (33, 'Wava', 'Olson', 'gene.sauer@example.com', '828.757.3493x49029', '2018-04-22 04:07:51', '2013-11-30 00:18:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (34, 'Marisa', 'Kirlin', 'sage.hermiston@example.org', '512.085.7556', '2018-11-10 04:52:08', '2015-12-17 19:38:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (35, 'Demarcus', 'Pacocha', 'brayan.marvin@example.com', '392.696.8566', '2013-02-08 11:00:36', '2020-02-10 11:02:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (36, 'Deondre', 'Schiller', 'macejkovic.julien@example.org', '(392)621-0173', '2020-12-02 03:41:54', '2012-06-29 05:18:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (37, 'Brown', 'Schaefer', 'nat00@example.com', '1-112-241-3289', '2013-06-21 03:00:52', '2020-01-21 22:12:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (38, 'Jeremy', 'Turcotte', 'abraham07@example.org', '713.161.8622x488', '2012-06-20 09:31:25', '2013-09-12 13:20:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (39, 'Joshuah', 'Bednar', 'zelma.treutel@example.com', '+10(2)0001520431', '2011-06-06 08:32:32', '2011-09-21 03:32:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (40, 'Lesly', 'Leuschke', 'lonzo39@example.net', '(960)725-4587', '2021-04-13 10:57:51', '2019-07-09 04:25:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (41, 'Marilou', 'Graham', 'ryan.amari@example.org', '09811331980', '2013-09-18 21:55:34', '2016-02-29 13:56:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (42, 'Rollin', 'Schuppe', 'bessie77@example.net', '1-240-046-3535', '2013-06-06 04:01:46', '2017-09-07 19:02:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (43, 'Reina', 'DuBuque', 'nullrich@example.net', '04718840974', '2018-09-27 16:27:29', '2016-12-11 11:28:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (44, 'Mittie', 'Lesch', 'renee66@example.net', '522-648-1824', '2012-06-16 21:08:20', '2020-12-26 01:42:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (45, 'Lillie', 'Kunde', 'reynolds.seth@example.org', '08636615644', '2011-08-06 06:42:04', '2017-10-23 12:30:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (46, 'Eliseo', 'Schamberger', 'augustus33@example.com', '815-216-3045', '2017-07-22 05:25:12', '2015-07-18 11:05:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (47, 'Stefan', 'Gorczany', 'weston.crist@example.net', '+91(2)5777885522', '2019-09-18 07:58:45', '2012-05-26 09:58:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (48, 'Preston', 'Gleichner', 'marcos03@example.com', '381-160-7388', '2018-05-17 03:29:11', '2015-08-20 07:38:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (49, 'Clara', 'Runolfsdottir', 'lang.katharina@example.com', '09758518286', '2013-12-04 07:30:03', '2021-03-12 06:03:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (50, 'Rollin', 'Schmeler', 'jovanny.kuhn@example.org', '184.506.3050x6904', '2018-07-27 05:08:52', '2017-02-08 21:51:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (51, 'Cristian', 'Kreiger', 'christelle.dach@example.net', '403-262-0211x630', '2012-04-27 05:54:26', '2012-02-04 08:42:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (52, 'Clotilde', 'Zieme', 'zjacobs@example.net', '(081)383-5768x2301', '2011-06-11 11:02:44', '2019-04-04 12:32:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (53, 'Matt', 'Greenfelder', 'sanford.bradly@example.com', '435-777-1053', '2016-01-08 07:43:06', '2020-06-16 21:45:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (54, 'Kassandra', 'Hahn', 'eva75@example.com', '882-469-1586x2616', '2014-11-12 13:09:59', '2011-07-15 18:35:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (55, 'Aida', 'O\'Conner', 'hjerde@example.org', '01367751063', '2019-01-08 00:34:19', '2013-04-15 18:15:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (56, 'Alejandrin', 'Wisozk', 'srenner@example.org', '583-608-2966x09010', '2014-04-24 03:54:49', '2012-05-31 20:02:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (57, 'Demond', 'Langworth', 'marco72@example.org', '203-208-3598x1328', '2017-06-23 18:52:10', '2016-11-15 04:03:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (58, 'Leo', 'Bruen', 'eulah08@example.org', '452.088.8337', '2019-04-17 11:15:19', '2015-08-01 04:59:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (59, 'Lyla', 'Lockman', 'akuphal@example.net', '1-929-794-3337x6554', '2012-09-02 22:45:17', '2016-09-19 02:33:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (60, 'Randi', 'Ziemann', 'bsteuber@example.com', '1-426-042-4926', '2021-04-02 17:23:57', '2014-10-25 11:18:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (61, 'Mose', 'Kulas', 'larkin.felicity@example.org', '342.151.0803x987', '2018-07-19 00:56:35', '2016-08-04 05:53:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (62, 'Zoe', 'Rath', 'ola85@example.net', '+78(3)7802363882', '2011-05-18 04:02:28', '2014-08-22 04:46:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (63, 'Selena', 'Runolfsdottir', 'osenger@example.com', '1-113-123-3472', '2012-10-19 02:35:57', '2013-09-30 17:23:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (64, 'Osborne', 'Hermann', 'eliza.eichmann@example.org', '998.618.3014', '2013-09-17 03:26:39', '2013-08-30 05:06:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (65, 'Tyree', 'Crooks', 'sturner@example.com', '080-112-5558', '2021-03-25 01:20:21', '2019-01-12 19:00:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (66, 'Marcus', 'McCullough', 'drobel@example.org', '697-560-2908x1191', '2018-08-04 01:32:36', '2013-11-30 01:36:58');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (67, 'Dejah', 'Murray', 'norene17@example.org', '1-050-642-3062', '2019-01-13 14:51:17', '2018-10-06 04:11:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (68, 'Brigitte', 'Monahan', 'gia.skiles@example.net', '(871)309-6285x463', '2012-06-12 13:50:44', '2015-02-16 20:18:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (69, 'Dedrick', 'Torp', 'becker.sydney@example.org', '953-804-7400x908', '2018-06-04 19:45:43', '2015-10-08 19:30:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (70, 'Hallie', 'Bogisich', 'abel34@example.net', '458-074-8051x675', '2019-04-26 07:10:48', '2012-11-23 23:26:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (71, 'Duncan', 'Larkin', 'william60@example.net', '208-201-5118', '2020-10-09 10:12:53', '2017-05-17 23:27:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (72, 'Kayley', 'Bechtelar', 'crooks.talia@example.org', '(081)664-3378x5094', '2019-01-21 07:31:13', '2018-05-02 16:25:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (73, 'Stanford', 'Gutmann', 'ayundt@example.org', '1-249-541-8274x175', '2018-02-20 10:24:02', '2017-02-13 15:16:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (74, 'Efrain', 'O\'Reilly', 'delia.berge@example.net', '876.238.0987', '2017-07-23 21:26:02', '2011-10-01 14:24:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (75, 'Jaida', 'Skiles', 'isobel28@example.net', '872-382-9612', '2019-08-14 20:46:34', '2014-03-08 11:22:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (76, 'Garry', 'Howe', 'macey58@example.net', '219.155.8011x496', '2011-10-21 02:55:17', '2015-11-17 16:15:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (77, 'Retha', 'Lowe', 'sierra.kunze@example.com', '873-494-9035', '2012-02-17 12:19:35', '2019-01-21 07:13:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (78, 'Josie', 'Herman', 'ljohns@example.org', '213-054-2470x7491', '2015-10-04 12:01:39', '2014-03-05 19:07:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (79, 'Mckayla', 'Rempel', 'xtromp@example.com', '136-146-3823', '2020-08-26 12:20:29', '2016-06-14 21:55:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (80, 'Clement', 'Lebsack', 'qlittle@example.net', '502-046-0907x9215', '2019-08-22 16:50:50', '2016-10-22 18:51:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (81, 'Linnea', 'Durgan', 'eriberto.waelchi@example.com', '(472)775-4482x6909', '2015-03-07 23:22:27', '2013-07-18 06:21:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (82, 'Ola', 'Bradtke', 'lzieme@example.net', '(001)147-1330', '2019-10-01 19:37:39', '2014-06-29 05:10:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (83, 'Otis', 'Feil', 'collins.norval@example.com', '(141)136-5796', '2018-12-06 09:19:58', '2013-06-20 19:21:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (84, 'Judy', 'Koepp', 'aylin.bailey@example.net', '865.419.6386x053', '2012-09-22 11:55:56', '2013-10-31 15:23:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (85, 'Tillman', 'Carter', 'joan99@example.com', '385.269.8349x13321', '2014-10-30 19:28:13', '2015-01-17 22:51:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (86, 'Marlin', 'Lubowitz', 'travis50@example.com', '1-056-282-4669', '2016-03-31 09:08:20', '2017-11-19 22:53:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (87, 'Jonathon', 'Swaniawski', 'tillman.phoebe@example.org', '839-895-4810', '2013-11-06 23:53:25', '2013-03-04 23:07:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (88, 'Arthur', 'Fay', 'ceasar.oberbrunner@example.net', '858-682-7623x93626', '2020-07-27 23:19:20', '2016-07-06 14:10:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (89, 'Herbert', 'Swaniawski', 'demetris.bradtke@example.net', '071.598.4372x624', '2013-10-09 05:11:23', '2019-03-22 22:57:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (90, 'Sabina', 'Wehner', 'ressie.conroy@example.net', '691-338-3429', '2012-09-02 05:34:58', '2017-10-21 11:43:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (91, 'Mayra', 'Schmidt', 'arden63@example.org', '409-869-9987x92205', '2011-06-12 20:12:25', '2012-04-23 23:39:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (92, 'Icie', 'Wolf', 'nyundt@example.net', '961-939-3325x75463', '2015-09-20 16:07:15', '2011-09-08 23:34:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (93, 'Bettie', 'Krajcik', 'pwelch@example.net', '+33(7)2907585769', '2018-07-12 21:18:26', '2017-10-30 11:18:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (94, 'Cedrick', 'Moore', 'durgan.alisha@example.org', '(478)107-4065x19659', '2013-12-25 21:34:42', '2016-02-14 04:51:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (95, 'Kelton', 'Fadel', 'hoppe.micah@example.com', '(875)060-9111x878', '2015-12-17 12:05:36', '2012-01-10 22:07:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (96, 'Flavie', 'Beier', 'murphy31@example.org', '797-017-8067x276', '2014-10-12 00:31:25', '2018-04-21 19:01:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (97, 'Carrie', 'Davis', 'weldon14@example.com', '00904356632', '2019-07-26 12:01:51', '2014-07-12 20:40:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (98, 'Amelia', 'Greenfelder', 'jose83@example.com', '145-171-6875x2257', '2014-08-12 01:45:52', '2014-02-17 23:32:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (99, 'Gonzalo', 'Stracke', 'isobel.kerluke@example.org', '537-228-5179x87512', '2013-05-04 06:13:04', '2015-01-15 06:35:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `update_at`) VALUES (100, 'Isidro', 'Roberts', 'nathen22@example.org', '320.600.3208x6820', '2013-12-11 08:33:29', '2020-12-10 21:39:45');


