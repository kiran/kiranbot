$(document).ready(function() {
    var $btns = $('.btn').click(function() {
	if (this.id == 'clear') {
	  	var allBooks = $('#books-list > article');
	    $('#count').html(allBooks.length);
	  	allBooks.fadeIn(450);
	  } else {
	    var $el = $('.' + this.id).fadeIn(450);
	    var books = $('#books-list > article').not($el);
	    books.hide();
	    $('#count').html(57 - books.length);
	  }
	  $btns.removeClass('active');
	  $(this).addClass('active');
	});
});
