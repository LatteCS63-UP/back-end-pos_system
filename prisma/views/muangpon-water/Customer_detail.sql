SELECT
  concat(
    `muangpon-water`.`Customer`.`Customer_first_name`,
    ' ',
    `muangpon-water`.`Customer`.`Customer_last_name`
  ) AS `Customer_name`,
  `muangpon-water`.`Customer`.`CustomerID` AS `CustomerID`,
  `muangpon-water`.`Customer`.`Customer_username` AS `Customer_username`,
  `muangpon-water`.`Customer`.`Customer_password` AS `Customer_password`,
  `muangpon-water`.`Customer`.`Customer_phone_number` AS `Customer_phone_number`,
  `muangpon-water`.`Customer`.`Customer_point` AS `Customer_point`,
  `muangpon-water`.`Shop`.`Shop_code` AS `Shop_code`,
  `muangpon-water`.`Shop`.`Shop_name` AS `Shop_name`
FROM
  (
    `muangpon-water`.`Customer`
    JOIN `muangpon-water`.`Shop` ON(
      (
        `muangpon-water`.`Customer`.`ShopID` = `muangpon-water`.`Shop`.`ShopID`
      )
    )
  )