# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<div class="row row-centered body-text">
<h1>Select your Track</h1><br>
		<div class="col-sm-3 track col-centered ">
	      
	      <img class="card-img-top img-responsive center" src="https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150" alt="Card image cap">
	      <div class="card-block text-center">
	        <h4 class="card-title"><%= @track.first.name  %></h4>
	        <p class="card-text"><%= @track.first.description %></p>
	              <a href="#" class="btn btn-primary">Go somewhere</a>

	      </div>
		</div>
		<div class="col-sm-3 track col-centered ">
	      	<img class="card-img-top img-responsive center" src="https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150" alt="Card image cap">
			<div class="card-block text-center">
		        <h4 class="card-title">Card title</h4>
		        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
		              <a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
	    <div class="col-sm-3 track col-centered ">
			<img class="card-img-top img-responsive center" src="https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150" alt="Card image cap">
	      	<div class="card-block text-center">
		        <h4 class="card-title">Card title</h4>
		        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
		              <a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
</div>
