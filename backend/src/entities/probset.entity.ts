
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("probset")
export class ProbsetEntity {
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
}
