const ridiCashRadio = document.querySelector("#pay-type-0");
const termsAndConCheckBox = document.querySelector("#terms-and-conditions-check");
const totalPriceSpan = document.querySelectorAll(".total-price");
const userCashSpan = document.querySelector(".user-cash");

let totalPrice = 0;

termsAndConCheckBox.checked = false;
sum();

function sum() {
  let priceListEls = document.querySelectorAll(".book-price");
  let priceList = [];
  priceListEls.forEach((p) => {
    priceList.push(parseInt(p.dataset.bookPrice));
  });
  totalPrice = priceList.reduce((sum, val) => (sum += val), 0);
  totalPriceSpan.forEach((span) => {
    span.textContent = totalPrice.toLocaleString("ko-KR") + "원";
  });
}

function submitCheckout() {
  if (!termsAndConCheckBox.checked) {
    alert("구매 동의를 체크해주세요.");
    return false;
  }
  if (!ridiCashRadio.checked) {
    alert("준비중인 결재수단입니다.");
    return false;
  }

  let userCash = parseInt(userCashSpan.dataset.cash);
  if (userCash < totalPrice) {
    alert("보유한 리디 캐시가 부족합니다.");
    document.querySelector(".cash-info").scrollIntoView();
    setTimeout(function () {
      document.querySelector("button.charge-cash").focus();
    }, 500);
    return false;
  }
  return true;
}
