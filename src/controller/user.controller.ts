
import { Body, Controller, Post } from "@nestjs/common";
import { Public } from "src/auth/constants";
import { User } from "src/entity/user.entity";
import { UserRegisterDto } from "src/model/dto/userRegisterDto";
import { UserService } from "src/service/user.service";

@Controller('user')
export default class UserControler {

    constructor(
        private userService: UserService
    ) { }

    @Public()
    @Post('/register')
    async register(@Body() userRegisterDto: UserRegisterDto): Promise<User> {
        return this.userService.register(userRegisterDto)
    }

}