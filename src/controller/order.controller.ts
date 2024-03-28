import { Body, Controller, Get, Post, Request } from "@nestjs/common";
import { OrderDTO } from "src/model/dto/orderDto";
import { OrderService } from "src/service/order.service";

@Controller('order')
export default class OrderController {
    constructor(
        private orderService: OrderService
    ) { }

    @Post()
    async order(@Request() req, @Body() orderDto: OrderDTO) {
        return this.orderService.buy(req.user, orderDto);
    }

    @Get('mine')
    async myOrder(@Request() req) {
        return this.orderService.myOrders(req.user);
    }
}