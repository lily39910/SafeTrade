<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic_table_mold.css"/>
	<!-- <script type="text/javascript">
		function autoHypenPhone(str) {
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';

            if( str.length < 4) {
                return str;
            }
            else if(str.length < 7) {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            }
            else if(str.length < 11) {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            }
            else {              
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

        window.onload = function() {
        	var cellPhone = document.getElementById('cellPhone');
			cellPhone.onkeyup = function(event) {
				event = event || window.event;
				var devide_val = this.value.trim();
				this.value = autoHypenPhone(devide_val) ;
			}
        } 
	</script>
	-->
</head>
<body>
	<header>
		<jsp:include page="common/header.jsp"></jsp:include>
	</header>

	<article>
		<div class="container text-arrangement">
			<form id="sell_product_modify" name="sell_product_modify" autocomplete="off" encType="multipart/form-data">
				<div>
					<h3>판매 물건 등록</h3>
				</div>

				<div>
					<button>수입명품</button>
					<button>패션</button>
					<button>화장품/미용</button>
					<button>전자기기</button>
					<button>교육</button>
				</div>
				
				<div class="table_div">
					<table class="table table-bordered">
						<thead>
							<input type="hidden" id="selling_list_num" name="selling_list_num" value="${product.selling_list_num}">
						</thead>
						<tbody>
							<tr>
								<th>판매 분야(중분류)</th>
								<td>
									<select class="full-width" name="mid_group_num" id="mid_group_num">
										<option value="111">선택</option>
										<option value="112">몰라</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" class="full-width" name="selling_list_title" id="selling_list_title" value="${product.selling_list_title}"/></td>
							</tr>
							<tr>
								<th>판매 제품명</th>
								<td><input type="text" class="full-width" name="selling_product" id="selling_product" value="${product.selling_product}"/></td>
							</tr>
							<tr>
								<th>제품 가격</th>
								<td><input type="text" class="full-width" name="selling_price" id="selling_price" value="${product.selling_price}"/></td>
							</tr>
							<tr>
								<th>제품 갯수</th>
								<td>
									<input type="text" value="1" name="selling_count" id="selling_count" value="${product.selling_count}" />
									<input type="button" value="+"
									onClick="javascript:this.form.amount.value++;">
									<input type="button" value="-"
									onClick="javascript:this.form.amount.value--;">
								</td>
							</tr>
							<tr>
								<th>제품 품질</th>
								<td>
									<select class="full-width" name="selling_product_quality" id="selling_product_quality">
										<option value="">선택</option>
										<option value="1">최상</option>
										<option value="2">상</option>
										<option value="3">중</option>
										<option value="4">하</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>택배비</th>
								<td><input type="text" class="full-width" name="delivery_price" id="delivery_price" value="${product.delivery_price}"/></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<input type="text" name="trade_phone_num" id="trade_phone_num" maxlength="13" class="full-width" value="${product.trade_phone_num}">
								</td>
							</tr>
							<tr>
								<th class="field">상세 정보</th>
								<td><textarea class="full-width" name="selling_list_content" id="selling_list_content">${product.selling_list_content}</textarea></td>
							</tr>
							<tr>
								<th>이미지 첨부</th>
								<td><input type="file" id="selling_item_image" 
									name="selling_item_image" class="full_width">${product.selling_item_image}</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2" class="btn_align">
									<button class="btn btn-info" id="product_modify" onclick="sell('modify')">판매글 수정</button>	
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-default">취소</button>
								</td> 
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
	</article>

	<footer>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</footer>
	
	<script src="${pageContext.request.contextPath}/js/sell_product.js"></script>
</body>
</html>