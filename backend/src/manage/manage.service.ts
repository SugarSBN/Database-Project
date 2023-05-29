import { Injectable } from '@nestjs/common';
import { CreateManageDto } from './dto/create-manage.dto';
import { UpdateManageDto } from './dto/update-manage.dto';
import { InfoModule } from 'src/info/info.module';
import { InfoService } from 'src/info/info.service';
import { InfoController } from 'src/info/info.controller';
import { Column, DataSource, Entity, PrimaryColumn } from 'typeorm';
import { ProblemEntity } from 'src/entities/problem.entity';
import { HisEntity } from 'src/entities/history.entity';
import { PermissionEntity } from 'src/entities/permission.entity';
import { ProbsetEntity } from 'src/entities/probset.entity';
import { RolesEntity } from 'src/entities/roles.entity';
import { StateEntity } from 'src/entities/state.entity';
import { UsersEntity } from 'src/entities/users.entity';

export function createEntity(tableName: string) {
  @Entity({name: tableName})
  class EntityClass {
      public static tableName = tableName;

      @PrimaryColumn()
      public name: string = "";

      @Column()
      public value: number = 0;
  }

  return EntityClass;
}

@Injectable()
export class ManageService {
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

  async addroles(type, name){
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    const a = new RolesEntity();
    a.type = type;
    a.name = name;
    await myDataSource.manager.save(a);
  }


  async addproblem(name, text, title, tocomp, becomp)
  {
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    const c = new ProblemEntity();
    c.name = name;
    c.text = text;
    c.title = title;
    c.tocomp = tocomp;
    c.becomp = becomp;
    await myDataSource.manager.save(c);
  }

  async init(createManageDto: CreateManageDto) {
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();

    const a = new RolesEntity();
    a.type = 1;
    a.name = "student1";
    await myDataSource.manager.save(a);

    const b = new RolesEntity();
    b.type = 2;
    b.name = "student2";
    await myDataSource.manager.save(b);

    const c = new ProblemEntity();
    c.name = "题目1";
    c.text = "创建学生信息表（学生编号、姓名、性别、年龄、出生日期、院系名称、班级）：test1_student：sid char 12 not null、name varchar 10 not null、sex char 2、age int birthday date、dname varchar 30、class varchar 10。\n 建表语句常见错误如下：\n关键词拼写错误，少关键词、少逗号、少括号。";
    c.title = "1-1";
    c.tocomp = "base1-1";
    c.becomp = "test1_student";
    await myDataSource.manager.save(c);

    await this.addproblem("题目二","1-2","创建课程信息表(仅考虑一门课程最多一个先行课的情况):\n课程编号、课程名称、先行课编号、学分\ntest1_course：cid char 6 not null、name varchar 40 not null、fcid char 6、\ncredit numeric\n4，1（其中4代表总长度，1代表小数点后面长度）。","base1-2", "test1_course");

    await this.addproblem("题目三", "1-5", "给表test1_course插入如下2行数据。\n注意空值的插入使用null\n课程号 课程名 先行课程号 学分\n300001 数据结构 2300002 数据库 300001 2.5", "base1-5", "test1_course")
    
    const d = new ProbsetEntity();
    d.rid = 1;
    d.score = 5;
    d.pid  = 1;
    await myDataSource.manager.save(d);

    const d1 = new ProbsetEntity();
    d1.rid = 1;
    d1.score = 5;
    d1.pid  = 2;
    await myDataSource.manager.save(d1);

    const d2 = new ProbsetEntity();
    d2.rid = 1;
    d2.score = 10;
    d2.pid  = 3;
    await myDataSource.manager.save(d2);

    const d3 = new ProbsetEntity();
    d3.rid = 2;
    d3.score = 5;
    d3.pid  = 1;
    await myDataSource.manager.save(d3);

    const d4 = new ProbsetEntity();
    d4.rid = 2;
    d4.score = 5;
    d4.pid  = 2;
    await myDataSource.manager.save(d4);

    

    return 'This action adds a new manage';

  }
}
