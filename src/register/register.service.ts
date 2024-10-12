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
            const lastId = parseInt(lastShop.ShopCode, 10);
            newId = (lastId + 1).toString().padStart(3, '0');
        } else {
            newId = '001'
        }

        return await this.prisma.shop.create({
            data: {
                ShopCode: newId,
                ShopName: data.ShopName,
                ShopAddress: data.ShopAddress,
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

        const password_encode = await encodePassword(data.OwnerPassword)

        const id = await this.prisma.shop.findUnique({
            where: {
                ShopCode: shop_code
            },
            select: {
                ShopID: true,
            }
        })

        await this.prisma.owner.create({
            data: {
                OwnerFirst_name: data.OwnerFirst_name,
                OwnerLast_name: data.OwnerLast_name,
                OwnerUsername: data.OwnerUsername,
                OwnerPassword: password_encode,
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
