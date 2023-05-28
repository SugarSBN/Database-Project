
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("state")
export class StateEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column()
    user:number

    @Column()
    problem:number;
    // 0 未完成 1 错误 2 完成 3 超时完成
    @Column({default:0})
    type:number

    @Column({default:0})
    myscore:number

    @Column({type: 'timestamp', default: () => "CURRENT_TIMESTAMP"}) 
    finishtime: Date
}
