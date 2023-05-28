import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { InfoService } from './info.service';
import { CreateInfoDto } from './dto/create-info.dto';
import { UpdateInfoDto } from './dto/update-info.dto';

@Controller('info')
export class InfoController {
  constructor(private readonly infoService: InfoService) {}
/*
  @Get('getproblem')
  gm1(@Body() createInfoDto: CreateInfoDto) {
    return this.infoService.getproblem(createInfoDto);
  }

  @Get('getallproblem')
  gmall() {
    return this.infoService.getallproblem();
  }
  @Get('getprobset')
  gt1(@Body() createInfoDto: CreateInfoDto) {
    return this.infoService.getprobset(createInfoDto);
  }

  @Get('getallprobset')
  gtall() {
    return this.infoService.getallprobset();
  }
  @Get('getpermission')
  gn1(@Body() createInfoDto: CreateInfoDto) {
    return this.infoService.getpermission(createInfoDto);
  }

  @Get('getallpermission')
  gnall() {
    return this.infoService.getallpermission();
  }
  @Get('getroles')
  gr1(@Body() createInfoDto: CreateInfoDto) {
    return this.infoService.getroles(createInfoDto);
  }

  @Get('getallroles')
  grall() {
    return this.infoService.getallroles();
  }
  @Get('getstate')
  gs1(@Body() createInfoDto: CreateInfoDto) {
    return this.infoService.getstate(createInfoDto);
  }
*/
  @Get('getallstate')
  gsall(@Body() createInfoDto: CreateInfoDto) {
    return this.infoService.getallstate(createInfoDto);
  }

  @Get('getallhis')
  ghsall(@Body() createInfoDto: CreateInfoDto) {
    return this.infoService.getallhistory(createInfoDto);
  }
  /*
  @Get('getusers')
  gu1(@Body() createInfoDto: CreateInfoDto) {
    return this.infoService.getusers(createInfoDto);
  }

  @Get('getallusers')
  guall() {
    return this.infoService.getallusers();
  }
  */
}
