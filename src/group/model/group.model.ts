import { Prisma } from "@prisma/client";

export class MasProvince implements Prisma.MasProvinceCreateInput {
    ProvinceID: number;
    ProvinceNameTh: string;
    ProvinceNameEn?: string;
}

export class MasDistrict implements Prisma.MasDistrictCreateInput {
    DistrictID: number;
    DistrictNameTh: string;
    DistrictNameEn?: string;

    ProvinceID: number;
}

export class MasSubDistrict implements Prisma.MasSubDistrictCreateInput {
    SubDistrictID: number;
    SubDistrictNameTh: string;
    SubDistrictNameEn?: string;

    DistrictID: number;
}

export class MasJobTitle implements Prisma.MasJobTitleCreateInput {
    JobTitleID: number;
    JobTitle_name: string;
}