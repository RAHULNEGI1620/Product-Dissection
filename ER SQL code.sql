CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `username` varchar(255),
  `Address` varchar(255),
  `PaymentInformation` varchar(255)
);

CREATE TABLE `Product` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `description` text COMMENT 'Content of the post',
  `price` integer,
  `created_at` timestamp
);

CREATE TABLE `orders` (
  `id` integer PRIMARY KEY,
  `userID` integer,
  `delieveryStatus` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `seller` (
  `id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `sellerproduct` (
  `sellerID` integer,
  `productID` integer,
  `description` text,
  PRIMARY KEY (`sellerID`, `productID`)
);

CREATE TABLE `AWSservice` (
  `id` integer PRIMARY KEY,
  `type` varchar(255),
  `usagedata` varchar(255)
);

CREATE TABLE `BuisnessAWS` (
  `BuisnessID` integer,
  `AWSserviceID` integer,
  PRIMARY KEY (`BuisnessID`, `AWSserviceID`)
);

ALTER TABLE `orders` ADD FOREIGN KEY (`userID`) REFERENCES `users` (`username`);

ALTER TABLE `Product` ADD FOREIGN KEY (`name`) REFERENCES `seller` (`id`);

ALTER TABLE `sellerproduct` ADD FOREIGN KEY (`sellerID`) REFERENCES `seller` (`id`);

ALTER TABLE `BuisnessAWS` ADD FOREIGN KEY (`BuisnessID`) REFERENCES `AWSservice` (`type`);

ALTER TABLE `BuisnessAWS` ADD FOREIGN KEY (`BuisnessID`) REFERENCES `sellerproduct` (`description`);

ALTER TABLE `Product` ADD FOREIGN KEY (`created_at`) REFERENCES `orders` (`id`);

ALTER TABLE `AWSservice` ADD FOREIGN KEY (`id`) REFERENCES `users` (`PaymentInformation`);
