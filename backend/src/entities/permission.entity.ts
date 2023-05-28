
import { Column, Entity, PrimaryGeneratedColumn ,OneToOne, JoinColumn} from "typeorm";
import { RolesEntity } from "./roles.entity";
@Entity("permission")
export class PermissionEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column('tinyint')
    type:number
}
