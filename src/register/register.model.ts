import { Prisma } from "@prisma/client";

export class Shop implements Prisma.ShopCreateInput {
    ShopCode: string;
    ShopName: string;
    ShopAddress: string;

    ProvinceID: number;
    DistrictID: number;
    SubDistrictID: number;

    RecordStatus?: string;
    CreateDate?: string | Date;
    CreateUser?: string;
    LastDate?: string | Date;
    LastUser?: string;
    
}

export class Owner implements Prisma.OwnerCreateInput {
    OwnerUsername: string;
    OwnerPassword: string;
    OwnerFirst_name: string;
    OwnerLast_name: string;
    StatusLogin: string;

    JobTitleID: number;
    ShopID: number;

    RecordStatus?: string;
    CreateDate?: string | Date;
    CreateUser?: string;
    LastDate?: string | Date;
    LastUser?: string;

}