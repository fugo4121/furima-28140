const pay = () => {

  // PAY.JPテスト公開鍵
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // フォーム全体の情報取得
  const form = document.getElementById("charge-form");
  // フォーム送信時
  form.addEventListener("submit", (e) => {
    // railsでのフォーム送信処理キャンセル
    e.preventDefault();
    // フォーム全体の情報取得し、それをサーバーにデータを送信するオブジェクト生成
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // 送信するそれぞれのデータ(name属性から取得)
    const card = {
      number: formData.get("order_address[number]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      cvc: formData.get("order_address[cvc]"),
    };

    // 送信データをトークン化する response:レスポンスの内容
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        // response.idにトークンの値
        const token = response.id;
        // 指定した全体フォームにトークンの入った入力フォームを追加する
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        // Elementのタグの上に挿入
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // 入力した送信データの情報削除(既に別フォームにトークンデータを取得しているため)
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);