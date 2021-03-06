package info.andrewwilliams.libraryapp.service;

import java.util.List;

import info.andrewwilliams.libraryapp.entity.Book;

public interface BookService {
	
	public List<Book> getBooks();

	public void saveBook(Book book);

	public Book getBook(int id);

	public void deleteBook(int id);

	public List<Book> searchBooks(String searchContents);
	
}
