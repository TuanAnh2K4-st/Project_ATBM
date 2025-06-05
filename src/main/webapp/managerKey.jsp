<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Quản lý Khoá</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/managerKey.css" />

    <style>
        .hidden { display: none; }
        .main { max-width: 800px; margin: 20px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .button-group button { margin-right: 10px; }
    </style>

    <script>
        function toggleChangeKeyBox() {
            const box = document.getElementById('changeKeyBox');
            box.classList.toggle('hidden');
        }

        function submitLostKeyForm() {
            const newKey = $('#newKey').val().trim();
            const confirmKey = $('#confirmKey').val().trim();

            if (newKey === '' || confirmKey === '') {
                alert('Vui lòng nhập đầy đủ thông tin khóa mới.');
                return;
            }

            if (newKey !== confirmKey) {
                alert('Khóa mới và xác nhận không trùng khớp.');
                return;
            }

            // Gửi form với action lostKey
            $('<form>', {
                method: 'post',
                action: 'managerKey'
            }).append(
                $('<input>', { type: 'hidden', name: 'action', value: 'lostKey' }),
                $('<input>', { type: 'hidden', name: 'newKey', value: newKey })
            ).appendTo('body').submit();
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp" />

<% String message = (String) request.getAttribute("message");
    if (message != null) { %>
<div class="alert alert-info alert-dismissible fade show mt-3 mx-3" role="alert">
    <%= message %>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<% } %>

<div class="main">
    <h2 class="mb-4">Quản lý khóa</h2>

    <!-- Nút tải file publicKey -->
    <a href="download?filename=Tool_Sign.exe" class="btn btn-secondary">Tải file khóa công khai</a>

    <form method="post" action="managerKey" id="saveKeyForm">
        <label for="textInput" class="form-label">Nhập chuỗi khóa công khai mới:</label>
        <textarea id="textInput" name="publicKey" class="form-control" placeholder="Nhập chuỗi tại đây..." rows="4"></textarea>

        <input type="hidden" name="action" value="saveKey" />

        <div class="button-group mt-3">
            <button type="submit" class="btn btn-primary save-btn">Lưu khóa</button>
            <button type="button" class="btn btn-warning lost-btn" onclick="toggleChangeKeyBox()">Tôi đã mất khóa</button>
        </div>
    </form>

    <!-- Form đổi khóa nếu mất -->
    <form method="post" action="managerKey" id="changeKeyBox" class="change-key-box hidden mt-4">
        <h5>Đổi khóa mới khi mất:</h5>

        <input type="hidden" name="action" value="lostKey" />

        <div class="mb-3">
            <label for="newKey" class="form-label">Khóa mới:</label>
            <textarea id="newKey" name="newKey" class="form-control" placeholder="Nhập khóa mới..." rows="3"></textarea>
        </div>
        <div class="mb-3">
            <label for="confirmKey" class="form-label">Xác nhận khóa mới:</label>
            <textarea id="confirmKey" name="confirmKey" class="form-control" placeholder="Nhập lại khóa để xác nhận..." rows="3"></textarea>
        </div>
        <button type="submit" class="btn btn-success confirm-btn">Xác nhận đổi khóa</button>
    </form>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
