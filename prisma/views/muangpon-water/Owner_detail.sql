SELECT
  concat(
    `muangpon-water`.`Owner`.`Owner_first_name`,
    ' ',
    `muangpon-water`.`Owner`.`Owner_last_name`
  ) AS `Owner_name`,
  `muangpon-water`.`MasJobTitle`.`JobTitle_name` AS `JobTitle_name`,
  `muangpon-water`.`Owner`.`OwnerID` AS `OwnerID`,
  `muangpon-water`.`Owner`.`Owner_username` AS `Owner_username`,
  `muangpon-water`.`Owner`.`Owner_password` AS `Owner_password`,
  `muangpon-water`.`Owner`.`StatusLogin` AS `StatusLogin`,
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
            `muangpon-water`.`Owner`
            JOIN `muangpon-water`.`MasJobTitle` ON(
              (
                `muangpon-water`.`Owner`.`JobTitleID` = `muangpon-water`.`MasJobTitle`.`JobTitleID`
              )
            )
          )
          JOIN `muangpon-water`.`Shop` ON(
            (
              `muangpon-water`.`Owner`.`ShopID` = `muangpon-water`.`Shop`.`ShopID`
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