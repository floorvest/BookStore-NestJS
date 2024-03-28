import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { randomUUID } from "crypto";
import { Book } from "src/entity/book.entity";
import { Order } from "src/entity/order.entity";
import { User } from "src/entity/user.entity";
import { Repository } from "typeorm";
import { UserService } from "./user.service";
import { BookService } from "./book.service";
import { OrderDTO } from "src/model/dto/orderDto";

@Injectable()
export class OrderService {

    constructor(
        @InjectRepository(Order)
        private readonly orderRepository: Repository<Order>,
        private userService: UserService,
        private bookService: BookService
    ) { }

    async myOrders(user: User) {

        const userObject = await this.userService.findOneById(user.id)

        return this.orderRepository.find({
            // relations: ["book", 'user'],
            where: {
                user: userObject
            }
        })
    }

    async cancelOrder(order: Order): Promise<string> {
        await this.orderRepository.remove(order);

        return 'Order Removed';
    }

    async buy(user: User, orderDto: OrderDTO): Promise<Order> {

        const userObject = await this.userService.findOneById(user.id)

        const book = await this.bookService.findOne(orderDto.bookId);

        if (!book) {
            throw new HttpException('Book not found', HttpStatus.BAD_REQUEST);
        }

        if (userObject.point < book.point) {
            throw new HttpException('Point insufficient', HttpStatus.BAD_REQUEST);
        }

        console.log(userObject)

        const order = this.orderRepository.create()

        order.orderId = randomUUID();
        order.book = book
        order.user = userObject
        order.orderedAt = new Date()
        order.pointUsed = book.point

        await this.orderRepository.save(order)

        await this.userService.deductPoint(userObject, book.point)

        return order;
    }

}