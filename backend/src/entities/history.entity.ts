
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("history")
export class HisEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column("text")
    text:string;

    @Column()
    belong:number

    @Column({type: 'timestamp', default: () => "CURRENT_TIMESTAMP"}) 
    time: Date
}
