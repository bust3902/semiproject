const allCheckBox = document.querySelector("input.check_all");
const selDeleteBtn = document.querySelector(".list_handler button");
let checkedBookNo = [];

// eventListener 추가
allCheckBox.addEventListener("change", clickAllCheckBox);
allCheckBox.addEventListener("change", cartSummary);
allCheckBox.addEventListener("change", refreshCheckedBookNo);
selDeleteBtn.addEventListener("click", deleteSelectedItems);

// 화면 초기화
document.querySelectorAll("input.check_one").forEach((box) => {
  box.addEventListener("change", refreshAllCheckBox);
  box.addEventListener("change", cartSummary);
  box.addEventListener("change", refreshCheckedBookNo);
});
checkAllForEntry();
//
function checkAllForEntry() {
  let oneCheckBoxes = document.querySelectorAll("input.check_one");
  oneCheckBoxes.forEach((box) => box.click());
}
function clickAllCheckBox() {
  let oneCheckBoxes = document.querySelectorAll("input.check_one");
  for (let i = 0; i < oneCheckBoxes.length; i++) {
    oneCheckBoxes[i].checked = allCheckBox.checked;
  }
}

function refreshAllCheckBox() {
  let oneCheckBoxes = document.querySelectorAll("input.check_one");
  for (let i = 0; i < oneCheckBoxes.length; i++) {
    if (!oneCheckBoxes[i].checked) {
      allCheckBox.checked = false;
      return;
    }
  }
  allCheckBox.checked = true;
}
function refreshCheckedBookNo() {
  checkedBookNo.splice(0, checkedBookNo.length);
  let oneCheckBoxes = document.querySelectorAll("input.check_one:checked");
  oneCheckBoxes.forEach((box) => {
    checkedBookNo.push(parseInt(box.value));
  });
  console.log("list", checkedBookNo);
}
function removeBookNo(bookNo) {
  let i = checkedBookNo.findIndex((no) => no === bookNo);
  if (i !== -1) {
    checkedBookNo.splice(i, 1);
  }
}

// 가격 요약 함수
function cartSummary() {
  // 변수 지정
  let summaryCountEl = document.querySelector(".summary_info-count > span > span");
  let summaryTotalEl = document.querySelector(".summary_info-total_price span");
  let summaryDiscountEl = document.querySelector(".summary_info-discount_price span");
  let summaryOrderEl = document.querySelector(".summary_total_wrapper span");

  let totalBookPrice = 0;
  let totalOrderPrice = 0;

  let bookNoList = [];

  let checkedBoxes = document.querySelectorAll("input.check_one:checked");
  // 선택 항목이 없을 때
  if (checkedBoxes.length === 0) {
    summaryCountEl.textContent = "0";
    summaryTotalEl.textContent = "0원";
    summaryDiscountEl.textContent = "0원";
    summaryOrderEl.textContent = "0원";
    return;
  }

  // 체크된 밸류를 리스트에 저장
  checkedBoxes.forEach((box) => {
    bookNoList.push(box.value);
  });

  // 밸류로 엘리먼트 검색해 가격 취합
  bookNoList.forEach((no) => {
    let paperBookPrice = parseInt(document.querySelector("#paper_book_price_" + no).dataset.paperBookPrice);
    let bookPrice = parseInt(document.querySelector("#book_price_" + no).dataset.bookPrice);

    // 할인 가격 없는 경우
    if (!paperBookPrice) {
      totalBookPrice += bookPrice;
      totalOrderPrice += bookPrice;
    }
    // 할인 가격 있는 경우
    else {
      totalBookPrice += paperBookPrice;
      totalOrderPrice += bookPrice;
    }
  });

  let totalDiscountPrice = totalBookPrice - totalOrderPrice;
  let totalPriceText = totalBookPrice.toLocaleString("ko-KR") + "원";
  let discountPriceText = (totalDiscountPrice > 0 ? "- " : "") + (totalBookPrice - totalOrderPrice).toLocaleString("ko-KR") + "원";
  let orderPriceText = totalOrderPrice.toLocaleString("ko-KR") + "원";

  // summary 작성
  summaryCountEl.textContent = checkedBoxes.length;
  summaryTotalEl.textContent = totalPriceText;
  summaryDiscountEl.textContent = discountPriceText;
  summaryOrderEl.textContent = orderPriceText;
}

function getCartItemsList() {
  let bookListDiv = document.querySelector(".cart_book_list");
  let bookCountSpan = document.querySelector(".nav-count");
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      let resText = xhr.responseText;
      let arr = resText.split("@spliter");
      let count = arr[0];
      let htmlText = arr[1];

      // 카트가 비어있을 때
      if (count == 0) {
        let formEl = document.querySelector("form");

        bookCountSpan.textContent = "";
        formEl.innerHTML =
          '\
        <div class="rent_empty d-flex flex-column justify-content-center align-items-center">\
          <img src="../img/cart.svg" />\
          <span class="fs-6 opacity-75 mt-3">카트에 담긴 책이 없습니다.</span>\
        </div>';
        return;
      }
      // 카트에 상품이 있을 때
      else {
        bookCountSpan.textContent = count;
        bookListDiv.innerHTML = htmlText;

        let oneCheckBoxes = document.querySelectorAll("input.check_one");
        oneCheckBoxes.forEach((box) => {
          box.addEventListener("change", refreshAllCheckBox);

          if (checkedBookNo.includes(parseInt(box.value))) {
            box.click();
          }
          box.addEventListener("change", cartSummary);
          box.addEventListener("change", refreshCheckedBookNo);
        });
        cartSummary();
      }
    }
  };

  xhr.open("GET", "list.jsp");
  xhr.send();
}

function deleteItem(no) {
  let isLogined = document.querySelector(".is_logined").value;

  // confirm
  let isConfirmed = confirm("책을 삭제하시겠습니까?");
  if (!isConfirmed) {
    return;
  }

  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      let jsonText = xhr.responseText;
      let responseObj = JSON.parse(jsonText);
      let success = responseObj.success;
      let message = responseObj.message;

      if (success) {
        // pass
      } else {
        alert(message);
        window.location.reload();
      }

      getCartItemsList();
    }
  };

  let url = "";
  if (isLogined) {
    url = "delete.jsp?itemNo=" + no;
  } else {
    url = "delete.jsp?bookNo=" + no;
    removeBookNo(no);
  }

  xhr.open("GET", url);
  xhr.send();
}

function deleteSelectedItems() {
  let isLogined = document.querySelector(".is_logined").value;
  let checkedBoxes = document.querySelectorAll("input.check_one:checked");

  // confirm
  let isConfirmed = confirm("선택한 책 " + checkedBoxes.length + "권을 삭제하시겠습니까?");
  if (!isConfirmed) {
    return;
  }

  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      let jsonText = xhr.responseText;
      let responseObj = JSON.parse(jsonText);
      let success = responseObj.success;
      let message = responseObj.message;

      if (success) {
        // pass
      } else {
        alert(message);
        window.location.reload();
      }

      getCartItemsList();
    }
  };

  let noList = [];
  checkedBoxes.forEach((box) => noList.push(box.value));

  let url = "";
  if (isLogined) {
    url = "delete.jsp?itemNo=";
    url += noList.join("&itemNo=");
  } else {
    checkedBookNo = [];
    url = "delete.jsp?bookNo=";
    url += noList.join("&bookNo=");
  }

  xhr.open("GET", url);
  xhr.send();
}
