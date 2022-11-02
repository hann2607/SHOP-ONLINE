<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!-- tab3  -->
<div id="tab3" class="tab-pane fade in">
	<div class="row">
		<!-- Rating -->
		<div class="col-md-3">
			<div id="rating">
				<div class="rating-avg">
					<span>4.5</span>
					<div class="rating-stars">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-o"></i>
					</div>
				</div>
				<ul class="rating">
					<li>
						<div class="rating-stars">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="rating-progress">
							<div style="width: 80%;"></div>
						</div> <span class="sum">3</span>
					</li>
					<li>
						<div class="rating-stars">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<div class="rating-progress">
							<div style="width: 60%;"></div>
						</div> <span class="sum">2</span>
					</li>
					<li>
						<div class="rating-stars">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<div class="rating-progress">
							<div></div>
						</div> <span class="sum">0</span>
					</li>
					<li>
						<div class="rating-stars">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<div class="rating-progress">
							<div></div>
						</div> <span class="sum">0</span>
					</li>
					<li>
						<div class="rating-stars">
							<i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<div class="rating-progress">
							<div></div>
						</div> <span class="sum">0</span>
					</li>
				</ul>
			</div>
		</div>
		<!-- /Rating -->

		<!-- Reviews -->
		<div class="col-md-6">
			<div id="reviews">
				<ul class="reviews">
					<li>
						<div class="review-heading">
							<h5 class="name">Hân</h5>
							<p class="date">22 09 2022, 8:00 PM</p>
							<div class="review-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o empty"></i>
							</div>
						</div>
						<div class="review-body">
							<p>Sản phẩm còn không shop?</p>
						</div>
					</li>
					<li>
						<div class="review-heading">
							<h5 class="name">Hân</h5>
							<p class="date">22 09 2022, 8:00 PM</p>
							<div class="review-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o empty"></i>
							</div>
						</div>
						<div class="review-body">
							<p>Sản phẩm rất tuyệt vời!</p>
						</div>
					</li>
					<li>
						<div class="review-heading">
							<h5 class="name">Hân</h5>
							<p class="date">22 09 2022, 8:00 PM</p>
							<div class="review-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o empty"></i>
							</div>
						</div>
						<div class="review-body">
							<p>Mình cần tư vấn. Mong shop liên hệ mình!</p>
						</div>
					</li>
				</ul>
				<ul class="reviews-pagination">
					<li class="active">1</li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
		</div>
		<!-- /Reviews -->

		<!-- Review Form -->
		<div class="col-md-3">
			<div id="review-form">
				<form class="review-form">
					<input class="input" type="text" placeholder="Nhập tên"> <input
						class="input" type="email" placeholder="Nhập Email">
					<textarea class="input" placeholder="Đánh giá của bạn"></textarea>
					<div class="input-rating">
						<span>ĐÁNH GIÁ: </span>
						<div class="stars">
							<input id="star5" name="rating" value="5" type="radio"><label
								for="star5"></label> <input id="star4" name="rating" value="4"
								type="radio"><label for="star4"></label> <input
								id="star3" name="rating" value="3" type="radio"><label
								for="star3"></label> <input id="star2" name="rating" value="2"
								type="radio"><label for="star2"></label> <input
								id="star1" name="rating" value="1" type="radio"><label
								for="star1"></label>
						</div>
					</div>
					<button class="primary-btn">ĐĂNG</button>
				</form>
			</div>
		</div>
		<!-- /Review Form -->
	</div>
</div>
<!-- /tab3  -->