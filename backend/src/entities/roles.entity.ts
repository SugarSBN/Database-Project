
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("roles")
export class RolesEntity {
    @PrimaryGeneratedColumn()
    id:number; 

    @Column({ length:50 })
    name: string;

    @Column('tinyint')
    type:number

}
