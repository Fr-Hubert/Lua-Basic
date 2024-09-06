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
--まずは次のコードを見ると
local value1, value2 = 10, 20
if value1 == 10 then
    if value2 == 20 then
        print("Hello")
    end
end

--上記のコードはvalue1が10であり、かつvalue2が20である時Helloを出力するコードである。

--上記のコードを論理演算子を使って書き直すと次のようになる。
local value1, value2 = 10, 20
if value1 == 10 and value2 == 20 then
    print("Hello")
end

--論理演算子には上記のコード以外のこともある。
--1．x == 値1 and y == 値2  xが値1かつyが値2、C言語の&&に対応
--2．x == 値1 or y == 値2   xが値1またはyが値2、C言語の||に対応
--3．Not x                  xの否定、C言語の!に対応

--whileによる繰り返し
--while文は次のように使う
while (条件式) do
    処理
end

--例文
local i = 1
while i <= 10 do
    print("No " .. i)
    i = i + 1
end

--例文の結果
--No 1
--No 2
--No 3
--No 4
--No 5
--No 6
--No 7
--No 8
--No 9
--No 10

while true do
    print("it's true")
end

--上記のwhile文の場合、条件は常に真ということになり、無限ループに陥る。（実行してみてもよいが、おすすめしない）

--forによる繰り返し
--for構文にはNumericforとGenericforの2種類が存在し、Genericforは難しいので、また後の章で説明することとしよう。
--ここではNumericforについて説明していくとNumericforもwhile同様繰り返しの処理を行う場合に使用する。
--ただし，whileとは違い、終了条件が数値でしか指定できない。

--書式は下記のようになる。
for 初期値,終了値,増加量 do
    処理
end

--例文
for i = 1, 10 do     --for i = 1, 10, 1 do と同じ意味である。
    print("No " .. i)
end

--上記のコードはwhile文の例文と同じ結果であり、iを1から10まで1ずつ増加させていく
--つまり，iが10以下の場合に繰り返しが行われる。

--では、2ずつとかそれ以上ずつ増加したい場合を書いてみると
for i = 1, 10, 2 do
    print("No " .. i)
end

--上記のように最後に書く数字を変更するだけで可能になる。
--forを使う上で注意しなければならないことは初期値で定義した変数（ループ変数）はfor文の中でのみ有効だということで、forを抜けた時点でループ変数は消滅してしまう。

--repeatによる繰り返し

--repeatを使ってループを行うこともできる。
--repeatはwhileと違い，repeat内の処理は最低1回は必ず行われる。
--処理を行ったあと、条件式を判定し、条件が真の場合、ループが終了する。

--書式は次となる。
repeat
    処理
until(条件式)
--条件式が偽の場合、処理が繰り返し行われる。
--真の場合ではないので注意するように！

--例文
local i = 1
repeat
    print("No " .. i)
    i = i + 1
until i >= 5

--例文の結果
--No 1
--No 2
--No 3
--No 4

--breakを使ったループの脱出

--繰り返し処理を実行している間にbreak文を使うと、いつでもループから脱出することができる。
--例えば次のようなプログラムを書いたとする。

for i = 0, 10 do
    print("i's value is : " .. i)
    if i == 5 then
        break
    end
end
print("break")

--結果
--i's value is : 0
--i's value is : 1
--i's value is : 2
--i's value is : 3
--i's value is : 4
--i's value is : 5
--break

--breakは必ずブロックの最後でしか使うことができない
--ブロックの最後とは具体的に以下のような場所である。
--1．endの手前
--2．repeat-untilのuntilの手前等

--上記の場所以外ではbreakは定義できない
--しかし、デバッグ中に例えば処理の途中でbreakしたい場合があるかもしれない
--次のようなコードがあったとする。

for i =0, 10 do
    print("なにか処理")
    --本当はここでbreakしたい
    print("別の処理")
end
print("脱出")

--上記のコードのように途中で脱出したい場合はdo-endを使用する。

--do-endの書式は次となる。

do
    処理
end

--よって，次のように書き直せば，処理の途中でbreakが行えるようになる。

for　i =0, 10　do
    print("なにか処理")
    do
        break
    end
    print("別の処理")
end
print("脱出")

--作成中
