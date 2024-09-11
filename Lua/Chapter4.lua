--関数

410
--関数の作り方

--では関数を作ってみよう！
--関数を作るには下記のようにする。

function　関数名　(引数)
  処理
end

--ここで，二つの値を引数として渡し，その和を求める関数を作ってみよう！

local function sum(x, y)
    return x + y
end
value1 = 1
value2 = 2
result = sum(value1, value2)
print( value1 .. " + " .. value2 .. " = " .. result )

--これを実行すると
--1 + 2 = 3になる。
--ここでlocal function sum(x, y)のx, yは仮引数で実引数はresult = sum(value1, value2)のvalue1, value2である。
--あと、return x + yのx + yとresult = sum(value1, value2)のresultは戻り値である。

--例え、下記のようなコードを書いたとして
local function func(x, y)
  x = 1
  y = 2
end

value1 = 3
value2 = 5
func(value1, value2)

print(value1, value2)

--としても，x,yはvalue1, value2のコピーなので，中身をいくら書き換えても呼び出しもとのvalue1, value2には影響を及ばさない。
--引数に関して、もしかしたら何も受け取る必要がない場合があるかもしれない。そういった場合は、引数の中は空にしておく。

--関数の戻り値

--関数には戻り値と呼ばれるものが存在している。
--上記とその前のコードを見たらreturnは値を関数を呼び出した側に返す命令であって、x+yの計算結果を呼び出し元に返している。
--つまり，変数resultには計算結果が代入される。
--Luaは複数の値を戻り値として返すことができる。例えば，次のようなことができる。

 local function func()
   return 10, 20
 end
 
 value1, value2 = func()
 
 print(value1, value2)

--実行結果
--10, 20

--value1には10が，vlaue2には20が代入される。
--では，次のようなコードを書いた場合どうなるでしょう。

local function func()
   return10, 20
end

value1 = func()

print(value1, value2)

--実行結果
--10 nil

--また，次のようなコードを書いた場合はどうでしょう

local function func()
  return 10
end

vlaue1 = 20

value1, value2 = func()

print(value1, value2)

--実行結果
--10 nil

--第2の戻り値はない。
--この場合，value2にはnilが代入される。value2は20ではないのでご注意！！


--何も返さない関数

--戻り値の関数，つまり何も返さない関数を作ることもできる。その場合returnを書かなければ良い

 local function func()
   print("関数が呼び出されました")
 end
 
 func()

--実行結果
--関数が呼び出されました

--また，明示的に戻り値がないことを示すため，returnだけを書くこともできる。

local function func()
  print("関数が呼び出されました")
  return
end

func()
--上記の二つのコードは全く同じものである。



作成中...
