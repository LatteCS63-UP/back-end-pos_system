import { Module } from '@nestjs/common';
import { SignInController } from './sign-in.controller';
import { SignInService } from './sign-in.service';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [SignInController],
  providers: [SignInService, PrismaService]
})
export class SignInModule {}
