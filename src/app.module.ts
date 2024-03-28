import { Module } from '@nestjs/common';
import { BookController } from './controller/book.controller';
import { BookService } from './service/book.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { configService } from './config/config.service';
import { Book } from './entity/book.entity';
import { Tag } from './entity/tag.entity';
import OrderController from './controller/order.controller';
import { JwtModule } from '@nestjs/jwt';
import { jwtConstants } from './auth/constants';
import { APP_GUARD } from '@nestjs/core';
import { AuthGuard } from './auth/auth.guard';
import AuthController from './controller/auth.controller';
import { OrderService } from './service/order.service';
import { UserService } from './service/user.service';
import { AuthService } from './service/auth.service';
import { Order } from './entity/order.entity';
import { User } from './entity/user.entity';
import UserControler from './controller/user.controller';
import TagController from './controller/tag.controller';
import { TagService } from './service/tag.service';

@Module({
  imports: [
    JwtModule.register({
      global: true,
      secret: jwtConstants.secret,
      signOptions: { expiresIn: '1d' },
    }),
    TypeOrmModule.forRoot(configService.getTypeOrmConfig()),
    TypeOrmModule.forFeature([
      Book,
      Tag,
      Order,
      User
    ])
  ],
  controllers: [
    BookController,
    OrderController,
    AuthController,
    UserControler,
    TagController,
  ],
  providers: [
    {
      provide: APP_GUARD,
      useClass: AuthGuard
    },
    BookService,
    AuthService,
    OrderService,
    UserService,
    TagService
  ],
})
export class AppModule { }
