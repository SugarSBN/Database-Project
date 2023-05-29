import { Controller, Get, Post, Put } from '@nestjs/common';
import { AppService } from './app.service';

// 主路径为 app
@Controller("app")
export class AppController {
  constructor(private readonly appService: AppService) {}
  
}
  
