import { Body, Controller, Post } from '@nestjs/common';
import { SignInService } from './sign-in.service';
import { Owner } from './model/sign-in.model';
import { ApiBody } from '@nestjs/swagger';

interface ownerSignIn {
    OwnerUsername: string,
    OwnerPassword: string
}

@Controller('sign-in')
export class SignInController {
    constructor(private readonly signInService: SignInService) {}

    @Post('register')
    @ApiBody({
        type: Owner,
        examples: {
            register_owner1: {
                value: {
                    "OwnerFirstname": "Watthana",
                    "OwnerLastname": "Peerajing",
                    "OwnerUsername": "LatteShop1",
                    "OwnerPassword": "Hello",
                    "RecordStatus": "N",
                    "CreateDate": "2024-06-14T14:41:43-05:00",
                    "CreateUser": "LatteShop1"
                }
            }
        }
    })
    async registerOwner(@Body() postData: Owner): Promise<any> {
        const result = await this.signInService.registerOwner(postData)
        return result
    }

    @Post('')
    @ApiBody({
        type: Owner,
        examples: {
            signIn: {
                value: {
                    "OwnerUsername": "LatteShop1",
                    "OwnerPassword": "Hello",
                }
            }
        }
    })
    async signIn(@Body() postData: ownerSignIn): Promise<any> {
        const result = await this.signInService.signIn(postData.OwnerUsername, postData.OwnerPassword)
        return result
    }
}
