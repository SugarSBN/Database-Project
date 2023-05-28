
import { Column, Entity, PrimaryGeneratedColumn ,OneToOne, JoinColumn} from "typeorm";
import { RolesEntity } from "./roles.entity";
@Entity("problem")
export class ProblemEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column()
    name: string;


    @Column()
    title: string;

    @Column('text')
    text: string;

    @Column()
    tocomp: string;
}
