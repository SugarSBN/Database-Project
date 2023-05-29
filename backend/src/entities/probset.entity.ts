
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("probset")
export class ProbsetEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column()
    rid: number;


    @Column()
    pid:number;
    @Column({type: 'timestamp', default: () => "CURRENT_TIMESTAMP"}) 
    btime: Date;

    @Column({type: 'timestamp', default: "2024-10-10 12:00:00"})
    etime: Date;

    @Column()
    score: number;
}
