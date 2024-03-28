import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { User } from "src/entity/user.entity";
import { UserRegisterDto } from "src/model/dto/userRegisterDto";
import { Repository } from "typeorm";

@Injectable()
export class UserService {

    constructor(
        @InjectRepository(User)
        private readonly userRepository: Repository<User>
    ) { }

    async findOneById(id): Promise<User> {
        return this.userRepository.findOneBy({
            id
        })
    }

    async findOne(email): Promise<User> {
        return this.userRepository.findOneBy({
            email
        })
    }

    async deductPoint(user: User, point) {
        user.point -= point;
        this.userRepository.save(user)
    }

    async register(userRegisterDto: UserRegisterDto): Promise<User> {

        const checkUniqueEmail = await this.userRepository.findOneBy({
            email: userRegisterDto.email
        })

        if (checkUniqueEmail) {
            throw new HttpException('Email already registered', HttpStatus.BAD_REQUEST)
        }

        const user = this.userRepository.create();
        user.name = userRegisterDto.name
        user.email = userRegisterDto.email
        user.password = userRegisterDto.password
        user.point = 100
        user.registeredAt = new Date()

        await this.userRepository.save(user)

        return user;
    }
}