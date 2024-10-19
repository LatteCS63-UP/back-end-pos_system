SELECT
  `muangpon-water`.`Shop`.`Shop_code` AS `Shop_code`,
  `muangpon-water`.`Statement`.`Statement_number` AS `Statement_number`,
  concat(
    `muangpon-water`.`Employee`.`Employee_first_name`,
    ' ',
    `muangpon-water`.`Employee`.`Employee_last_name`
  ) AS `Employee_name`,
  `muangpon-water`.`Statement`.`State_on` AS `State_on`,
  `muangpon-water`.`Statement`.`State_off` AS `State_off`,
  `muangpon-water`.`Statement`.`Change_in_box` AS `Change_in_box`,
  `muangpon-water`.`Statement`.`Total_price` AS `Total_price`,
  `muangpon-water`.`Statement`.`Receive` AS `Receive`
FROM
  (
    (
      `muangpon-water`.`Statement`
      JOIN `muangpon-water`.`Employee` ON(
        (
          `muangpon-water`.`Statement`.`EmployeeID` = `muangpon-water`.`Employee`.`EmployeeID`
        )
      )
    )
    JOIN `muangpon-water`.`Shop` ON(
      (
        `muangpon-water`.`Employee`.`ShopID` = `muangpon-water`.`Shop`.`ShopID`
      )
    )
  )