--[[【関数】]]--

--[[関数の作り方]]--

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

--[[関数の戻り値]]--

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


--[[何も返さない関数]]--

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


--[[変数に関数を代入する]]--

--Luaの変数にはどんな値でも代入することができる。
--例え関数であろうとも代入が可能！！
--例えば次のようなことも可能である。

local function sum(x, y)
  return x + y
end

local function mul(x, y)
  return x * y
end

local value = sum
print("value is " .. type(value));
print("11 + 13 is " .. value(11, 13))

local value = mul
print("11 * 13 is " .. value(11, 13))

--実行結果
value is function
11 + 13 is 24
11 * 13 is 143

--type関数は現在の変数の型を調べるもので、valueにはsum関数やmul関数を代入している。
--そして、valueを使い、関数にアクセスすることもできる。
--C言語の関数ポインタのようなことができると思ってもよい。


--[[関数中に関数を定義する]]--

--Luaでは関数内に関数を定義することも可能である。

local function func(x)
    local function get()
      return x
    end

    local function add(value)
      x = x + value
    end
    return get, add
end

firstGetValue, firstAddValue = func(10)
secondGetValue,secondAddValue = func(30)

print("firstvalue : " ..firstGetValue())
print("secondvalue : " .. secondGetValue())

firstAddValue(15)
secondAddValue(20)

print("firstvalue : " .. firstGetValue())
print("secondvalue :" .. secondGetValue())
    
--func関数はgetとadd関数を戻り値として返している。

--実行結果
--firstvalue: 10
--secondvalue: 30
--firstvalue: 25
--secondvalue: 50


--[[無名関数]]--

--名前無し関数を作成することも可能である。
--例えば次のようなコードを書くことができる。

local function createSquare()
  return function(x)
    return x * x
  end
end
  
square = createSquare()
print("10 * 10 is " .. square(10, 10) )

--createSquare関数は戻り値にx*xを行う関数を返している。

―‐実行結果
―‐10*10is100

--[[標準ライブラリ]]--

--Luaには標準関数と呼ばれるものが存在する。
--これは，よく使われる処理があらかじめ関数として用意されている。
--例えばprint関数やio.read関数などが標準関数にあたる。

--[[基本ライブラリ]]--

--[assert関数]--

--定義
assert (v[, message])
--assert関数はvが偽条件ならばエラーを発生させる関数である。
--messageにはエラーメッセージを渡し、エラーメッセージは省略可能である。

value = true
assert(value, "Error #1")
value = false
assert(value, "Error #2")

--実行結果
--lua51m.exe:test.lua:4:Error #2
--stacktraceback:
--[C]: infunction assert
--test.lua:4:inmain chunk
--[C]: ?
 
--[dofile関数]--

--定義
dofile(filename)
  
--dofile関数はfilenameで指定したファイルを実行する関数である。
--例えば以下のようにして使う

--今回は例として二つのLuaファイル，test.luaとcall.luaにコードを記述する。
-- call.lua
function testFunc()
  print("Hello")
  return"World!"
end

-- test.lua
dofile("call.lua")

value = testFunc()
print(value)
  
実行結果
Hello
World!
--dofileでcall.luaを読み込む事により，test.lua側でtestFunc関数を利用することができる。

  
--[type関数]--

--定義
type(v)

-- type関数は，データの型を返す関数である。

value = nil
print("value : " .. type(value))
value = 10
print("value : " .. type(value))
value = true
print("value : " .. type(value))
value = "Hello"
print("value : " .. type(value))

--実行結果
--value : nil
--value : number
--value : boolean
--value : string

--[tonumber関数]--
  
--定義
tonumber(e[,base])
--tonumber関数は引数eを数値に変換する関数である。
--数値変換が可能な場合は数値を返し，そうでなければnilを返す。
--また，baseを指定すると，eをbase進法の数値として変換する。
--省略すると，10が自動的に指定される。

value1 = "25"
print("value1 : " .. value1 .. " type : " .. type(value1))
value2 = tonumber(value1)
print("value2 : " .. value2 .. " type : " .. type(value2))

--実行結果
--value1 : 25 type : string
--value2 : 25 type : number

  
 --[tostring関数]--

--定義
tostring(e)
--tostring関数はeを文字列に変換する関数である。

value1 = 25
print("value1 : " .. value1 .. " value1 : " .. type(value1))
value2 = tostring(value1)
print("value2 : " .. value2 .. " type : " .. type(value2))

--実行結果
--value1 : 25 type : number
--value2 : 25 type : string

--数値から文字列に変換する際は，わざわざtostring関数を使用しなくても，空の文字列を追加するだけでよい。
  
value2 = value2 .. ""
