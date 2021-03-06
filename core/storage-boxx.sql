CREATE TABLE `stock` (
  `stock_sku` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `stock_name` varchar(255) NOT NULL,
  `stock_desc` varchar(255) DEFAULT NULL,
  `stock_unit` varchar(255) NOT NULL,
  `stock_qty` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stock_mvt` (
  `stock_sku` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `mvt_date` datetime NOT NULL,
  `mvt_direction` varchar(1) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `mvt_qty` decimal(12,2) NOT NULL,
  `mvt_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'Administrator', 'admin@sb.com', '$2y$10$KQCKY53f02kaIPVwk5o4.eJh2KdquVfMszB/NWO4FCynEjMssl4.i');

ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_sku`);

ALTER TABLE `stock_mvt`
  ADD PRIMARY KEY (`stock_sku`,`mvt_date`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mvt_direction` (`mvt_direction`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_name` (`user_name`);

ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;