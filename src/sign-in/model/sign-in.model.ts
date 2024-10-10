import { Prisma } from "@prisma/client";

export class Owner implements Prisma.OwnerCreateInput {
    OwnerFirstname: string;
    OwnerLastname: string;
    OwnerUsername: string;
    OwnerPassword: string;
    RecordStatus: string;
    CreateDate: string | Date;
    CreateUser: string;
    LastDate?: string | Date;
    LastUser?: string;
    // Employee_send_Stock?: Prisma.Employee_send_StockCreateNestedManyWithoutEmployee_send_StockFK1Input;
    
}