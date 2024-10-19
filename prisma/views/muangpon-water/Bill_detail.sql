SELECT
  `muangpon-water`.`Shop`.`Shop_code` AS `Shop_code`,
  `muangpon-water`.`Shop`.`Shop_name` AS `Shop_name`,
  `muangpon-water`.`Bill`.`Bill_code` AS `Bill_code`,
  `muangpon-water`.`OrderExport`.`Product_count` AS `Product_count`,
  `muangpon-water`.`Product`.`Product_name` AS `Product_name`,
  `muangpon-water`.`Product`.`Product_price` AS `Product_price`,
(
    `muangpon-water`.`Product`.`Product_price` * `muangpon-water`.`OrderExport`.`Product_count`
  ) AS `Total_price`,
  `muangpon-water`.`Customer`.`Customer_username` AS `Customer_username`,
  concat(
    `muangpon-water`.`Customer`.`Customer_first_name`,
    ' ',
    `muangpon-water`.`Customer`.`Customer_last_name`
  ) AS `Customer_name`,
  `muangpon-water`.`Bill`.`Pay_type` AS `Pay_type`,
  `muangpon-water`.`Statement`.`Statement_number` AS `Statement_number`
FROM
  (
    (
      (
        (
          (
            `muangpon-water`.`Bill`
            JOIN `muangpon-water`.`Statement` ON(
              (
                `muangpon-water`.`Bill`.`StatementID` = `muangpon-water`.`Statement`.`StatementID`
              )
            )
          )
          JOIN `muangpon-water`.`Customer` ON(
            (
              `muangpon-water`.`Bill`.`CustomerID` = `muangpon-water`.`Customer`.`CustomerID`
            )
          )
        )
        JOIN `muangpon-water`.`OrderExport` ON(
          (
            `muangpon-water`.`Bill`.`BillID` = `muangpon-water`.`OrderExport`.`BillID`
          )
        )
      )
      JOIN `muangpon-water`.`Product` ON(
        (
          `muangpon-water`.`OrderExport`.`ProductID` = `muangpon-water`.`Product`.`ProductID`
        )
      )
    )
    JOIN `muangpon-water`.`Shop` ON(
      (
        `muangpon-water`.`Product`.`ShopID` = `muangpon-water`.`Shop`.`ShopID`
      )
    )
  )