import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
// import { SignInModule } from './sign-in/sign-in.module';
import { RegisterModule } from './register/register.module';
import { GroupModule } from './group/group.module';

@Module({
  imports: [RegisterModule, GroupModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
