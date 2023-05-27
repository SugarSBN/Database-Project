
import { Column, Entity, PrimaryGeneratedColumn ,OneToOne, JoinColumn} from "typeorm";
import { RolesEntity } from "./roles.entity";
@Entity("permission")
export class PermissionEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column({ length:50 })
    name: string;

    @Column({ length: 20})
    uid: string;

    @Column("text")
    password:string;

    @Column({default:''})
    email: string;

    @Column('tinyint')
    type:number

    @Column({type: 'timestamp', default: () => "CURRENT_TIMESTAMP"}) 
    btime: Date

    @Column({type: 'timestamp', default: () => "CURRENT_TIMESTAMP"})
    etime: Date

    @OneToOne(type => RolesEntity)
    
    @JoinColumn()
    role: RolesEntity;
}
