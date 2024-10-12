import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { Shop } from 'src/register/register.model';
// import { Owner } from './model/sign-in.model';
import { comparePassword } from 'src/utils/bcrypt';

@Injectable()
export class SignInService {
    constructor( private prisma: PrismaService ) {}

    async signIn (username: string, password: string, code: string) {
        // *check list
        // * 1. shop code
        // * 2. username
        // * 3. password 

        const id = await this.prisma.shop.findUnique({
            where: {
                ShopCode: code,

            },
            select: {
                ShopID: true, 

            }
        });

        if(id) {
            const owner = await this.prisma.owner.findFirst({
                where: {
                    ShopID: id.ShopID,
                    OwnerUsername: username
                },
                select: {
                    ShopID: true,
                    OwnerID: true,
                    JobTitleID: true,
                    StatusLogin: true,
    
                    OwnerPassword: true
                }
            });

            if(owner) {
                const matched = await comparePassword(password, owner.OwnerPassword)

                if(matched) {
                    return {
                        shop_code: true,
                        username: true,
                        password: matched,
                        user: {
                            shop_id: owner.ShopID,
                            owner_id: owner.OwnerID,
                            job_title_id: owner.JobTitleID,
                            status_login: owner.StatusLogin
                        }
                    }
                }else {
                    return {
                        shop_code: true,
                        username: true,
                        password: matched
                    }
                }

            }else {
                const employee = await this.prisma.employee.findFirst({
                    where: {
                        EmployeeUsername: username,
                        ShopID: id.ShopID
                    },
                    select: {
                        ShopID: true,
                        EmployeeID: true,
                        JobTitleID: true,

                        EmployeePassword: true,
                    }
                })

                if(employee) {
                    const matched = await comparePassword(password, employee.EmployeePassword)

                    if(matched) {
                        return {
                            shop_code: true,
                            username: true,
                            password: matched,
                            user: {
                                shop_id: employee.ShopID,
                                employee_id: employee.EmployeeID,
                                job_title_id: employee.JobTitleID,
                            }
                        }
                    }else {
                        return {
                            shop_code: true,
                            username: true,
                            password: matched,
                        }
                    }

                }else {
                    return {
                        shop_code: true,
                        username: false,
                    }
                }
            }
        }else {
            return {
                shop_code: false
            }
        }
    }
}
