import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({
    name: 'book_tags'
})
export class Tag {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;
}