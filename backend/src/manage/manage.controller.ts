import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ManageService } from './manage.service';
import { CreateManageDto } from './dto/create-manage.dto';
import { UpdateManageDto } from './dto/update-manage.dto';

@Controller('manage')
export class ManageController {
  constructor(private readonly manageService: ManageService) {}

  @Post("init")
  create(@Body() createManageDto: CreateManageDto) {
    return this.manageService.init(createManageDto);
  }
}
