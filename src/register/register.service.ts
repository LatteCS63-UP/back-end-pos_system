import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { encodePassword } from 'src/utils/bcrypt';
import { Owner, Shop } from './register.model';

@Injectable()
export class RegisterService {
    constructor(private prisma: PrismaService) {}

    async register_shop(data: Shop): Promise<Shop> {
        //* change field CreateDate of shop follow currentDate value.
        const currentDate = new Date().toISOString();

        //* search shop in last position 
        const lastShop = await this.prisma.shop.findFirst({
            orderBy: {
                ShopID: 'desc'
            }
        });

        let newId: string;
        if (lastShop) {
            const lastId = parseInt(lastShop.Shop_code, 10);
            newId = (lastId + 1).toString().padStart(3, '0');
        } else {
            newId = '001'
        }

        return await this.prisma.shop.create({
            data: {
                Shop_code: newId,
                Shop_name: data.Shop_name,
                Shop_address: data.Shop_address,
                ProvinceID: data.ProvinceID,
                DistrictID: data.DistrictID,
                SubDistrictID: data.SubDistrictID,

                RecordStatus: 'N',
                CreateDate: currentDate
            }
        })
    }

    async register_owner(data: Owner, shop_code: string) {
        const currentDate = new Date().toISOString();

        const password_encode = await encodePassword(data.Owner_password)

        const id = await this.prisma.shop.findUnique({
            where: {
                Shop_code: shop_code
            },
            select: {
                ShopID: true,
            }
        })

        await this.prisma.owner.create({
            data: {
                Owner_first_name: data.Owner_first_name,
                Owner_last_name: data.Owner_last_name,
                Owner_username: data.Owner_username,
                Owner_password: password_encode,
                StatusLogin: 'W',
                JobTitleID: 1,
                ShopID: id.ShopID,

                RecordStatus: 'N',
                CreateDate: currentDate

            }
        })

        return {
            username_status: true,
            description: 'Register success.',
        }
    }
}
