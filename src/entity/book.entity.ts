import { Column, Entity, JoinTable, ManyToMany, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Tag } from "./tag.entity";

@Entity({ name: 'books' })
export class Book {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    title: string;

    @Column()
    writer: string;

    @Column()
    coverImage: string;

    @Column()
    point: number;

    @ManyToMany(() => Tag)
    @JoinTable()
    tags: Tag[];

}