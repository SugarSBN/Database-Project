import { Injectable } from '@nestjs/common';
import { CreateInfoDto } from './dto/create-info.dto';
import { UpdateInfoDto } from './dto/update-info.dto';
import { DataSource, LessThan, createQueryBuilder } from "typeorm"
import { StateEntity } from 'src/entities/state.entity';
import { UsersEntity } from 'src/entities/users.entity';
import { RolesEntity } from 'src/entities/roles.entity';
import { ProblemEntity } from 'src/entities/problem.entity';
import { PermissionEntity } from 'src/entities/permission.entity';
import { ProbsetEntity } from 'src/entities/probset.entity';
import { HisEntity } from 'src/entities/history.entity';
export interface ProL {
  list,
  count: number,
  error: number,
  message:string,
}

@Injectable()
export class InfoService {

  buildDS()
  {
    const myDataSource = new DataSource({
      type: "mysql",
      host: "localhost",
      port: 3306,
      username: "root",
      password: "7788iiuu",
      database: "main1",
      entities: [
        ProblemEntity,
        PermissionEntity,
        ProbsetEntity,
        RolesEntity,
        UsersEntity,
        StateEntity,
        HisEntity
      ],
      synchronize: true,
    })
    
    return myDataSource;
  }
/*
  async getproblem(problem: Partial<ProblemEntity>): Promise<ProblemEntity> {
    const { id } = problem;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    
    const user = await myDataSource.manager.findOneBy(ProblemEntity, {
    id,
    })
    return user;
  }
  
  async getallproblem(): Promise<ProL> {
    
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    const ue = await myDataSource.getRepository(ProblemEntity).find()

    const firstUser = await myDataSource
    .getRepository(ProblemEntity)
    .createQueryBuilder("user")
    .getMany()


    return {list:firstUser, count:firstUser.length};
  }

  async getpermission(problem: Partial<PermissionEntity>): Promise<PermissionEntity> {
    const { id } = problem;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    
    const user = await myDataSource.manager.findOneBy(PermissionEntity, {
    id,
    })
    return user;
  }
  
  async getallpermission(): Promise<ProL> {
    
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    const ue = await myDataSource.getRepository(PermissionEntity).find( )
    return {list:ue, count:ue.length};
  }
  async getprobset(problem: Partial<ProbsetEntity>): Promise<ProbsetEntity> {
    const { id } = problem;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    
    const user = await myDataSource.manager.findOneBy(ProbsetEntity, {
    id,
    })
    return user;
  }
  
  async getallprobset(): Promise<ProL> {
    
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    const ue = await myDataSource.getRepository(ProbsetEntity).find()
    return {list:ue, count:ue.length};
  }
  async getroles(problem: Partial<RolesEntity>): Promise<RolesEntity> {
    const { id } = problem;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    
    const user = await myDataSource.manager.findOneBy(RolesEntity, {
    id,
    })
    return user;
  }
  
  async getallroles(): Promise<ProL> {
    
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    const ue = await myDataSource.getRepository(RolesEntity).find()
    return {list:ue, count:ue.length};
  }

  async getstate(problem: Partial<StateEntity>): Promise<StateEntity> {
    const { id } = problem;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    
    const user = await myDataSource.manager.findOneBy(StateEntity, {
    id,
    })
    return user;
  }
  */
  async getallhistory(problem: Partial<UsersEntity>): Promise<ProL> {
    const { name } = problem;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();

    const {id} = await myDataSource.getRepository(UsersEntity).findOne({
      where:{
        name: name,
      }
   })

   const user1 = await myDataSource.getRepository(HisEntity).find({
    where:{
      belong: id,
    }
  })

    return {list:user1, count:user1.length, error: 0, message:null};
  }
  


  async getallstate(problem: Partial<UsersEntity>): Promise<ProL> {
    const { name } = problem;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();

    const {id} = await myDataSource.getRepository(UsersEntity).findOne({
      where:{
        name: name,
      }
   })



    const user1 = await myDataSource
    .getRepository(StateEntity)
    .createQueryBuilder("state")
    .innerJoinAndSelect(ProblemEntity, "pro", "state.problem = pro.id")
    .getRawMany()
    //此处不能用getmany 要用gatrawmany 否则返回空值
    
   // return {list:ue, count:ue.length}
    return {list:user1, count:user1.length,error: 0,message:null};
  }


  async getalltable(problem: Partial<UsersEntity>) {
    const  name  = problem.name;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();

    const now = await myDataSource.getRepository(UsersEntity).findOne({
      where:{
        name: name,
      }
   })

   var mysql      = require('mysql');
   var connection = mysql.createConnection({
     host     : 'localhost',
     user     : 'root',
     password : '7788iiuu',
     database : now.nid
   });
    
   await connection.connect();
   var tmp1: null;

   return new Promise((resolve, reject) => {
     connection.query("show tables", 
     (error,results, fields) => {
         resolve({error, results});
     })
 })
  }

  async gettable(problem: CreateInfoDto) {
    const  name  = problem.name;
    const tablename = problem.tablename;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();

    const now = await myDataSource.getRepository(UsersEntity).findOne({
      where:{
        name: name,
      }
   })

   var mysql      = require('mysql');
   var connection = mysql.createConnection({
     host     : 'localhost',
     user     : 'root',
     password : '7788iiuu',
     database : now.nid
   });
    
   await connection.connect();
   var tmp1: null;

   return new Promise((resolve, reject) => {
     connection.query("select * from " + tablename, 
     (error,results, fields) => {
         resolve({error, results});
     })
 })
  }
  /*
  async getusers(problem: Partial<UsersEntity>): Promise<UsersEntity> {
    const { id } = problem;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    
    const user = await myDataSource.manager.findOneBy(UsersEntity, {
    id,
    })
    return user;
  }
  
  async getallusers(): Promise<ProL> {
    
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    const ue = await myDataSource.getRepository(UsersEntity).find()
    return {list:ue, count:ue.length};
  }
  */
}
/*
this.rep.createQueryBuilder('user')
      .innerJoinAndSelect('user.visits', 'visit')
      .innerJoinAndMap("user.history", PaymentHistory, 'history', 'visit.id = history.instanceId and history.type = 1')
      .where('user.id = :userId', { userId: id })
      .getOne();
      */