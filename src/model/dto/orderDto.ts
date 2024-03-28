import { IsNotEmpty } from "class-validator";

export class OrderDTO {

    @IsNotEmpty()
    bookId: number;
}