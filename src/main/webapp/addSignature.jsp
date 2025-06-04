<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm chữ ký điện tử</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/addSignature.css">
</head>
<body>
<jsp:include page="header.jsp" />

<%
    String infoOrder = (String) session.getAttribute("infoOrder");
    String infoOrderHash = (String) session.getAttribute("infoOrderHash");
%>

<div class="signature-container">
    <h2 class="signature-title">Xác nhận và ký đơn hàng</h2>

    <form action="complete-payment" method="post" class="signature-form">

        <div class="signature-group">
            <label>Thông tin đơn hàng:</label>
            <textarea name="infoOrder" rows="5" readonly><%= infoOrder %></textarea>
        </div>

        <div class="signature-group">
            <label>Hash MD5:</label>
            <textarea name="infoOrderHash" rows="2" readonly><%= infoOrderHash %></textarea>
        </div>

        <div class="signature-group">
            <label>Chữ ký:</label>
            <textarea name="signature" rows="3" placeholder="Nhập chữ ký tại đây..." required></textarea>
        </div>

        <button type="submit" class="signature-submit-btn">Hoàn tất thanh toán</button>
    </form>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
