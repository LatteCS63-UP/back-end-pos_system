SELECT
  `muangpon-water`.`Employee`.`EmployeeID` AS `EmployeeID`,
  `muangpon-water`.`Employee`.`EmployeeFirst_name` AS `EmployeeFirst_name`,
  `muangpon-water`.`Employee`.`EmployeeLast_name` AS `EmployeeLast_name`,
  `muangpon-water`.`MasJobTitle`.`JobTitleName` AS `JobTitleName`,
  `muangpon-water`.`Shop`.`ShopCode` AS `ShopCode`,
  `muangpon-water`.`Shop`.`ShopName` AS `ShopName`,
  `muangpon-water`.`Shop`.`ShopAddress` AS `ShopAddress`,
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
            LEFT JOIN `muangpon-water`.`MasJobTitle` ON(
              (
                `muangpon-water`.`Employee`.`JobTitleID` = `muangpon-water`.`MasJobTitle`.`JobTitleID`
              )
            )
          )
          LEFT JOIN `muangpon-water`.`Shop` ON(
            (
              `muangpon-water`.`Employee`.`ShopID` = `muangpon-water`.`Shop`.`ShopID`
            )
          )
        )
        LEFT JOIN `muangpon-water`.`MasProvince` ON(
          (
            `muangpon-water`.`Shop`.`ProvinceID` = `muangpon-water`.`MasProvince`.`ProvinceID`
          )
        )
      )
      LEFT JOIN `muangpon-water`.`MasDistrict` ON(
        (
          `muangpon-water`.`Shop`.`DistrictID` = `muangpon-water`.`MasDistrict`.`DistrictID`
        )
      )
    )
    LEFT JOIN `muangpon-water`.`MasSubDistrict` ON(
      (
        `muangpon-water`.`Shop`.`SubDistrictID` = `muangpon-water`.`MasSubDistrict`.`SubDistrictID`
      )
    )
  )