<%@page import="com.Model.Specification"%>
<%@page import="com.Model.Product"%>
<%@page import="com.oracle.wls.shaded.org.apache.bcel.generic.RETURN"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page
	import="jakarta.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- Form controls -->
<form action="admin/WarehouseServlet" method="post"
	enctype="multipart/form-data">
	<input type="text" class="form-control hidden" name="productid"
		value="${product.productid }"> <input type="date"
		class="form-control hidden" name="date"
		value="${product.date != null ? product.date : ''}">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="name">TÊN SẢN PHẨM</label> <input type="text"
							class="form-control" id="modal-form-name"
							placeholder="Laptop Bravo 15" name="name"
							value="${product.name }">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="theloai">LOẠI SẢN PHẨM</label> <select
							class="form-control" id="modal-form-category" name="category">
							<option value="LAPTOP"
								${product.category.equalsIgnoreCase('LAPTOP') ? 'selected="selected"' : ''}>LAPTOP</option>
							<option value="PC"
								${product.category.equalsIgnoreCase('PC') ? 'selected="selected"' : ''}>PC</option>
							<option value="MÁY TÍNH"
								${product.category.equalsIgnoreCase('MÁY TÍNH') ? 'selected="selected"' : ''}>MÁY
								TÍNH</option>
							<option value="KHÁC"
								${product.category.equalsIgnoreCase('KHÁC') ? 'selected="selected"' : ''}>KHÁC</option>
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="custom-file mb-3">
						<label class="custom-file-label" for="imageMain">CHỌN
							POSTER SẢN PHẨM</label> <input type="file" class="custom-file-input"
							id="imageMain" name="imageMain">
					</div>
				</div>
				<div class="col-md-4">
					<div class="custom-file mb-3">
						<label class="custom-file-label" for="images">CHỌN 4 TẤM
							HÌNH SẢN PHẨM</label> <input type="file" class="custom-file-input"
							id="images" name="images" multiple="multiple">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="name">MÃ VIDEO YOUTUBE</label> <input type="text"
							class="form-control" id="modal-form-video"
							placeholder="2ck_7vq601A" name="video"
							value="${product.video }">
					</div>
				</div>
			</div>

			<div class="row" style="margin-top: 1%;">
				<div class="col-md-6">
					<div class="form-group">
						<label for="oldprice">GIÁ CŨ</label> <input type="number"
							class="form-control" placeholder="19999000"
							id="modal-form-oldprice" name="oldprice"
							value="${product.oldprice }">
					</div>

				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="price">GIÁ MỚI</label> <input type="number"
							class="form-control" placeholder="17999000" id="modal-form-price"
							name="price" value="${product.price }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="quantity">SỐ LƯỢNG</label> <input type="number"
							class="form-control" id="modal-form-quantity" placeholder="10"
							name="quantity" value="${product.quantity }">
					</div>

				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="status">TÌNH TRẠNG</label> <select
							class="form-control" id="modal-form-status" name="status">
							<option value="true"
								${product.status == true? 'selected="selected"' : '' }>CÒN
								HÀNG</option>
							<option value="false"
								${product.status == false? 'selected="selected"' : '' }>HẾT
								HÀNG</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="company">HÃNG SẢN XUẤT</label> <select
							class="form-control" id="modal-form-company" name="company">
							<option value="MSI"
								${product.company.equalsIgnoreCase('MSI') ? 'selected="selected"' : ''}>MSI</option>
							<option value="DELL"
								${product.company.equalsIgnoreCase('DELL') ? 'selected="selected"' : ''}>DELL</option>
							<option value="HP"
								${product.company.equalsIgnoreCase('HP') ? 'selected="selected"' : ''}>HP</option>
							<option value="ASUS"
								${product.company.equalsIgnoreCase('ASUS') ? 'selected="selected"' : ''}>ASUS</option>
							<option value="LENOVO"
								${product.company.equalsIgnoreCase('LENOVO') ? 'selected="selected"' : ''}>LENOVO</option>
							<option value="ACER"
								${product.company.equalsIgnoreCase('ACER') ? 'selected="selected"' : ''}>ACER</option>
							<option value="RAZER"
								${product.company.equalsIgnoreCase('RAZER') ? 'selected="selected"' : ''}>RAZER</option>
							<option value="SAMSUNG"
								${product.company.equalsIgnoreCase('SAMSUNG') ? 'selected="selected"' : ''}>SAMSUNG</option>
							<option value="LG"
								${product.company.equalsIgnoreCase('LG') ? 'selected="selected"' : ''}>LG</option>
							<option value="MICROSOFT"
								${product.company.equalsIgnoreCase('MICROSOFT') ? 'selected="selected"' : ''}>MICROSOFT</option>
							<option value="GIGABYTE"
								${product.company.equalsIgnoreCase('GIGABYTE') ? 'selected="selected"' : ''}>GIGABYTE</option>
							<option value="KHÁC"
								${product.company.equalsIgnoreCase('KHÁC') ? 'selected="selected"' : ''}>KHÁC</option>
						</select>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label for="sale">SALE(đơn vị %)</label> <input type="number"
							class="form-control" id="modal-form-sale" placeholder="10"
							name="sale" value="${product.sale }">
					</div>
				</div>
			</div>


			<label>MÀU SẮC</label>
			<div class="form-group">
				<div class="checkbox-inline">
					<input class="form-check-input" type="checkbox" id="den"
						value="ĐEN" name="color"
						${product.color.equalsIgnoreCase('ĐEN') ? 'checked' : ''}>
					<label class="form-check-label" for="mauden">ĐEN</label>
				</div>
				<div class="checkbox-inline">
					<input class="form-check-input" type="checkbox" id="xanhduong"
						value="XANH DƯƠNG" name="color"
						${product.color.equalsIgnoreCase('XANH DƯƠNG') ? 'checked' : ''}>
					<label class="form-check-label" for="xanhduong">XANH DƯƠNG</label>
				</div>
				<div class="checkbox-inline">
					<input class="form-check-input" type="checkbox" id="xam"
						value="XÁM" name="color"
						${product.color.equalsIgnoreCase('XÁM') ? 'checked' : ''}>
					<label class="form-check-label" for="xam">XÁM</label>
				</div>
				<div class="checkbox-inline">
					<input class="form-check-input" type="checkbox" id="trang"
						value="TRẮNG" name="color"
						${product.color.equalsIgnoreCase('TRẮNG') ? 'checked' : ''}>
					<label class="form-check-label" for="trang">TRẮNG</label>
				</div>
				<div class="checkbox-inline">
					<input class="form-check-input" type="checkbox" id="do" value="ĐỎ"
						name="color"
						${product.color.equalsIgnoreCase('ĐỎ') ? 'checked' : ''}>
					<label class="form-check-label" for="do">ĐỎ</label>
				</div>
				<div class="checkbox-inline">
					<input class="form-check-input" type="checkbox" id="khac"
						value="KHÁC" name="color"
						${product.category.equalsIgnoreCase('KHÁC') ? 'checked' : ''}>
					<label class="form-check-label" for="khac">KHÁC</label>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="cpu">CPU</label> <input type="text"
							class="form-control" id="modal-form-cpu"
							placeholder="AMD Ryzen 5 5600H" name="cpu"
							value="${specification.cpu }">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="graphicsCard">CARD ĐỒ HỌA</label> <input type="text"
							class="form-control" id="modal-form-graphicsCard"
							placeholder="Radeon RX5500M 4GB" name="graphicsCard"
							value="${specification.graphicsCard }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="ram">RAM</label> <input type="text"
							class="form-control" id="modal-form-ram"
							placeholder="DDR4 8GB (1 x 8GB) 3200MHz, lên đến 32GB, 2 khe cắm"
							name="ram" value="${specification.ram }">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="hardDrive">Ổ CỨNG</label> <input type="text"
							class="form-control" id="modal-form-hardDrive"
							placeholder="512GB SSD NVMe M.2 PCIe Gen 3 x 4" name="hardDrive"
							value="${specification.hardDrive }">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="screen">MÀN HÌNH</label> <input type="text"
							class="form-control" id="modal-form-screen"
							placeholder="15.6 inches 1920 x 1080 pixels (FullHD)"
							name="screen" value="${specification.screen }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="gateway">CỔNG KẾT NỐI</label> <input type="text"
							class="form-control" id="modal-form-gateway"
							placeholder="1x HDMI (4K @ 30Hz), 1x RJ45, 1x Type-C USB3.2 Gen1, 3x Type-A USB3.2 Gen1"
							name="gateway" value="${specification.gateway }">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="win">HỆ ĐIỀU HÀNH</label> <input type="text"
							class="form-control" id="modal-form-win"
							placeholder="Windows 11 Home 64bit" name="win"
							value="${specification.win }">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="pin">PIN</label> <input type="text"
							class="form-control" id="modal-form-pin"
							placeholder="3 Cell, 53.5Whr" name="pin"
							value="${specification.pin }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="weight">TRỌNG LƯỢNG</label> <input type="text"
							class="form-control" id="modal-form-weight" placeholder="2.35 kg"
							name="weight" value="${specification.weight }">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="bluetooth">BLUETOOTH</label> <input type="text"
							class="form-control" id="modal-form-bluetooth"
							placeholder="Bluetooth 5.1" name="bluetooth"
							value="${specification.bluetooth }">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="network">MẠNG</label> <input type="text"
							class="form-control" id="modal-form-network"
							placeholder="802.11 ax Wi-Fi 6" name="network"
							value="${specification.network }">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="describe">MÔ TẢ SẢN PHẨM</label>
				<textarea class="form-control" id="modal-form-describe" rows="5"
					name="describe"
					placeholder="MSI Bravo 15 B5DD 275VN sẵn sàng cho chiến trường game rực lửa. Kết hợp R7 5800H và Radeon™ RX 5500M, Bravo 15 sẽ làm thỏa mãn mọi game thủ. Tản nhiệt độc quyền của MSI – Cooler Boost 5, CPU và GPU sẽ thoải mái phát huy được tối đa hiệu năng. Tận dụng sức mạnh của Bravo 15 và tung hoành trên chiến trường ảo, giống như lôi điểu trong truyền thuyết!">${product.describe }</textarea>
			</div>
			<div class="row" style="margin-top: 1%;">
				<div class="col-md-1 text-center"></div>
				<div class="col-md-2 text-center">
					<button type="submit" class="btn btn-primary"
						formaction="admin/WarehouseServlet/create">THÊM MỚI</button>
				</div>
				<div class="col-md-2 text-center">
					<button type="submit" class="btn btn-primary"
						formaction="admin/WarehouseServlet/update">CẬP NHẬT</button>
				</div>
				<div class="col-md-2 text-center">
					<button type="submit" class="btn btn-primary"
						formaction="admin/WarehouseServlet/delete">XÓA</button>
				</div>
				<div class="col-md-2 text-center">
					<button type="submit" class="btn btn-primary"
						formaction="admin/WarehouseServlet/reset">LÀM MỚI</button>
				</div>
				<div class="col-md-2 text-center">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModalCenter" onclick="myFunction()">XEM
						TRƯỚC</button>
				</div>
				<div class="col-md-1 text-center"></div>
			</div>

		</div>
	</div>
</form>

<script>
	function myFunction() {

		document.getElementById("modal-product-name").innerHTML = document
				.getElementById("modal-form-name").value;
		document.getElementById("modal-product-category").innerHTML = document
				.getElementById("modal-form-category").value;
		document.getElementById("modal-product-sale").innerHTML = document
				.getElementById("modal-form-sale").value;
		document.getElementById("modal-product-price").innerHTML = document
				.getElementById("modal-form-price").value
				+ " VNĐ";
		document.getElementById("modal-product-oldprice").innerHTML = document
				.getElementById("modal-form-oldprice").value
				+ " VNĐ";

	}
</script>