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
    if(!obj1 && obj2) return {error:1, message: "答案不同"}
    if(!obj1 && !obj2) return {error:0, message:"回答正确"}
    if(!obj2 || !obj1) return {error:1, message:"表不存在"}
    if(obj1.length != obj2.length){
      if(obj1.length > obj2.length )return  {error:1, message:"行数缺少" + (obj1.length - obj2.length) + "行"};
      else return  {error:1, message:"行数多了" + (obj2.length - obj1.length ) + "行"};
    } 
    const keys1 = Object.keys(obj1[0]);
    const keys2 = Object.keys(obj2[0]);
    if (JSON.stringify(keys1) !== JSON.stringify(keys1)) {
      return {error:1, message:"列信息不同"};
    }
    console.log(keys1, keys2)
    if(JSON.stringify(obj1) !== JSON.stringify(obj2)) return {error:1, message: "答案不同"}
    return {error:0, message:"回答正确"};
    return  {error:JSON.stringify(obj1) == JSON.stringify(obj2)};
    var cnt = 0;
    for (let i = 0; i < keys1.length; i++) {
      const key = keys1[i];
      if (obj1[key] != obj2[key]) {
        cnt++;
      }
    }
    if(cnt > 0) return {error:1, message:"与答案有" + cnt + "行不同"};
    return {error:0, message:"回答正确"};
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
     
    await connection.connect();
    var tmp1: null;

    return new Promise((resolve, reject) => {
      connection.query(sql, 
      (error,results, fields) => { 
       
          resolve({error, results, fields});
      });
      connection.end();
  })
/*
   connection.query(sql, function (error, results, fields) {
      if (error) {
        
        console.log(error);
        tmp1 = error;
          console.log(error);
      } 
        console.log('The solution is: ', results);
    });
    await connection.end();
    
    if(tmp1) return {error:1, message:tmp1};
    else return {error: 0 , message: 'This action adds a new submit'};*/
  }

  async gett(sql, connection)
  {
    return new Promise((resolve, reject) => {
      connection.query(sql,function(error, results, fields) {
        console.log(sql);
        resolve(results);
      });
      connection.end();
    })
  }

  async check(a: CreateSubmitDto){
    const name = a.name;
    const pid = a.proidnumber;
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
        problem: pid,
      }
   })


   const problemnow = await myDataSource.getRepository(ProblemEntity).findOne({
    where:{
      id: pid,
    }
 })
 
 const problemsetnow = await myDataSource.getRepository(ProbsetEntity).findOne({
  where:{
    pid: problemnow.id,
    rid: now.type
  }
})

  const sb = problemnow.becomp;
  const se = problemnow.tocomp;
  const nid = now.nid;














  var mysql      = require('mysql');
  var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '7788iiuu',
    database : 'main1'
  });
   
  await connection.connect();
  var tmp1: null;
  var tmp2: null;


  
    
  const p =  await this.gett("select *  from `" + se + "`;", connection);
 
  console.log(nid);
    var connection2 = mysql.createConnection({
      host     : 'localhost',
      user     : 'root',
      password : '7788iiuu',
      database : nid
    });

 await connection2.connect();

  const q = await this.gett("select * from `" + sb + "`;", connection2)
  const t = this.Equal(p,q);

    if(t.error){
      await myDataSource
      .createQueryBuilder()
      .update(StateEntity)
      .set({ myscore: 0, type: 1 })
      .where("id = :id", { id: now1.id })
      .execute()
    }
    else{
      await myDataSource
      .createQueryBuilder()
      .update(StateEntity)
      .set({ myscore: problemsetnow.score, type: 2 })
      .where("id = :id", { id: now1.id })
      .execute()
    }
    return this.Equal(p,q);
  }
}
