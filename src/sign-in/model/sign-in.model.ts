import { Prisma } from "@prisma/client";

export class Owner implements Prisma.OwnerCreateInput {
    Owner_first_name: string;
    Owner_last_name: string;
    Owner_username: string;
    Owner_password: string;
    StatusLogin: string;

    RecordStatus: string;
    CreateDate: string | Date;
    CreateUser: string;
    LastDate?: string | Date;
    LastUser?: string;
    // Employee_send_Stock?: Prisma.Employee_send_StockCreateNestedManyWithoutEmployee_send_StockFK1Input;
    
}

export class Sign_in {
    Username: string;
    Password: string;
    ShopCode: string;
}