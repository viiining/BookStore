# BookStore

## Practice CRUD with Ruby on Rails

### Configuration

- 書名 bookname: string -> validates :bookname, presence: true
- 摘要 description: text
- 頁數 page: Integer -> validates :page, presence: true, numericality: { greater_than: 0 }
- 價錢 price: Integer -> validates :price, presence: true, numericality: { greater_than: 0 }
