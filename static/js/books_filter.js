$(document).ready(function() {
    var $btns = $('.btn').click(function() {
  		$btns.removeClass('active');
		if (this.id == 'clear') {
		  	var allBooks = $('#books-list > article');
		    $('#count').html(allBooks.length);
		  	allBooks.fadeIn(450);
		  } else {
		    var $el = $('.' + this.id).fadeIn(450);
		    var books = $('#books-list > article').not($el);
		    books.hide();
		    $('#count').html(57 - books.length);
			$(this).addClass('active');
		  }
		});

    $('.book-txt').readmore({
    	speed: 150,
    	moreLink: '<a href="#" class="morelink">Read more</a>',
    	lessLink: '<a href="#" class="morelink">Close</a>'
    });
});
