SELECT
  concat(
    `muangpon-water`.`Employee`.`Employee_first_name`,
    ' ',
    `muangpon-water`.`Employee`.`Employee_last_name`
  ) AS `Employee_name`,
  `muangpon-water`.`MasJobTitle`.`JobTitle_name` AS `JobTitle_name`,
  `muangpon-water`.`Employee`.`EmployeeID` AS `EmployeeID`,
  `muangpon-water`.`Employee`.`Employee_username` AS `Employee_username`,
  `muangpon-water`.`Employee`.`Employee_password` AS `Employee_password`,
  `muangpon-water`.`Shop`.`Shop_code` AS `Shop_code`,
  `muangpon-water`.`Shop`.`Shop_name` AS `Shop_name`,
  `muangpon-water`.`Shop`.`Shop_address` AS `Shop_address`,
  `muangpon-water`.`MasProvince`.`ProvinceNameTh` AS `ProvinceNameTh`,
  `muangpon-water`.`MasDistrict`.`DistrictNameTh` AS `DistrictNameTh`,
  `muangpon-water`.`MasSubDistrict`.`SubDistrictNameTh` AS `SubDistrictNameTh`
FROM
  (
    (
      (
        (
          (
            `muangpon-water`.`Employee`
            JOIN `muangpon-water`.`MasJobTitle` ON(
              (
                `muangpon-water`.`Employee`.`JobTitleID` = `muangpon-water`.`MasJobTitle`.`JobTitleID`
              )
            )
          )
          JOIN `muangpon-water`.`Shop` ON(
            (
              `muangpon-water`.`Employee`.`ShopID` = `muangpon-water`.`Shop`.`ShopID`
            )
          )
        )
        JOIN `muangpon-water`.`MasProvince` ON(
          (
            `muangpon-water`.`Shop`.`ProvinceID` = `muangpon-water`.`MasProvince`.`ProvinceID`
          )
        )
      )
      JOIN `muangpon-water`.`MasDistrict` ON(
        (
          `muangpon-water`.`Shop`.`DistrictID` = `muangpon-water`.`MasDistrict`.`DistrictID`
        )
      )
    )
    JOIN `muangpon-water`.`MasSubDistrict` ON(
      (
        `muangpon-water`.`Shop`.`SubDistrictID` = `muangpon-water`.`MasSubDistrict`.`SubDistrictID`
      )
    )
  )