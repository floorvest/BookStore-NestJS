import { Controller, Get } from "@nestjs/common";
import { Public } from "src/auth/constants";
import { Tag } from "src/entity/tag.entity";
import { TagService } from "src/service/tag.service";

@Controller('tag')
export default class TagController {


    constructor(
        private tagService: TagService
    ) { }

    @Get()
    @Public()
    async getTags(): Promise<Array<Tag>> {
        return this.tagService.getAll();
    }

}