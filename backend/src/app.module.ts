import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PostsModule } from './posts/posts.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigService, ConfigModule } from '@nestjs/config';
import envConfig from '../config/env';
import { PostsEntity } from './posts/posts.entity';
import { UserModule } from './user/user.module';
import { RootModule } from './root/root.module';
import { UsersEntity } from './root/entities/root.entity';
import { StudentModule } from './student/student.module';
@Module({
  imports: [
    ConfigModule.forRoot({ 
    isGlobal: true,  // 设置为全局
    envFilePath: [envConfig.path] 
   }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: async (configService: ConfigService) => ({
        type: 'mysql', 
        entities: [PostsEntity,UsersEntity],  
        host: configService.get('DB_HOST', 'localhost'), 
        port: configService.get<number>('DB_PORT', 3306), 
        username: configService.get('DB_USER', 'root'),   
        password: configService.get('DB_PASSWORD', '7788iiuu'), 
        database: configService.get('DB_DATABASE', 'blog'), 
        timezone: '+08:00', 
        synchronize: true, 
      }),
    }),
    PostsModule,
    UserModule,
    RootModule,
    StudentModule,
  ], 
  controllers: [AppController],
  providers: [AppService]
})
export class AppModule {}
