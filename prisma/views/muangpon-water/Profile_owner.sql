SELECT
  `muangpon-water`.`Owner`.`OwnerID` AS `OwnerID`,
  `muangpon-water`.`Owner`.`OwnerFirst_name` AS `OwnerFirst_name`,
  `muangpon-water`.`Owner`.`OwnerLast_name` AS `OwnerLast_name`,
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
            `muangpon-water`.`Owner`
            LEFT JOIN `muangpon-water`.`MasJobTitle` ON(
              (
                `muangpon-water`.`Owner`.`JobTitleID` = `muangpon-water`.`MasJobTitle`.`JobTitleID`
              )
            )
          )
          LEFT JOIN `muangpon-water`.`Shop` ON(
            (
              `muangpon-water`.`Owner`.`ShopID` = `muangpon-water`.`Shop`.`ShopID`
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