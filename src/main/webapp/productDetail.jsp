<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.Products" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
  Products product = (Products) request.getAttribute("product");
  List<Products> relatedProducts = (List<Products>) request.getAttribute("relatedProducts");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chi tiết sản phẩm</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
        integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="css/header.css" />
  <link rel="stylesheet" href="css/footer.css" />
  <link rel="stylesheet" href="css/productDetail.css" />
</head>
<body>
<%--Header--%>
<jsp:include page="header.jsp" />
<div class="main">
  <div class="sidebar">
    <a href="Trang Khuyến mãi.jsp"><img src="imng/Sale hóa chất.gif" alt="">
    </a>
    <h2>Sự kiện mới</h2>
    <div class="hot-info">
      <div class="hot-item">
        <h3>Sản phẩm khuyến mãi</h3>
        <p>Giảm giá đến 50% cho các sản phẩm mùa hè.</p>
      </div>
      <div class="hot-item">
        <h3>Sản phẩm mới</h3>
        <p>Đón chào loạt sản phẩm mới với nhiều tính năng hiện đại.</p>
      </div>
      <div class="hot-item">
        <h3>Ưu đãi đặc biệt</h3>
        <p>Nhận ngay ưu đãi cho khách hàng thân thiết!</p>
      </div>
    </div>
  </div>
  <div class="product-detail">
    <!-- Sử dụng dữ liệu động từ đối tượng product -->
    <div class="product">
      <img src="<%= product.getImageProduct() %>" alt="<%= product.getProductName() %>">
      <div class="product-info">
        <h1><%= product.getProductName() %></h1>
        <div class="price">
          <p><strong>Giá bán:</strong> <%= product.getPriceSell() %> VND</p>
        </div>
        <p>Mã Code: <%=product.getProductId()%></p>
        <p>Hãng: <%=product.getBrandName()%></p>
        <p>Ngày đăng: <fmt:formatDate value="<%=product.getCreateAt()%>" pattern="dd/MM/yyyy"/></p>
        <p><strong>Thương hiệu:</strong> <%= product.getBrandName() %></p>
        <p><strong>Đơn vị tính:</strong> <%= product.getUnitOfSure() %></p>
        <p><strong>Cấp độ bảo quản:</strong> <%= product.getHozandLevel() %></p>
        <form action="add-to-cart" method="post">
          <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
          <label>Số lượng:</label>
          <div class="quantity">
            <input type="number" name="quantity" value="1" min="1" />
          </div>
          <br><br>
          <button type="submit" class="buy-btn"><i class="fa-solid fa-cart-plus" name="cart"></i> Thêm vào giỏ hàng</button>
        </form>
      </div>
    </div>
    <div class="related-products">
      <h2>Sản phẩm liên quan</h2>
      <div class="product-lists">
        <c:forEach var="relatedProduct" items="${relatedProducts}">
          <div class="product-item">
            <a href="detail?id=${relatedProduct.productId}">
              <img src="${relatedProduct.imageProduct}" alt="${relatedProduct.productName}">
            </a>
            <ul class="content">
              <li class="product-name">${relatedProduct.productName}</li>
              <li class="product-price">${relatedProduct.priceSell} VND</li>
              <li class="product-view">Mức độ: ${relatedProduct.hozandLevel}</li>
              <li class="product-time">Ngày đăng:
                <fmt:formatDate value="${relatedProduct.createAt}" pattern="dd/MM/yyyy"/>
              </li>
            </ul>
          </div>
        </c:forEach>
      </div>
    </div>
    <!-- Các nút điều hướng -->
    <div class="tabs">
      <button id="btnDescription" class="tab-btn active">Mô Tả</button>
      <button id="btnReviews" class="tab-btn">Đánh Giá</button>
    </div>
    <!-- Phần mô tả -->
    <div id="description" class="content-section description active">
      <h3>Thông tin sản phẩm</h3>
      <p>Axit oleanolic hoặc axit oleanic là một triterpenoid pentacyclic tự nhiên có liên quan đến axit
        betulinic . Nó được phân phối rộng rãi trong thực phẩm và thực vật, nơi nó tồn tại dưới dạng axit tự
        do hoặc dưới dạng aglycone của saponin triterpenoid. </p>
      <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Oleanolic_Acid_Biosynthesis.gif/700px-Oleanolic_Acid_Biosynthesis.gif"
           alt="">
      <h4> Xảy ra trong tự nhiên</h4>
      <p>Axit oleanolic có thể được tìm thấy trong dầu ô liu , Phytolacca americana (cây chùm ngây Mỹ), và
        Syzygium spp, tỏi, v.v. Nó lần đầu tiên được nghiên cứu và phân lập từ một số loại thực vật, bao gồm
        Olea europaea (lá, quả), Rosa woodsii (lá), Prosopis glandulosa (lá và cành), Phoradendron
        juniperinum (toàn bộ cây), Syzygium claviflorum (lá), Hyptis capitata (toàn bộ cây), Mirabilis
        jalapa [ 4 ] và Ternstroemia gymnanthera (phần trên không). Các loài Syzygium khác bao gồm táo Java
        ( Syzygium samarangense ) và táo hồng có chứa nó, cũng như Ocimum tenuiflorum (húng quế thánh).</p>
      <h4>Sinh tổng hợp</h4>
      <p>Quá trình tổng hợp axit oleanolic bắt đầu với mevalonate để tạo ra squalene . Squalene monooxygenase
        trong bước tiếp theo oxy hóa squalene và tạo thành epoxit dẫn đến 2,3-oxidosqualene. Beta-amyrin
        synthase tạo ra beta-amyrin bằng chuỗi phản ứng hình thành vòng. Sau khi hình thành beta amyrin,
        CYP716AATR2, còn được gọi là enzyme cytochrome p450, oxy hóa carbon 28 biến nó thành rượu. [ 6 ]
        CYP716AATR2 chuyển đổi rượu thành aldehyde và cuối cùng thành axit cacboxylic tạo thành axit
        oleanolic.</p>
      <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTERUTExIWFRIVFxYVFRYWFhUYFRcVFhUYFxUVExgYKCggGBolGxUYITEhJSkrLi4vFx8zOTMsNygtLisBCgoKDg0OFxAQFSsfHSUvLS0tLS0tLS0tLS0tNy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAIEBhQMBEQACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAAAAAABQYDBAECBwj/xABEEAABAwEDBwkGBAUDBAMAAAABAAIDEQQFIQYSFTFBUVQTMmFxc4GSk9EHIpGhsbIzNEJSFCNywfBTYuFDgqLxY3SD/8QAGgEBAQEBAQEBAAAAAAAAAAAAAAECBAMGBf/EAC0RAQABAgMHAwUAAwEAAAAAAAABAhEDFGEEITFUZJGSEjJyBTRBUXETIkJi/9oADAMBAAIRAxEAPwC3WKxxmKNxjdJJI97AA/N5oBGsdK+QwcDCnCoqmiaqqpmONuDziIs3NCngpPPZ6LpyHTz5QttDQp4KTz2eiZDp58oLaGhTwUnns9EyHTz5QW0NCngpPPZ6JkOnnygtoaFPBSeez0TIdPPlBbQ0KeCk89nomQ6efKC2hoU8FJ57PRMh08+UFtDQp4KTz2eiZDp58oLaGhTwUnns9EyHTz5QW0NCngpPPZ6JkOnnygtoaFPBSeez0TIdPPlBbQ0KeCk89nomQ6efKC2hoU8FJ57PRMh08+UFtDQp4KTz2eiZDp58oLaGhTwUnns9EyHTz5QW0NCngpPPZ6JkOnnygtoaFPBSeez0TIdPPlBbQ0KeCk89nomQ6efKC2hoU8FJ57PRMh08+UFtDQp4KTz2eiZDp58oLaGhTwUnns9EyHTz5QW0NCngpPPZ6JkOnnygtoaFPBSeez0TIdPPlBbQ0KeCk89nomQ6efKC2hoU8FJ57PRMh08+UFtDQp4KTz2eiZDp58oLaGhTwUnns9EyHTz5QW0NCngpPPZ6JkOnnygtoaFPBSeez0TIdPPlBbQ0KeCk89nomQ6efKC2hoU8FJ57PRMh08+UFtDQp4KTz2eiZDp58oLaGhTwUnns9EyHTz5QW0NCngpPPZ6JkOnnygtoaFPBSeez0TIdPPlBbQ0KeCk89nomQ6efKC2hoU8FJ57PRMh08+UFtDQp4KTz2eiZDp58oLaGhTwUnns9EyHTz5QW0NCngpPPZ6JkOnnygtoaFPBSeez0TIdPPlBbQ0KeCk89nomQ6efKC2hoU8FJ57PRMh08+UFtDQp4KTz2eiZDp58oLaGhTwUnns9EyHTz5QW0NCngpPPZ6JkOnnygto6T3XmNLnWOQNaCSeXbgBrOAWMTZKaKZqq2ebR/6LR+kXe0DWPAYCGuYx9CakZza0qvz9twqMPEiKItExE92ZS9zc2ydvJ9oX6exe3Z/lLVPCF3X0zYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDiqDlAQEBAQEBAQEBAQEBAQaF/flpuzf9Fybd9vifyUngol989nYxfYF8p9Q99HxpecpO5ubZO3k+0L9DYvbs/wApap4Qu6+mbEBAQEBAQEBAQEBAQEBAQEBAQEuCAgKAqCAgII6+r8s9lZn2iVsbdlec47mNGLj0AKTMQRF1FvL2lSvqLJZs0bJLQSO8RMx+JCzeZatH5QNpvy8ZTV9tewftiZHG3uNC7/yVtJeP01HC0E42u0k//ZnH2uCWPVoywzWpnMtloH/7vd8pKgpYvokLLlZeUWuVszd00Ta03B8ObTrIKbzd+ljuf2lwuIba4zZnfvrnwV6XgAs/7wB0pdLLzDKHNDmkOaRUEEEEHUQRrC0jugICAgICAgICAgINC/vy03Zv+i5Nu+3xP5KTwUS++ezsYvsC+U+oe+j40vOUnc3NsnbyfaF+hsXt2f5S1Twhd19M2ICAgICAgICAgICAgICDguQQF4ZZ2KE5rp2ucNYjBkp0EsqB8VicSmE9UI+D2gRSOzYoJnnqYABvNTgOtZ/yx+E9UM9uyzjYMGVO3HAfDWs1Y8QepFHLKV/MaAN9MPida85x5lPU3LHeNokIo9xJ1BoB+Z2dNKK011T+Vu2H3vO15jb/ADpqfhNzTm9MzxRsY7ySvWJqaS1zw2kFz7TIwl1M2ONtGR66+8cXnGlcNWpbi/5EotAgIKRlrlz/AA7zZrK0S2unvE/hwA6nSU1u3N+OyuZn8Q1Eft5+2yPkkM073SzHXI/X/SwamN6AkUxCTP6b8Vm3BVG1HYidiDbiusnYpdWZt1dSXA3TuKXGja7q3iv1S40rstNpsDs+zHOhrV9ncTybt5Z/ov6R7p2gov8AXqGTeUUNti5SIkEHNkjdhJG/9rx9DqOxWJSYsmFUEBAQEBAQEBAQaF/flpuzf9Fybd9vifyUngol989nYxfYF8p9Q99HxpecpO5ubZO3k+0L9DYvbs/ylqnhC7r6ZsQEBAQEBAQEBAQEBAQQWVmU8dhjDngue+ojYMM4ilSXamtFRU9OorFdcUReUmbPI8ocrLVayQ94ZF/pR1Df+863nrw6FyVYs1POaro27Lv5R2stYOe6mDR0bzuCxG9IWB9paxvJwCjNpJ5x3uP6j/mC1M/olrxygn9zt51ALFxZLuuSQx8rI5sUYFc+Sub0ENwLurAHevSjCmd8txS347DJyDnskliidQcs40mlqaDMYKNjj94nVWnxXt6bRu3NWsu13XfHAwMjaGt1neTtc463E7yveIsraVBAQVD2hZUuskbYYKG1z1bFuY39UrugbOnqKzM/iFiLvPrru0Rt1lznEue4n3nvOLnOO0k1ViLJM3S8Flqgk4LEBrWbjaaANQRXYIOVBzVFcHFEadqsgOIViRW7S2ayTC12XntwezU2Vm2N/Qdh2FNVifxL1jJ++Y7XZ2TxH3XjUec1wwcx25wNQtRN0mLJFVBAQEBAQEBAQaF/flpuzf8ARcm3fb4n8lJ4KJffPZ2MX2BfKfUPfR8aXnKTubm2Tt5PtC/Q2L27P8pajhC7r6ZsQEBAQEBAQEBAQa1pt8Uf4kjGf1Oa36rNVcRxkRNqyysTNc4d/QHP+0ELynaMOP8ApLwhrX7TLM0+5FK/po1o7qmq852qn8RdPVCPtntIs8jSx1jdI062vLCPhipO1UzxpT1wgXZQXeXY3W0E7pXD5ALEV0TPtS8fpE229GlxDGCOOpLY2nAV/cdZKkzF0drpbHK+k8joWYYiGR4PR7urrKR6fzJEXejXXYruszQ5hE0nu5tffeXO5oYzUCabqropiiOD0imIdJLayacPnkbmwvAMQIcxpIfr157gWgEjDGmzHFWLEVXqlpvZRW0SMaGNcWe84nNIqc0gYHGmJ+SmJj0zDMrDd8+fEx/7mg99Mfmuqib0xKthaBBitM7Y2Oe80Yxpc47A1oqT8Ag8RstqdbLRLbZB+IS2IH9ELTRje+nxx2rFP7aq/Sds0FVWUvFGGjpUurtnKDkIO4QcoriqDiqBVQadtgBBwqDgepWEReRNuNivA2cn+RbD7u5toA909Ge0ZvW1qvCV4w9aW2RAQEBAQEBAQaF/flpuzf8ARcm3fb4n8lJ4KJffPZ2MX2BfKfUPfR8aXnKTubm2Tt5PtC/Q2L27P8pap4Qu6+mbEBAQEBAQEBAQcFQUu98gmvcXQylhOJa8Z4r0O5w76rkxNkiZvEszCtXlkPaowXVic0bQ8g/B1Mehc9ez1UxeU9KQuXIdoAdNQu3Y0+B/us04FVW+dx6UzabthjbgAKaqYKYmDREb5VWLY5hqC1r27nAEf8HpXHFc0zuG/c2S1jID3SzvzseTaHHNBJoDmAk6qVw1L9TDpoqi+89KcL7vsjc4WdwdqbWCUvc7Y1rpG6z1r3j0UxwatCr5RX67l2swdaK++QTm2ePbDHTW/NrnO30A3jzxMSKYvLMz+IaTGCMBjcGtwHSNhO9fj4s1TVN1hN3LaCXUJXpgzMzvJWOGXkDnt/DJ/mN2Cv627jv3rvprnDtMcCFjY6oqNS/Qib71cqile123mO7nRtNH2iSOAdTjVw72tI71iqdy0xvVW67IGsa0DAAAdQwH0VSeKdgjzQpMjvnKK4BQdqoOxcgxGdFOVUHOeg5a5By/UgqeWEB5LlGYSRESMO5zDntPxHzVngRxev3TbhPBFM3myxskHU5oP91uJvDLbVBAQEBAQEBBoX9+Wm7N/wBFybd9vifyUngol989nYxfYF8p9Q99HxpecpO5ubZO3k+0L9DYvbs/ylqOELuvpmxAQEBAQEBAQEBAQVe+L0H8RmnmxjVvedvcDT4r83Hxr4np/EI0LXlCAKBedW0btyK5br1c461yV1zUIySUkVrQDEk6gs04cyl1gyWt0zG+6/NY+pYCASQOdIQa5rB8Sdy/RwKKqItdYlp5VZtnk5YSOfag4VzjnCLOaTG3dnjNLyN+bhTX717vzvWZVO7Xe8+Q40GJO0k1OO/ArlxovaliFhzyYI37SCD1gry2qi1phq7JddtzXg7l4Yc2kX6zytezHUV+heJgbuTk1Yc04mNxZ3Dm/Ij4Lo2Wq+HafxuaSq6R5p7YZKy3dHsdLLJ3xtZT7ysVcYap4SxWCPAdQVllvucsq6hyDgvQdXTBRWN86DGHlB3a5BlaUHcOQZAUEPerAWuBGsfTFaT8rb7MJS66rNXYHs7o5XsHyalHBauK1LbIgICAgICAg0L+/LTdm/6Lk277fE/kpPBRL757Oxi+wL5T6h76PjS85Sdzc2ydvJ9oX6Gxe3Z/lLVPCF3X0zYgICAgICAgICAgIPJ8obYBNIA73s+TO6DnnD4L8DGiZxKklDyWmu1efpQs5FfeOGs9W0letFEI1rPKLRKa1bBHiQNu4dLjq7120URCcVm/inRBj6UmmqQKV5OGPmho/qLTXaWlMWuaKbw00YrrgkGa+R4q4vdU1LnGtSXEa8VzU49+MlkVlDdYs7axPz2EjOBpnNx11GsatmxetOJE1WmUskYJA6w4a2e/3ZxB9e5bx6b0CHZacVwWVcbnvlvJgE4jBe1NdoVacjJC5krthkw8Ir9V27F7Z/qwsa7oHmntijpJd8p1Nlkj75Ayn2FZnjEtU/lxYdXckssr3LKsfKU1qDh0vThv3eiKwvf0oMJcNvoEHdj+hBnzwg5DkGVrkGYOoFYRDXk/Bx3A/RaFv9ljSLqs9dvLO7nTyOHyKmH7Vr4rYtsiAgICAgICDQv78tN2b/ouTbvt8T+Sk8FEvvns7GL7AvlPqHvo+NLzlJ3NzbJ28n2hfobF7dn+UtU8IXdfTNiAgICAgICAgICAgqmVmRcdqrIw8lP+8D3X7hI3+4x61z4uz017/wApMPI7wifBK+J7mOcw5rix2c2u4Hf0awuCvDiJsy6zTkRgDnP+3YO/X8FqijekrTk1dRaY46D98h3uIwHcD8+hdMQsQnWNa8zTkVb+DF2cZILh/U/OPVReOJMTEqrNomoTRfm1b5GNzqtx1HBZ4by7rk9Gfwyfd95h6iXDH4r9amfVTEyiB5ShIOsGh6xgVyTQrfu4ve9rGAlzyA1o1krMUTVNoIe3XFd/IQMj1kCrjvccXEdHov2MHD/x0RDSQXqKR7YLuMt2Pe0e/Z3MtDegMNHnuY5x7lmqNzVPFA5P2sSRMeDg5oPxx/zqSUtvbU/WsDBn7CP86UVic4bggxvl6P8AO5B1Y8k0GvqwCDPyNNprv9EHZrCNtfkgzNru+CDKzq9UHeZ1AtQis5T2jMgef1OGa0DWScBTp1JVuiVp4vWcmrv/AIeyQQnXHExp/qDRnfOq1TFoiEmbyk1UEBAQEBAQEGhf35abs3/Rcm3fb4n8lJ4KJffPZ2MX2BfKfUPfR8aXnKTubm2Tt5PtC/Q2L27P8pap4Qu6+mbEBAQEBAQEBAQEBBT8qcu4rMXRMbyswwIBAYw7nOxx6APgufFx4p3flJmzy24bintj8yJtaH35Hcxp1kudtPQKn5rjpw6qpZ4pK5rva6d7nAFsZJ7m4ADdqovWiLCflc9kBzT/ADZ3ZjT+0HnvG6gNB1hK6rQrPedobFC2JmAa0NHcKLmxK91oFPllxXLYSsUH8mq1NP8AqI2wz5shpvXbhbqIZldLP7OIJqT8vM3lRyhaOToC/wB4gVacKldOXpqi7dloyfyWs9kxjaTIcDI8gvI3YABo6AAvXDwqaOC2Ta9QQY7RC17XMeKtcC1wOotcKEHuKDxG4o3WG1zXfKfw3F0Lj+uFxqxw368enO3LOjU7961yiorTBZlEfLGorAWbkHAhFag4nZUIMoeAKH5f8a0Hdg6+hBmbTv7/AJIMrWoMzdSsI1bQ9aRH5P2D+NvJjaVgslJpDsMlf5LPiC7qaVmf9pajdD2BejIgICAgICAgINC/vy03Zv8AouTbvt8T+Sk8FEvvns7GL7AvlPqHvo+NLzlJ3NzbJ28n2hfobF7dn+UtU8IXdfTNiAgICAgICAgICChe0HKksrZoH5rz+LIDi0H/AKbDscdp2A7zhx7Rj+n/AFp4pMozI7IPlKTWppEetkJqHO/3S0xaP9uvfTbnB2e/+1aRD0mz2ZkTM2NjWNGprQGj4BdsRERaGnmt22LMiJcc3lCXvJIAaxuNTuFfouOnhvRqvvVkxEjKhjasYDgQGnXTYXa+8blwbRXV69ERd42ouXje4jC5asJ19qDbOB0L0/5sKnY7XV5Owk/caLqtaIhieL6Ayc/KWfsY/sC76PbD1hIrYICAgpHtNySda4m2iz4WyzVdH/8AIzW6I9J1iu3DU4qTCxNuKo5M3+J2UILZG+69hwc1wwIIOIxB+FNanEmLJiaGuIWZghpyRn/2orpm7tf+fFBy2v8AygyNqdh+iDZZEgzNarZHWR9AtRCIO9ra/ObBA3lLTKc1jBsr+p24AYk7gVKqrf1Yh6RkZk62xWYRA50jjnzSbXyu5x6hqHQFYixM3Ty0ggICAgICAgINC/vy03Zv+i5Nu+3xP5KTwUS++ezsYvsC+U+oe+j40vOUnc3NsnbyfaF+hsXt2f5S1HCF3X0zYgICAgICAgICDHO0lpDTRxBoSKgGmBptUmBXbkyOihfyr3GaapdnvGAcdbmtx97pJJ6l4YeBTTN+MlllcaLoHmGUmVUkr3NY7NhGAAIBcP3OP9ti5K8SZliZUi+L3llPJmQlmHu7Cdlac7XtXlvHFgtOZVlcDjX/AHbe7Cnd0rxxsP1bxkntFVzRQrTFoxW/SjNeJmFm5UMdyRfyQf8Apzy0mg7mnFe2HhTO+eB+EVdzCS1rcXGjQOkmg+ZXtVF7Mvpmxw5kbGDU1rW+EAf2XfD1ZlQQEBAKCh5bZAcu82qxuENsHO/0p+iUDU7Cmd8QaCkmLrE2U+78oXMk/hrXG6z2ka2P/UNQcw6nNO8H4qf1Zj9LCM1wUsjg2LcVLALGNWNfl8UVlbZTvSyO3JAazVWwxTTADcFqyII3nJaJf4exM5Wb9Tv+nG04Z0jtg19JoaY4LM1fpr0/mXoeSGScdjaXE8raXj+bMRif9rB+lnRtpjspaabJM3WRaQQEBAQEBAQEBBoX9+Wm7N/0XJt32+J/JSeCiX3z2djF9gXyn1D30fGl5yk7m5tk7eT7Qv0Ni9uz/KWqeELuvpmxAQEBAQEBAQEBAQVb2gXvyNn5Np9+arcNeYOce/Ad5Xji1WiyS8je58rxFExz5HfpYCSe4agN65oj8Qw0rPC7OpmkvJoABU1rTCms1wCRCvTMisgnRvbPaaVbQsi10Ox0h1VG4bV0UYVt8tWTV7ZA2aV5ezOhcdeZTMJ3lhwHdRSvZqK9CzQsHsvszX50skktP0nNYw9eb7x+KlOzUwWWHKHJ2O0WN9lADGloEdAKRubiwgDYCBhuqvaaImm0LMXeR5C5Nym9GxSMp/Cuz5twLMY8duc4tI3ipXPRRPq3vOI3vdQut6OUBAQEBAQRl/ZP2a2R8naYWyN2V5zTvY4YsPSCEFAtvs7tlnq6wWoSR7ILTrHQ2VusbgQOtSy3Q9ova22c0tV3zsp+uNvKx9efHVo71Lz+i0fthbl5Zf1PLTudgVPVC+iXYZd2d2DC553Ma5x+SeqD0M0V5W+fCzXdOa/qlbyTOuslAe4q3n8QWj8ykrH7N7baSHW+1CNm2Gz4k9BkdgPg7rU9N+JeI4PRbjuOCyRCKzxiNgxNMXOP7nuOLndJWoizKRVBAQEBAQEBAQEBBoX9+Wm7N/0XJt32+J/JSeCiX3z2djF9gXyn1D30fGl5yk7m5tk7eT7Qv0Ni9mB8pajhC7r6ZsQEBAQEBAQEBAQEFVyhyRNrtAkfOWRBobmsaM+gqT7xwbUncV5VYfqm8ykxdM3NckFlZmQRtYDzjrc473uOLu9bimI4DBd+TNlhkMscLRISTnEucQTrzc4nN7kimFTCoKggIOjYwCSAATSppiaaqnaoO6oICAgICAgICDhQdTE062j4BBy1gGoAdQQcqjlAQEBAQEBAQEBAQEBBoX9+Wm7N30XJt32+J/JSeCiX3z2djF9gXyn1D30/Gl5y3LulbyMVJmRyRyPd74J1gAau9dezV0f4cO2JFNVMzO9Y4JLS8nGQeBy7M5icxR2lb6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6ml5OMg8DkzmJzFHaS+ppeTjIPA5M5icxR2kvqaXk4yDwOTOYnMUdpL6sdpvB8jHMdbIM1wINGO1HWsYm0V4lM0VbRRadJL6oS+ntMjc1wcGxxtqNRLWgFflbfVRViR6JvEREM1NArhZcKIICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLULDlRX//Z"
           alt="">
      <h4>Nguyên cứu dược lý</h4>
      <p>Axit oleanolic tương đối không độc, có tác dụng bảo vệ gan và thể hiện đặc tính chống khối u và kháng
        vi-rút. Axit oleanolic được phát hiện có hoạt tính chống HIV yếu và hoạt tính chống HCV yếu trong
        ống nghiệm , nhưng các chất tương tự tổng hợp mạnh hơn đang được nghiên cứu như những loại thuốc
        tiềm năng.
        Một chất tương tự triterpenoid tổng hợp cực kỳ mạnh của axit oleanolic đã được tìm thấy vào năm
        2005, đó là chất ức chế mạnh các quá trình viêm tế bào. Chúng hoạt động bằng cách cảm ứng bởi IFN-γ
        của nitric oxide synthase có thể cảm ứng (iNOS) và cyclooxygenase 2 trong đại thực bào chuột . Chúng
        là chất cảm ứng cực kỳ mạnh của phản ứng pha 2 (ví dụ, tăng NADH-quinone oxidoreductase và heme
        oxygenase 1 ), là chất bảo vệ chính của tế bào chống lại stress oxy hóa và ái điện tử.
        Một nghiên cứu năm 2002 trên chuột Wistar phát hiện ra rằng axit oleanolic làm giảm chất lượng và
        khả năng vận động của tinh trùng, gây ra tình trạng vô sinh. Sau khi ngừng tiếp xúc, chuột đực đã
        lấy lại khả năng sinh sản và thụ thai thành công cho chuột cái. Axit oleanolic cũng được sử dụng làm
        tiêu chuẩn để so sánh sự ức chế hyaluronidase , elastase và matrix-metalloproteinase-1 của các chất
        khác trong nghiên cứu chính (tương tự như natri diclofenac để so sánh hoạt động giảm đau).
        Axit oleanolic kích hoạt telomerase trong các tế bào đơn nhân máu ngoại vi (PBMC) gấp 5,9 lần, nhiều
        hơn bất kỳ hợp chất nào khác đã được thử nghiệm, ngoại trừ Centella asiatica (gấp 8,8 lần). Chiết
        xuất Astragalus kích hoạt telomerase ít hơn gấp 4,3 lần, TA-65 gấp 2,2 lần và axit maslinic gấp 2
        lần. </p>
    </div>
    <!-- Phần đánh giá -->
    <div id="reviews" class="content-section reviews">
      <h2>Đánh Giá Sản Phẩm</h2>
      <div class="review-list">
        <div class="review">
          <p><strong>Các Nguyễn:</strong> Sản phẩm rất tốt, tôi rất hài lòng!</p>
        </div>
        <div class="review">
          <p><strong>Anh Lê:</strong> Chất lượng tuyệt vời, sẽ mua lại lần sau!</p>
        </div>
      </div>
      <textarea id="userReview" placeholder="Để lại đánh giá của bạn..."></textarea>
      <button id="submitReview">Gửi Đánh Giá</button>
    </div>
  </div>
</div>
<%--Footer--%>
<jsp:include page="footer.jsp" />
<script>
  const btnDescription = document.getElementById('btnDescription');
  const btnReviews = document.getElementById('btnReviews');
  const description = document.getElementById('description');
  const reviews = document.getElementById('reviews');

  btnDescription.addEventListener('click', function () {
    btnDescription.classList.add('active');
    btnReviews.classList.remove('active');
    description.style.display = 'block';
    reviews.style.display = 'none';
  });

  btnReviews.addEventListener('click', function () {
    btnReviews.classList.add('active');
    btnDescription.classList.remove('active');
    reviews.style.display = 'block';
    description.style.display = 'none';
  });

  // Mặc định: ẩn đánh giá
  reviews.style.display = 'none';
  description.style.display = 'block';
</script>
</body>
</html>