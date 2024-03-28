import { Body, Controller, Post } from "@nestjs/common";
import { Public } from "src/auth/constants";
import { AuthDto } from "src/model/dto/authDto";
import { AuthResponse } from "src/model/response/auth.response";
import { AuthService } from "src/service/auth.service";

@Controller('auth')
export default class AuthController {

    constructor(
        private authService: AuthService
    ) { }


    @Post('login')
    @Public()
    async login(@Body() authDto: AuthDto): Promise<AuthResponse> {
        return this.authService.signIn(authDto)
    }

}