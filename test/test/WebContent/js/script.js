// 로그인창으로 가면 메인컨텐츠 숨기고 로그인창 띄우기
$(".squ>div:first-child").on("click", function () {
  $(".wrap").css("display", "none");
  $(".login").css("transform", "translateX(-50%) translateY(-50%)");
  $(".login").css("opacity", "1");
});
// 로그인창에서 X버튼 누르면 로그인창 숨기고 메인컨텐츠 띄우기
$(".login_close").on("click", function () {
  $(".login").css("transform", "translateX(-50%) translateY(80%)");
  $(".login").css("opacity", "0");

  setTimeout(function () {
    $(".wrap").fadeIn();
  }, 200);
});
// 로그인창에서 로그인 버튼 누르면 로그인창 숨기고 메인컨텐츠 띄우기
$(".login_btn").on("click", function () {
  $(".login").css("transform", "translateX(-50%) translateY(80%)");
  $(".login").css("opacity", "0");

  setTimeout(function () {
    $(".wrap").fadeIn();
  }, 200);
});

// 회원가입창으로 가면 메인컨텐츠 숨기고 로그인창 띄우기
$(".squ>div:last-child").on("click", function () {
  $(".wrap").css("display", "none");
  $(".join").css("transform", "translateX(-50%) translateY(-50%)");
  $(".join").css("opacity", "1");
});
// 회원가입창에서 X버튼 누르면 로그인창 숨기고 메인컨텐츠 띄우기
$(".join_close").on("click", function () {
  $(".join").css("transform", "translateX(-50%) translateY(80%)");
  $(".join").css("opacity", "0");

  setTimeout(function () {
    $(".wrap").fadeIn();
  }, 200);
});
// 로그인창에서 로그인 버튼 누르면 로그인창 숨기고 메인컨텐츠 띄우기
$(".join_btn").on("click", function () {
  $(".join").css("transform", "translateX(-50%) translateY(80%)");
  $(".join").css("opacity", "0");

  setTimeout(function () {
    $(".wrap").fadeIn();
  }, 200);
});
