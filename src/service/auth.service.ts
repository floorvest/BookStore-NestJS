import { Injectable, UnauthorizedException } from "@nestjs/common";
import { UserService } from "./user.service";
import { JwtService } from "@nestjs/jwt";
import { AuthResponse } from "src/model/response/auth.response";
import { AuthDto } from "src/model/dto/authDto";

@Injectable()
export class AuthService {

    constructor(
        private userService: UserService,
        private jwtService: JwtService
    ) { }

    async signIn(authDto: AuthDto): Promise<AuthResponse> {
        const user = await this.userService.findOne(authDto.email)
        if (user?.password !== authDto.password) {
            throw new UnauthorizedException()
        }

        const payload = { id: user.id, email: user.email, name: user.name, point: user.point, }
        return new AuthResponse(await this.jwtService.signAsync(payload))
    }
}