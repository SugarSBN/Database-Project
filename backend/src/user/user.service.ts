import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { DataSource, LessThan} from "typeorm"
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
  message: string
}

@Injectable()
export class UserService {

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

  async build(name:string, password:string, roles:number, nid:string)
  {
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    await myDataSource
    .createQueryBuilder()
    .insert()
    .into(UsersEntity)
    .values([
        { name: name, password: password, type: roles , nid: nid},
    ])
    .execute()

    const now = await myDataSource.getRepository(UsersEntity).findOne({
      where:{
        name: name,
      }
   })

   const s = "u" + now.id;

    const t1 = await myDataSource
    .createQueryBuilder()
    .update(UsersEntity)
    .set(
        {
          nid : s,
        }
    )
    .where("name = :name", {name:name})
    .execute();

    var mysql      = require('mysql');
    var connection = mysql.createConnection({
      host     : 'localhost',
      user     : 'root',
      password : '7788iiuu'
    });
     
    connection.connect();
     
    const s1 = "create database " + s + ";";

    connection.query(s1, function (error, results, fields) {
      if (error) throw error;
      console.log('The solution is: ', results);
    });

    const s2 = "CREATE USER '" + s + "'@'host' IDENTIFIED WITH mysql_native_password BY '7788iiuu';";
    const sname = "'" + s + "'@'host'";
    
    connection.query(s2, function (error, results, fields) {
      if (error) throw error;
      console.log('The solution is: ', results);
    });

    connection.query("create table " + s + ".`pub.teacher` select * from main1.`pub.teacher`;", function (error, results, fields) {
      if (error) throw error;
      console.log('The solution is: ', results);
    });


    connection.query("create table " + s + ".`pub.teacher_course` select* from main1.`pub.teacher_course`;", function (error, results, fields) {
      if (error) throw error;
      console.log('The solution is: ', results);
    });


    const sp = await myDataSource.getRepository(ProbsetEntity).find({
      where:{
        rid: roles,
      }
    }
    )
    
     for (var i = 0; i < sp.length; i++) { 
      const tmp = new StateEntity();
      tmp.myscore = 0;
      tmp.problem = sp[i].pid;
      tmp.finishtime = sp[i].etime;
      tmp.user = now.id;
      await myDataSource.manager.save(tmp);
    }

    connection.end();
  }


  async login(user: Partial<UsersEntity>): Promise<ProL> {
    const { name } = user;
    const {password} = user;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();

    const now = await myDataSource.getRepository(UsersEntity).findOne({
      where:{
        name: name,
      }
   })

   if(!now){
      return {list:null, count:0,error: 1,message:"用户不存在"};
   }
   if(now.password != password)
   {
       return {list:null, count:0,error: 2,message:"密码错误"};
   }
   if(now.id == 1){
    
   return {list:null, count:0,error: 0,message:"超级瞄准已部署"};
   }
  // return {list:ue, count:ue.length}
   return {list:null, count:0,error: 0,message:"登录成功"};
}
async register(user: Partial<UsersEntity>): Promise<ProL> {
  const { name } = user;
  const {password} = user;
  const myDataSource = this.buildDS();
  if (myDataSource.isInitialized === false)
  await myDataSource.initialize();

  const now = await myDataSource.getRepository(UsersEntity).findOne({
    where:{
      name: name,
    }
 })

 if(now){
    return {list:null, count:0,error: 1,message:"用户已存在"};
 }
 this.build(name, password,1,"u1");
// return {list:ue, count:ue.length}

const now1 = await myDataSource.getRepository(UsersEntity).findOne({
  where:{
    name: name,
  }
})

 return {list:now1, count:1,error: 0,message:"注册成功"};
}


async logout(user: Partial<UsersEntity>): Promise<ProL> {
  const { name } = user;
  const myDataSource = this.buildDS();
  if (myDataSource.isInitialized === false)
  await myDataSource.initialize();

  const now = await myDataSource.getRepository(UsersEntity).findOne({
    where:{
      name: name,
    }
 })

 if(!now){
    return {list:null, count:0,error: 1,message:"用户不存在"};
 }
// return {list:ue, count:ue.length}
 return {list:null, count:0,error: 0,message:"登出成功"};
}

}
/*
this.rep.createQueryBuilder('user')
      .innerJoinAndSelect('user.visits', 'visit')
      .innerJoinAndMap("user.history", PaymentHistory, 'history', 'visit.id = history.instanceId and history.type = 1')
      .where('user.id = :userId', { userId: id })
      .getOne();
      */