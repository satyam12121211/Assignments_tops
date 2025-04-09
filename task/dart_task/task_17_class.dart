class Book {
  String title;
  String author;
  int Year;

  Book(this.title, this.author, this.Year);

  void displayDetails() {
    print("Title: $title");
    print("Author: $author");
    print("Publication Year: $Year");
  }

  bool isOverTenYearsOld() {
    int currentYear = DateTime.now().year;
    return (currentYear - Year) > 10;
  }
}

void main() {
  Book book = Book("book_title", "Harsh", 2010);
  book.displayDetails();

  if (book.isOverTenYearsOld()) {
    print("This book is over 10 years old.");
  } else {
    print("This book is less than 10 years old.");
  }
}
