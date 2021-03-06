<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Check out</title>
		
		<%@ include file="/WEB-INF/views/user/common/css.jsp" %>
		
		<style type="text/css">
			#discount {
				text-align: left;
				height: 40px !important;
				border-left: none !important;
				border-right: none !important;
				border-top: none !important;
			    color: #c49b63 !important;
			    padding: 0;
			   	background: transparent !important;
			   	font-size: 18px;
			    border-radius: 0px;
			    display: block;
			    width: 100%;
			}
		</style>
	</head>
	
	<body>
        <%@ include file="/WEB-INF/views/user/common/menu.jsp" %>
        
        <section class="home-slider owl-carousel">
        	<div class="slider-item" style="background-image: url(template/user/images/bg_3.jpg);">
        		<div class="overlay"></div>
        		<div class="container">
        			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
        				<div class="col-md-7 col-sm-12 text-center ftco-animate">
							<h1 class="mb-3 mt-5 bread">Thanh toán hóa đơn</h1>
							<p class="breadcrumbs">
								<span class="mr-2"><a href="<c:url value='/menu' />">Thực đơn</a></span>
								<span class="mr-2"><a href="<c:url value='/cart' />">Giỏ Hàng</a></span>
								<span>Thanh toán</span>
							</p>
						</div>
        			</div>
        		</div>
        	</div>
        </section>

		<section class="ftco-section">
			<div class="container">
				<form action="<c:url value='/order' />" id="orderSumbitFomr" >
					<div class="row">
						<div class="col-xl-8 ftco-animate">
							<div class="billing-form ftco-bg-dark p-3 p-md-5">
								<h3 class="mb-4 billing-heading">Thông tin giao hàng</h3>
								<div class="row align-items-end">
									<div class="col-md-12">
										<div class="form-group">
											<label>Họ và Tên</label>
											<input type="text" id="fullname" name="fullname" class="form-control" placeholder="Họ và Tên" 
													value="${CUSTOMER.fullname}">
											<small id="warningFullname" class="text-danger"></small>
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Địa chỉ giao hàng</label>
											<input type="text" id="address" name="address" class="form-control" placeholder="Địa chỉ" 
													value="${CUSTOMER.address}">
											<small id="warningAddress" class="text-danger"></small>
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Số điện thoại</label>
											<input type="number" id="phone" name="phone" class="form-control" placeholder="Số điện thoại"
													value="${CUSTOMER.phone}">
											<small id="warningPhone" class="text-danger"></small>
										</div>
									</div>
									<div class="w-100"></div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group">
											<label>E-mail</label>
											<input type="text" id="email" name="email" class="form-control" placeholder="Địa chỉ E-mail"
													value="${CUSTOMER.email}">
											<small id="warningEmail" class="text-danger"></small>
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Ghi chú</label>
											<textarea rows="3" name="note" class="form-control" placeholder="Ghi chú"></textarea>
										</div>
									</div>
									<div class="w-100"></div>
								</div>
								<input id="items" type="hidden" name="items" />
								<input id="subPrice" type="hidden" name="subPrice" />
								<input id="couponCode" type="hidden" name="coupon" />
								<input  id="c" type="hidden" name="c" />
							</div>
						</div> <!-- .col-md-8 -->
		
						<div class="col-xl-4 sidebar ftco-animate">
							<div class="col-md-12 d-flex">
								<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
									<h3>Đơn giá</h3>
									<p class="d-flex">
										<span>Tạm tính</span>
										<span id="subtotal"></span>
									</p>
									<p class="d-flex">
										<span>Giao hàng</span>
										<span  id="delivery" data-price="22000">22.000 đ</span>
									</p>
									<p class="d-flex">
										<span>Mã giảm giá</span>
										<span>
											<input id="discount" class="form-control" name='discount' placeholder="Mã Giảm Giá" />
											<span id="discountWarning" style="width: 100%;">
												<small class="text-danger"></small>
											</span>
										</span>
									</p>
									<p class="d-flex">
										<span>Discount</span>
										<span id="priceDiscount" data-price="0">0 đ</span>
									</p>
									<hr>
									<p class="d-flex total-price">
										<span>Tổng Cộng</span>
										<span id="t"></span>
									</p>
								</div>
							</div>
							<hr>
							<div class="col-md-12">
								<div class="cart-detail ftco-bg-dark p-3 p-md-4">
									<h3 class="billing-heading mb-4">Phương thức thanh toán</h3>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label>
													<input type="radio" checked="checked" name="payment" value="COD" class="mr-2"> 
													Trả bằng tiền mặt(COD)
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label>
													<input type="radio" name="payment" value="paypal" class="mr-2"> 
													Thanh toán bằng paypal
												</label>
											</div>
										</div>
									</div>
									<p><button id="submitButton" type="submit" class="btn btn-primary py-3 px-4">Đặt hàng</button></p>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>

        <%@ include file="/WEB-INF/views/user/common/footer.jsp" %>
        
        <%@ include file="/WEB-INF/views/user/common/js.jsp" %>
        <script type="text/javascript">
	        $(document).ready(function() {
	        	updatePrices();
	        	calculateSubtotal();
	        	renderBillItems();
	    		calculateTotal();
	    	});
        </script>
        <script type="text/javascript">
			function renderBillItems() {
				var items = JSON.parse(localStorage.getItem("items"));
				
				$('#items').val( JSON.stringify(items) );
				$('#subPrice').val( calculateSubtotal() );
			}
        </script>
       	<script type="text/javascript">
       		$('#orderSumbitFomr').on('submit', () => {
       			var fullname = $('#fullname').val();
       			var address = $('#address').val();
       			var phone = $('#phone').val();
       			var email = $('#email').val();
       			
       			var checkFullname = false;
       			var checkAddress = false;
       			var checkPhone = false;
       			var checkEmail = false;
       			
       			if (fullname.trim().length > 0) {
       				$('#warningFullname').html('');
       				checkFullname = true;
       			} else {
       				$('#warningFullname').html('Bạn chưa nhập HỌ VÀ TÊN');
       				checkFullname = false;
       			}
       			
       			if (address.trim().length > 0) {
       				$('#warningAddress').html('');
       				checkAddress = true;
       			} else {
       				$('#warningAddress').html('Bạn chưa nhập ĐỊA CHỈ GIAO HÀNG');
       				checkAddress = false;
       			}
       			
       			if (phone.trim().length > 0) {
       				$('#warningPhone').html('');
       				checkPhone = true;
       			} else {
       				$('#warningPhone').html('Bạn chưa nhập SỐ ĐIỆN THOẠI');
       				checkPhone = false;
       			}
       			
       			if (email.trim().length > 0) {
       				$('#warningEmail').html('');
       				checkEmail = true;
       			} else {
       				$('#warningEmail').html('Bạn chưa nhập ĐỊA CHỈ EMAIL');
       				checkEmail = false;
       			}
       			
       			if (checkEmail) {
					var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
					if (filter.test(email)) {
						$('#warningEmail').html('');
						checkEmail = true;
					} else {
						$('#warningEmail').html('E-MAIL không hợp lệ!');
						checkEmail = false;
					}
				}
       			
       			if (checkFullname && checkAddress && checkPhone && checkEmail) {
       				localStorage.removeItem("items");
       				
       				return true;
       			} else {
	       			return false;
       			}
       		});
       	</script>
	</body>
</html>