
import { Column, Entity, PrimaryGeneratedColumn ,OneToOne, JoinColumn} from "typeorm";
import { RolesEntity } from "./roles.entity";
@Entity("problem")
export class ProblemEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column({ length:50 })
    name: string;
}
