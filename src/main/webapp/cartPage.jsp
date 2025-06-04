
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.*" %>
<%@ page import="java.util.*" %>

<%
  Cart cart = (Cart) session.getAttribute("cart");
  if (cart == null) {
    cart = new Cart();
    session.setAttribute("cart", cart);
  }
  Collection<CartItem> items = cart.getItems();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>Cart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="css/header.css" />
  <link rel="stylesheet" href="css/footer.css" />
  <link rel="stylesheet" href="css/cartPage.css" />
  <style>
    html, body, ul {
      margin: 0;
      padding: 0;
      font-size: 16px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      line-height: 1.5;
    }
    .wrapper {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
    main {
      flex: 1;
    }
  </style>
</head>
<body>
<div class="wrapper">
  <%--Header--%>
  <jsp:include page="header.jsp" />
  <!--body-->
  <div class="container mt-5 p-3 rounded cart">
    <div class="row">
      <div class="col-md-12">
        <div class="product-details">
          <div class="d-flex flex-row align-items-center mb-3">
            <i class="fa fa-long-arrow-left"></i>
            <a href="Trang_chu.jsp" class="ms-2 text-decoration-none text-primary">Tiếp tục mua sắm</a>
          </div>

          <h3 class="text-primary mb-4">
            <i class="fa-solid fa-cart-plus me-2"></i>Giỏ Hàng của tôi
          </h3>

          <table class="table table-bordered text-center align-middle">
            <thead class="table-primary">
            <tr>
              <th>Ảnh</th>
              <th style="width: 25%">Tên sản phẩm</th>
              <th>Đơn giá</th>
              <th>Số lượng</th>
              <th>Thành tiền</th>
              <th>Xóa</th>
            </tr>
            </thead>
            <tbody id="cart-items">
            <% for (CartItem item : items) { %>
            <tr data-id="<%= item.getProduct().getProductId() %>">
              <td>
                <img src="<%= item.getProduct().getImageProduct() %>"
                     alt="<%= item.getProduct().getProductName() %>"
                     class="img-thumbnail" style="width: 70px; height: 70px;">
              </td>
              <td class="text-start"><%= item.getProduct().getProductName() %></td>
              <td><%= String.format("%,d", item.getProduct().getPriceSell()) %> VNĐ</td>
              <td>
                <div class="d-flex justify-content-center align-items-center">
                  <button class="btn btn-sm btn-outline-secondary btn-decrease" data-id="<%= item.getProduct().getProductId() %>">-</button>
                  <span class="mx-2 quantity"><%= item.getQuantity() %></span>
                  <button class="btn btn-sm btn-outline-secondary btn-increase" data-id="<%= item.getProduct().getProductId() %>">+</button>
                </div>
              </td>
              <td class="item-total"><%= String.format("%,d", item.getTotalPrice()) %> VNĐ</td>
              <td>
                <button class="btn btn-sm btn-danger btn-remove" data-id="<%= item.getProduct().getProductId() %>">
                  <i class="fa fa-trash-alt"></i>
                </button>
              </td>
            </tr>
            <% } %>
            </tbody>
            <tfoot class="table-light">
            <tr>
              <td colspan="4" class="text-end fw-bold">Tổng tiền:</td>
              <td colspan="2" id="cart-total" class="fw-bold text-danger"><%= String.format("%,d", cart.getTotalPrice()) %> VNĐ</td>
            </tr>
            </tfoot>
          </table>

          <div class="d-flex justify-content-end">
            <a href="payPage.jsp" class="btn btn-success px-4 py-2">
              <i class="fa fa-credit-card me-2"></i>Đặt mua
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%--Footer--%>
  <jsp:include page="footer.jsp" />
</div>


<script>
  function updateCartUI(data, id) {
    if (data.quantity === 0) {
      // Xóa dòng nếu số lượng = 0
      $('tr[data-id="' + id + '"]').remove();
    } else {
      // Cập nhật số lượng và thành tiền từng dòng
      const row = $('tr[data-id="' + id + '"]');
      row.find('.quantity').text(data.quantity);
      row.find('.item-total').text(data.itemTotal.toLocaleString() + ' VNĐ');
    }
    // Cập nhật tổng tiền
    $('#cart-total').text(data.total.toLocaleString() + ' VNĐ');

    // Nếu giỏ hàng trống thì hiển thị thông báo
    if ($('#cart-items tr').length === 0) {
      $('#cart-items').html('<tr><td colspan="5">Giỏ hàng trống</td></tr>');
    }
  }

  $(document).ready(function () {
    $('.btn-increase').click(function () {
      let id = $(this).data('id');
      $.post('update-quantity', {id: id, delta: 1}, function (data) {
        if (data.success) {
          updateCartUI(data, id);
        }
      }, 'json');
    });

    $('.btn-decrease').click(function () {
      let id = $(this).data('id');
      $.post('update-quantity', {id: id, delta: -1}, function (data) {
        if (data.success) {
          updateCartUI(data, id);
        }
      }, 'json');
    });

    $('.btn-remove').click(function () {
      let id = $(this).data('id');
      $.post('remove-from-cart', {id: id}, function (data) {
        if (data.success) {
          // Xóa dòng khỏi bảng
          $('tr[data-id="' + id + '"]').remove();
          // Cập nhật tổng tiền
          $('#cart-total').text(data.total.toLocaleString() + ' VNĐ');
          if ($('#cart-items tr').length === 0) {
            $('#cart-items').html('<tr><td colspan="5">Giỏ hàng trống</td></tr>');
          }
        }
      }, 'json');
    });
  });
</script>
</body>
</html>
