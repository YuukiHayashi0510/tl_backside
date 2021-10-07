const validation = () => {
    // 半角数字以外にマッチ
    const loginPattern = /^[\A\d+\z]/;
    // エラーメッセージ
    const loginErrorMessage = document.getElementById("login-error");
    // フォームの要素
    const loginKey = document.getElementById("login-key");

    addEventListener("keyup", e => {
        if ( loginPattern.test(loginKey.value) || loginKey.value == "" ) {
            // loginKeyの内容が指定通りor空白のとき、エラーメッセージを表示しない
            loginErrorMessage.style.visibility = "hidden";
        }
        else {
            loginErrorMessage.style.visibility = "visible";
        }
    })
}

window.addEventListener("load", validation)