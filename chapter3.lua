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

--もしOOが##な場合は$$を出力、そうではない場合は**を出力せよは上記のようにifとelseによって具現できるが、もし多数の条件を具現したい場合は３つの方法がある。
--LuaはC言語のようにswitch-case文を支援しないため、下記のような方法を使う

--1．if-elseif-else文

local value = 2

if value == 1 then
    print("One")
elseif value == 2 then
    print("Two")
elseif value == 3 then
    print("Three")
else
    print("Other")
end

--2．テーブルを使ったディスパッチ

local cases = {
    [1] = function() print("One") end,
    [2] = function() print("Two") end,
    [3] = function() print("Three") end,
}

local value = 2

local case = cases[value]
if case then
    case()  -- 関数を呼び出す
else
    print("Other")
end

--3．関数を使ったディスパッチ

local function handleOne()
    print("One")
end

local function handleTwo()
    print("Two")
end

local function handleThree()
    print("Three")
end

local function handleDefault()
    print("Other")
end

local handlers = {
    [1] = handleOne,
    [2] = handleTwo,
    [3] = handleThree,
}

local value = 2

local handler = handlers[value] or handleDefault
handler()  -- 関数を呼び出す

--偽条件の判定

--一応下記のコードを実行して結果を見ると

local value1 = 1
if value1 then
    print("value1 is true!!")
end

local value2 = 0
if value2 then
    print("value2 is true!!")
end

local value3 = false
if value3 then
    print("value3 is true!!")
end

local value4 = nil
if value4 then
    print("value4 is true!!")
end

--実行結果
--value1 is true!!
--value2 is true!!

--C言語とは違い、0は偽条件じゃない
--Luaではnilやfalseでない場合は処理を行い，そうでない場合は処理を行わない

--ここで関係演算子について紹介する。
1．x < y  ：xがyより小さかったら真,そうでなかったら偽
2．x > y  ：xがyより大きかったら真,そうでなかったら偽
3．x <= y ：xがy以下であれば真,そうでなかったら偽
4．x >= y ：xがy以上であれば真,そうでなかったら偽
5．x == y ：xがyと等しければ真,そうでなかったら偽
6．x ~= y ：xがyと等しくなければ真,そうでなかったら偽

--ここで6番を紹介すると

local value = 1
if value ~= 1 then
    print("Not one")
else
    print("It's one!!")
end

--というコードを実行してみるとその結果は次となる
--It's one!!
--~=はC言語の!=に対応する。

--論理演算子
