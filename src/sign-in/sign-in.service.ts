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
                Shop_code: code,
            }
        });

        if(id) {
            const owner = await this.prisma.owner_detail.findFirst({
                where: {
                    Shop_code: code,
                    Owner_username: username
                },
                select: {
                    Shop_code: true,
                    OwnerID: true,
                    JobTitle_name: true,
                    StatusLogin: true,
    
                    Owner_password: true
                }
            });

            if(owner) {
                const matched = await comparePassword(password, owner.Owner_password)

                if(matched) {
                    return {
                        shop_code: true,
                        username: true,
                        password: matched,
                        user: {
                            id: owner.OwnerID,
                            job_title_name: owner.JobTitle_name,
                            status_login: owner.StatusLogin,

                            shop_code: owner.Shop_code,
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
                const employee = await this.prisma.employee_detail.findFirst({
                    where: {
                        Employee_username: username,
                        Shop_code: code
                    },
                    select: {
                        Shop_code: true,
                        EmployeeID: true,
                        JobTitle_name: true,

                        Employee_password: true,
                    }
                })

                if(employee) {
                    const matched = await comparePassword(password, employee.Employee_password)

                    if(matched) {
                        return {
                            shop_code: true,
                            username: true,
                            password: matched,
                            user: {
                                shop_code: employee.Shop_code,
                                id: employee.EmployeeID,
                                job_title_name: employee.JobTitle_name,
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
