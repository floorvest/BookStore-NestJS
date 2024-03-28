import { Column, Entity, JoinColumn, ManyToOne, OneToMany, OneToOne, PrimaryGeneratedColumn } from "typeorm";
import { Book } from "./book.entity";
import { User } from "./user.entity";

@Entity('orders')
export class Order {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    orderId: string;

    @ManyToOne(() => Book, (book) => book.id, {
        cascade: true,
        eager: true
    })
    @JoinColumn()
    book: Book

    @ManyToOne(() => User, (user) => user.id, {
        cascade: true,
        // eager: true
    })
    @JoinColumn()
    user: User

    @Column()
    pointUsed: number;

    @Column({
        type: 'timestamp'
    })
    orderedAt: Date;
}