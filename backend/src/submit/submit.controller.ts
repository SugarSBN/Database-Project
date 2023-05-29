import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { SubmitService } from './submit.service';
import { CreateSubmitDto } from './dto/create-submit.dto';
import { UpdateSubmitDto } from './dto/update-submit.dto';

@Controller('submit')
export class SubmitController {
  constructor(private readonly submitService: SubmitService) {}

  @Post("submit")
  create(@Body() createSubmitDto: CreateSubmitDto) {
    return this.submitService.submit(createSubmitDto);
  }
  @Post("check")
  creat(@Body() createSubmitDto: CreateSubmitDto) {
    return this.submitService.check(createSubmitDto);
  }
}
