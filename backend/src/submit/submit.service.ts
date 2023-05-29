import { Injectable } from '@nestjs/common';
import { CreateSubmitDto } from './dto/create-submit.dto';
import { UpdateSubmitDto } from './dto/update-submit.dto';
import { UsersEntity } from 'src/entities/users.entity';
import { HisEntity } from 'src/entities/history.entity';
import { PermissionEntity } from 'src/entities/permission.entity';
import { ProblemEntity } from 'src/entities/problem.entity';
import { ProbsetEntity } from 'src/entities/probset.entity';
import { RolesEntity } from 'src/entities/roles.entity';
import { StateEntity } from 'src/entities/state.entity';
import { DataSource } from 'typeorm';

@Injectable()
export class SubmitService {

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
 
  Equal(obj1, obj2) {
    const keys1 = Object.keys(obj1);
    const keys2 = Object.keys(obj2);
    if (keys1.length !== keys2.length) {
      return {error:1, message:"与答案相差" + (keys2.length - keys1.length) + "行"};
    }
    var cnt = 0;
    for (let i = 0; i < keys1.length; i++) {
      const key = keys1[i];
      if (obj1[key] !== obj2[key]) {
        return false;
      }
    }
    return true;
  }
  compare(database1:string, database2:string, table1:string, table2:string)
  {
  }

  async submit(a: CreateSubmitDto) {
    const sql = a.sql;
    const name = a.name;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
   
    const now = await myDataSource.getRepository(UsersEntity).findOne({
      where:{
        name: name,
      }
   })
   const id = now.id;

   const b = new HisEntity();
   b.belong = id;
   b.text = sql;
   myDataSource.getRepository(HisEntity).save(b);
   
    var mysql      = require('mysql');
    var connection = mysql.createConnection({
      host     : 'localhost',
      user     : 'root',
      password : '7788iiuu',
      database : now.nid
    });
     
    connection.connect();
    
    connection.query(sql, function (error, results, fields) {
      if (error) return {error1: 1, massage:error};
      console.log('The solution is: ', results);
    });
    connection.end();
    return 'This action adds a new submit';
  }

  async check(a: CreateSubmitDto){
    const name = a.name;
    const id = a.proidnumber;
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();

    const now = await myDataSource.getRepository(UsersEntity).findOne({
      where:{
        name: name,
      }
   })
   const id1 = now.id;

    const now1 = await myDataSource.getRepository(StateEntity).findOne({
      where:{
        user: id1,
        problem: id,
      }
   })


  

  }
}
