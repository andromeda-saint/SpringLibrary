package info.andrewwilliams.libraryapp.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.andrewwilliams.libraryapp.entity.Book;

@Repository
public class BookDAOImpl implements BookDAO{

	// Inject session factory bean to satisfy dependency
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Book> getBooks() {
		
		// Retrive a list of all book objects from database and return list

		Session session = sessionFactory.getCurrentSession();
		
		List<Book> books = session.createQuery("from Book").getResultList();
		
		return books;
	}

	@Override
	public void saveBook(Book book) {
		
		// Save book object to database using book object provided
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(book);;
		
	}

	@Override
	public Book getBook(int id) {
		
		// Retrieve book object from database using id and return book object
		
		Session session = sessionFactory.getCurrentSession();
		
		Book book = session.get(Book.class, id);
		
		return book;
	}

	@Override
	public void deleteBook(int id) {
		
		// Retrive book object from database using id and delete from database
		
		Session session = sessionFactory.getCurrentSession();
		
		Book book = session.get(Book.class, id);
		
		session.delete(book);
	}

	@Override
	public List<Book> searchBooks(String searchContents) {

		Session session = sessionFactory.getCurrentSession();
		
		// If search contents are not null or empty whitespace then return
		// list of book objects with data that includes search contents
		
		if(searchContents != null && searchContents.trim().length() > 0) {
			Query query = session.createQuery("from Book where lower(title) like :keyword or lower(author) like :keyword " +
											  "or lower(publisher) like :keyword or isbn like :keyword " +
											  "or lower(genre) like :keyword or cast(year as java.lang.String) like :keyword", Book.class);
			
	        query.setParameter("keyword", "%" + searchContents.toLowerCase() + "%");
	        
	        List<Book> books = query.getResultList();
			
			return books;
		}
		else {
			
			// If search contents do not match any data in book object then return null/empty list 
			
			return null;
		}
	}
	

}
