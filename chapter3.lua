--制御文

--if elseによる条件分岐
--felse構文(英語でifはもし～だったら，elseはそうでなかったら，という意味)は,条件分岐をする際に使用する構文である。
--書式
if (条件式) then
    条件式が真であるときの処理
else
    条件式が偽であるときの処理
end

--条件式にはカッコが無くても構わない
--では,実際にif else構文を使ってみよう
--ここでテストの成績を判定するプログラムを作ってみよう
--もし点数が60点以上であったら合格を，そうでなかったら不合格を表示するプログラムを作ると

result = 70             --resultの値は70
if (result >= 60) then  --もしresultが60以上なら（if result >= 60 thenのようにカッコ（）がなくても構わない）
  print("Passed")       --合格を出力せよ
else                    --60以下なら
  print("Failed")       --不用額を出力せよ
end                     --終わり

--もし、ここで点数をキーボードで入力したい場合は下記のように応用ができる。（Chapter2のキーボードからの値の読み込み参照）
result = nil              --resultの初期値はnil
print("Input the Score")  --点数を入力してくださいを出力
result = io.read("*n")    --"*n"によって数値として読み取る
if (result >= 60) then    --もしresultの値が60以上なら
  print("Passed")         --合格を出力せよ
else                      --60以下なら
  print("Failed")         --不合格を出力せよ
end                       --終わり

