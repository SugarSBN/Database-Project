import { Injectable } from '@nestjs/common';
import { CreateRootDto } from './dto/create-root.dto';
import { UpdateRootDto } from './dto/update-root.dto';
import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
@Injectable()
export class RootService {
  create(createRootDto: CreateRootDto) {
    return 'This action adds a new root';
  }

  findAll() {
    return `This action returns all root`;
  }

  findOne(id: number) {
    return `This action returns a #${id} root`;
  }

  update(id: number, updateRootDto: UpdateRootDto) {
    return `This action updates a #${id} root`;
  }

  remove(id: number) {
    this.update(2,UpdateRootDto);
    return `This action removes a #${id} root`;
  }
}
