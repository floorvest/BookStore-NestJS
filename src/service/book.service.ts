import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { FilterOperator, FilterSuffix, PaginateQuery, Paginated, paginate } from 'nestjs-paginate';
import { Book } from 'src/entity/book.entity';
import { Tag } from 'src/entity/tag.entity';
import { Repository } from 'typeorm';
const { faker } = require('@faker-js/faker');

@Injectable()
export class BookService {

    constructor(
        @InjectRepository(Book)
        private readonly bookRepository: Repository<Book>,
    ) { }

    async findOne(id): Promise<Book> {
        return await this.bookRepository.findOneBy({
            id
        })
    }

    getBooks(query: PaginateQuery): Promise<Paginated<Book>> {
        return paginate(query, this.bookRepository, {
            sortableColumns: ['id', 'title', 'writer', 'coverImage', 'point'],
            nullSort: 'last',
            defaultSortBy: [['id', 'DESC']],
            searchableColumns: ['title', 'writer'],
            select: ['id', 'title', 'writer', 'coverImage', 'point', 'tags.name', 'tags.id'],
            filterableColumns: {
                'tags.id': [FilterOperator.EQ, FilterOperator.IN]
            },
            relations: ['tags'],
        })
    }


    /** 
     * helper for me to inject data, 
     * due to limited time i'm not have enough time
     * to create seeder and test it
     * */
    // async injectBooks() {
    //     const allTags = await this.tagRepository.find();
    //     const lsit = Array(100).fill(0);

    //     for (const l in lsit) {
    //         const book = this.bookRepository.create()

    //         book.title = faker.commerce.productName()
    //         book.writer = `${faker.person.firstName()} ${faker.person.lastName()}`
    //         book.point = Math.floor(Math.random() * 100)
    //         book.coverImage = 'https://images-na.ssl-images-amazon.com/images/I/51Ga5GuElyL._AC_SX184_.jpg'

    //         let tags = [];

    //         Array(Math.floor(Math.random() * allTags.length)).fill(0).forEach((x) => {
    //             const index = Math.floor(Math.random() * allTags.length)
    //             tags.push(allTags[index])
    //         })

    //         const ids = tags.map(({ id }) => id);
    //         book.tags = tags.filter(({ id }, index) => !ids.includes(id, index + 1))
    //         await this.bookRepository.save(book)
    //     }

    //     return 'ok';
    // }
}
