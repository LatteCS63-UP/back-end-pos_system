import { Prisma } from "@prisma/client";

export class Shop implements Prisma.ShopCreateInput {
    Shop_code: string;
    Shop_name: string;
    Shop_address: string;

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
    Owner_username: string;
    Owner_password: string;
    Owner_first_name: string;
    Owner_last_name: string;
    StatusLogin: string;

    JobTitleID: number;
    ShopID: number;

    RecordStatus?: string;
    CreateDate?: string | Date;
    CreateUser?: string;
    LastDate?: string | Date;
    LastUser?: string;

}