package info.andrewwilliams.libraryapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import info.andrewwilliams.libraryapp.entity.Book;
import info.andrewwilliams.libraryapp.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {
	
	// Inject book service to handle transactions with database
	@Autowired
	private BookService bookService;
	
	// Retrieves list of all book objects in database,
	// stores list in model, and returns list page to display list
	@GetMapping("/list")
	public String listBooks(Model model) {
		
		List<Book> books = bookService.getBooks();
		
		model.addAttribute("books", books);
		
		return "list-books";
	}
	
	// Creates empty book object, stores in model,
	// and returns an add-book-form to populate book object
	@GetMapping("/add")
	public String addBook(Model model) {
		
		Book book = new Book();
		
		model.addAttribute("book", book);
		
		return "add-book-form";
		
	}
	
	
	// Retrieves book object stored in model from add-book-form
	// and uses book service to save in database
	@PostMapping("/save")
	public String saveBook(@ModelAttribute("book") Book book) {
		
		bookService.saveBook(book);
		
		return "redirect:/book/list";
		
	}
	
	// Retrieves book ID from parameter passed and retrieves 
	// corresponding book object from database and returns
	// add-book-form that is pre-populated with data from book to edit/save/update
	@GetMapping("/update")
	public String updateBook(@RequestParam("bookId") int id, Model model) {
		
		Book book = bookService.getBook(id);
		
		model.addAttribute("book", book);
		
		return "add-book-form";
	}
	
	// Retrieves book ID from parameter passed and uses ID
	// to remove book object from database
	@GetMapping("/delete")
	public String deleteBook(@RequestParam("bookId") int id) {
		
		bookService.deleteBook(id);
		
		return "redirect:/book/list";
	}
	
	// Retrieves search contents from parameter passed in search box
	// and retrieves list of book objects from database with matching
	// content as search content, stores list in model and sends to search results page
	@PostMapping("/search")
	public String searchBook(@RequestParam("searchContents") String searchContents, Model model) {
		
		List<Book> books = bookService.searchBooks(searchContents);
		
		model.addAttribute("books", books);
		
		return "search-results";
		
	}
	
	
}
