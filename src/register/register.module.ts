import { Module } from '@nestjs/common';
import { RegisterService } from './register.service';
import { RegisterController } from './register.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  providers: [RegisterService, PrismaService],
  controllers: [RegisterController]
})
export class RegisterModule {}
