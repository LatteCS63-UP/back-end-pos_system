import { Body, Controller, Get, Post, Query, Req, Res } from '@nestjs/common';
import { Request, Response } from 'express';
import { ApiBody, ApiTags } from '@nestjs/swagger';
import { Owner, Shop } from './register.model';
import { RegisterService } from './register.service';

@Controller('register')
@ApiTags('Register')
export class RegisterController {
    constructor(private readonly registerService: RegisterService) {}

    @Post('shop')
    // @ApiBody({
    //     type: Shop,
    //     examples: {
    //         Shop1: {
    //             value: {
    //                 "ShopCode": "",
    //                 "ShopName": "Muangpon-waterDrink",
    //                 "ShopAddress": "33 M.1",

    //                 "ProvinceID": 58,
    //                 "DistrictID": 5802,
    //                 "SubDistrictID": 58020300,

    //                 "RecordStatus": "N",
    //                 "CreateDate": "2024-10-07T06:50:07.796Z",
    //                 "CreateUser": "Latte",
    //                 "LastDate": "2024-10-07T06:50:07.796Z",
    //                 "lastUser": null

    //             }
    //         }
    //     }
    // })
    async register_shop(@Body() shop: Shop): Promise<any> {
        return await this.registerService.register_shop(shop)
        // console.log(shop)
        
    }

    @Post('owner')
    async register_owner(@Body() owner: Owner, @Query('Shop_code') shop_code: string): Promise<any> {
        return await this.registerService.register_owner(owner, shop_code)
        // console.log(owner)

    }

}
