------------------------------------------------
--[[　C言語との違い 　　　　　　　　　　　　　　--]]
--[[　1．変数の型を意識しなくてもよい　　　　　　　--]]
--[[　2．変数はいかなるところでも定義できる　　　　--]]
--[[　3．変数は指定が無い限りグローバル変数となる　--]]
------------------------------------------------
--例えvariableという変数を作るとしてそこにはどんな値を入れてもかまわない（変数の型を意識しなくてもよい）
--この表現は正確ではないが，今の段階ではそう思ってもかまわない

variable = 10               --整数
variable = 10.5             --小数
variable = "Hello, World!"  --文字列
variable = 'Lua'            --文字

--上記のように整数、小数、文字列、文字を全部型宣言なしで宣言できる。これがC言語との違い！

--下記の例は全部同じ意味である。

--例１
variable1 = 10 variable2 = 20
--例２
variable1 = 10
variable2 = 20
--例３
variable1, variable2 = 10, 20

--例１，２，３は全部同じ出力結果を出す。

--変数名のルール

--Luaの変数名のルールは他の言語と違いがない

------------------------------------------------
--[[ 次の場合は変数名として使わない（無効）    --]]
--[[ 1．先頭に数字が含まれている              --]]
--[[ 2．予約語                              --]]
--[[ 3．特殊文字や空白                       --]]
--[[ 4．記号や演算子                         --]]
------------------------------------------------

--他の言語と同じくアンダースコア'_'は使用可能

--Luaの予約語一覧
--1．and : 論理演算子で、両方の条件が真である場合に真を返す。C言語の&&に対応する。
--2．break : ループ（forまたはwhile）を即座に終了する。C言語も同じである。
--3．do : コードブロックの開始を示す。複数行のコードを一つのブロックとして扱う。C言語の { } の { に対応する。
--4．else : elseはif条件が偽である場合に実行されるコードブロックを示す。C言語も同じである。
--5．elseif : ifの条件が偽で、追加の条件をチェックする場合に使用する。C言語ではelse ifでelseとifの間に空白があるが、Luaにはない
--6．end : do、if、for、while などのブロックを終了する。C言語の } に対応する。
--7．false : 論理的に偽（false）を表する。C言語も同じである。
--8．for : 指定した回数や範囲で繰り返し処理を行うループを作成する。C言語も同じである。
--9．function : 新しい関数を定義する。C言語にfunctionは存在しないが、関数を定義するための構文はある。
--10．if : 条件に基づいて分岐処理を行う。C言語も同じである。
--11．in : inはforループで範囲や集合の要素を反復処理する際に使う。C言語でinは使用しない。C言語では配列やポインタを使ってループを実装する。
--12．local : ローカルスコープで変数を宣言する。C言語でのローカル変数は { } 内で定義される。
--13．nil : 値が存在しないことを示す。C言語のNULLに対応する。
--14．not : 論理的な否定を行う。C言語の！に対応する。
--15．or : 論理和（OR）を表す。いずれかの条件が真である場合に真を返す。C言語の||に対応する。
--16．repeat : repeatはuntilまで繰り返すループを開始する。untilで指定した条件が真になるまでループを続ける。C言語ではdo-whileループに対応する。
--17．return : 関数からの戻り値を指定する。関数の実行を終了し、指定された値を呼び出し元に返す。C言語も同じである。
--18．then : if文の条件が真である場合に実行されるコードブロックの開始を示す。C言語にthenは存在せず、コードブロック { } で条件が満たされる場合の処理を囲む。
--19．true : 論理的に真を表する。C言語も同じである。
--20．until : repeatループの終了条件を指定する。条件が真になるまでループを続ける。C言語はdo-whileループの条件で同じ機能を実現する。
--21．while : 指定した条件が真である限りループを繰り返す。条件が最初に評価され、条件が偽になるまでループが実行される。C言語も同じである。


--書式指定子
1．%d : 整数の10進法として出力
2．%u : 符号なし整数の10進法として出力
3．%o : 整数の8進法として出力
4．%x : 整数の16進法として出力
5．%f : 小数点表示
6．%c : 1文字出力
7．%% : ％を出力

--算術演算子
1．+ : 
2．- : 
3．* : 
4．/ : 
5．// : 
6．% : 
7．^ : 
--比較演算子
1．== : 
2．~= : 
3．> : 
4．< : 
5．>= : 
6．<= : 




作成中．．．


