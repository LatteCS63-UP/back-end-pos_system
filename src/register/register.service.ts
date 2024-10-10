import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
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

        data.ShopCode = newId;
        data.CreateDate = currentDate;

        return await this.prisma.shop.create({
            data,
        })
    }

    async register_owner(data: Owner) {
        const currentDate = new Date().toISOString();

        const username = await this.prisma.owner.findUnique({
            where: {
                OwnerUsername: data.OwnerUsername
            }
        })

        if (username) {
            return {
                username_status: false,
                description: 'Duplicate username, Please fill in again.'
            }
        }else {
            //* change field CreateDate of owner follow currentDate value.
            data.CreateDate = currentDate;

            await this.prisma.owner.create({
                data,
            })

            return {
                username_status: true,
                description: 'Register success.',
            }
        }
    }
}
