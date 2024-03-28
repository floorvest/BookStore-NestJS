import { Controller, Get, Request } from '@nestjs/common';
import { Paginate, PaginateQuery, Paginated } from 'nestjs-paginate';
import { Public } from 'src/auth/constants';
import { Book } from 'src/entity/book.entity';
import { BookService } from 'src/service/book.service';

@Controller('books')
export class BookController {
    constructor(private readonly bookService: BookService) { }

    @Get()
    @Public()
    getBooks(@Paginate() query: PaginateQuery): Promise<Paginated<Book>> {
        return this.bookService.getBooks(query);
    }


    /** 
     * helper for me to inject data, 
     * due to limited time i'm not have enough time
     * to create seeder and test it
     * */
    // @Get('/inject')
    // injectBooks() {
    //     return this.bookService.injectBooks();
    // }
}
