import { Prisma } from "@prisma/client";

export class Owner implements Prisma.OwnerCreateInput {
    OwnerFirst_name: string;
    OwnerLast_name: string;
    OwnerUsername: string;
    OwnerPassword: string;
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