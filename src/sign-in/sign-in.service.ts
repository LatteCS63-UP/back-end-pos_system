import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { Owner } from './model/sign-in.model';
import { comparePassword, encodePassword } from 'src/utils/bcrypt';

@Injectable()
export class SignInService {
    constructor( private prisma: PrismaService ) {}

    async registerOwner(postData: Owner): Promise<Owner> {
        const password = await encodePassword(postData.OwnerPassword)
        return await this.prisma.owner.create({data : {
            OwnerFirstname: postData.OwnerFirstname,
            OwnerLastname: postData.OwnerLastname,
            OwnerUsername: postData.OwnerUsername,
            OwnerPassword: password,
            RecordStatus: postData.RecordStatus,
            CreateDate: postData.CreateDate,
            CreateUser: postData.CreateUser
        }})
    }

    async signIn (username: string, password: string) {
        const Owner_DB = await this.prisma.owner.findUnique({
            where: {
                OwnerUsername: username
            }
        })

        if (Owner_DB) {
            const matched = await comparePassword(password, Owner_DB.OwnerPassword)

            if (matched) {
                return {
                    username_signIn: true,
                    password_signIn: matched,
                    user: {}
                }
            } else {
                return {
                    username_signIn: true,
                    password_signIn: matched
                }
            }
        }else {
            return {
                username_signIn: false
            }
        }
    }
}
