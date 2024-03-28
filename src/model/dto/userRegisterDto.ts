import { IsEmail, IsNotEmpty } from "class-validator";

export class UserRegisterDto {

    @IsNotEmpty()
    @IsEmail()
    email: string;

    @IsNotEmpty()
    name: string;

    @IsNotEmpty()
    password: string;
}