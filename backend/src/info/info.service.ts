import { Injectable } from '@nestjs/common';
import { CreateInfoDto } from './dto/create-info.dto';
import { UpdateInfoDto } from './dto/update-info.dto';
import { DataSource, LessThan } from "typeorm"
import { StateEntity } from 'src/entities/state.entity';
import { UsersEntity } from 'src/entities/users.entity';
import { RolesEntity } from 'src/entities/roles.entity';
import { ProblemEntity } from 'src/entities/problem.entity';
import { PermissionEntity } from 'src/entities/permission.entity';
import { ProbsetEntity } from 'src/entities/probset.entity';
export interface ProL {
  list,
  count: number;
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
        StateEntity
      ],
      synchronize: true,
    })
    
    return myDataSource;
  }

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
    return {list:ue, count:ue.length};
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
  
  async getallstate(): Promise<ProL> {
    
    const myDataSource = this.buildDS();
    if (myDataSource.isInitialized === false)
    await myDataSource.initialize();
    const ue = await myDataSource.getRepository(StateEntity).find()
    return {list:ue, count:ue.length};
  }
  
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
}
