
import { Column, Entity, PrimaryGeneratedColumn ,OneToOne, JoinColumn} from "typeorm";
import { RolesEntity } from "./roles.entity";
@Entity("users")
export class UsersEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column({ length: 50, default: 'u2'})
    nid:string;

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
}
