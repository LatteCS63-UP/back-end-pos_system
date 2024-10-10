import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { Owner, Shop } from './register.model';

@Injectable()
export class RegisterService {
    constructor(private prisma: PrismaService) {}

    async register_shop(data: Shop): Promise<Shop> {

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

        return await this.prisma.shop.create({
            data,
        })
    }

    async register_owner(data: Owner) {
        const username = await this.prisma.owner.findUnique({
            where: {
                OwnerUsername: data.OwnerUsername
            }
        })

        if (username) {
            return {
                username_status: false,
                description: 'Duplicate user, Please fill in again.'
            }
        }else {
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
