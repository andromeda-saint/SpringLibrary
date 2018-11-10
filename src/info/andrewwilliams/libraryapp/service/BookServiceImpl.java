package info.andrewwilliams.libraryapp.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import info.andrewwilliams.libraryapp.dao.BookDAO;
import info.andrewwilliams.libraryapp.entity.Book;

@Service
public class BookServiceImpl implements BookService {
	
	// Inject bookDAO object to satisfy dependency
	@Autowired
	private BookDAO bookDAO;
	
	@Override
	@Transactional
	public List<Book> getBooks() {

		return bookDAO.getBooks();
	}

	@Override
	@Transactional
	public void saveBook(Book book) {
		
		bookDAO.saveBook(book);
	}

	@Override
	@Transactional
	public Book getBook(int id) {

		return bookDAO.getBook(id);
	}

	@Override
	@Transactional
	public void deleteBook(int id) {

		bookDAO.deleteBook(id);
	}

	@Override
	@Transactional
	public List<Book> searchBooks(String searchContents) {

		return bookDAO.searchBooks(searchContents);
	}

}
