# user_example

## 新規登録がうまくいくとき
- nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる
- emailに＠が含まれた状態で登録できる
- passwordが6文字以上で登録できる
- password_confirmationとpasswordが同値であれば登録できる
- passwordは半角英数字混合で登録ができる
- last_name,first_nameは全角で登録できる
- last_name_kana,first_name_kanaは全角（カタカナ）で登録できる


## 新規登録がうまくいかないとき
- nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが空だと登録できない
- passwordが6文字以下だと登録できない
- password_confirmationとpasswordが同値でなければ登録できない
- passwordが存在してもpassword_confirmationが空では登録できない
- emailに＠が含まれないと登録できない
- passwordは半角英数字混合でなければ登録ができない
- last_name,first_nameは全角でなければ登録できない
- last_name_kana,first_name_kanaは全角（カタカナ）でなければ登録できない