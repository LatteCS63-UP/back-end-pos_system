import { Body, Controller, Post } from '@nestjs/common';
import { SignInService } from './sign-in.service';
import { Sign_in } from './model/sign-in.model';
import { ApiBody, ApiTags } from '@nestjs/swagger';

// interface ownerSignIn {
//     OwnerUsername: string,
//     OwnerPassword: string,
//     ShopCode: string
// }

@Controller('sign-in')
@ApiTags('Sign-in')
export class SignInController {
    constructor(private readonly signInService: SignInService) {}

    @Post('')
    @ApiBody({
        type: Sign_in,
        examples: {
            signIn: {
                value: {
                    "ShopCode": "001",
                    "Username": "Latte",
                    "Password": "123"
                }
            }
        }
    })
    async signIn(@Body() data: Sign_in): Promise<any> {
        const result = await this.signInService.signIn(data.Username, data.Password, data.ShopCode)
        return result
        // console.log(data)
    }
}
